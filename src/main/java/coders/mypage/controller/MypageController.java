package coders.mypage.controller;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import coders.common.common.CommandMap;
import coders.common.util.ProFileUtils;
import coders.member.service.MainService;
import coders.mypage.service.MypageService;
import coders.packing.Packaging;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MypageController {
	
	@Resource(name="mypageService")
	private MypageService mypageService;
	@Resource(name = "Packaging")
	private Packaging packaging;
	@Resource(name = "ProfileUtils")
	private ProFileUtils fileUtils;
	@Resource(name="mainService")
	private MainService mainService;
	
	
	@RequestMapping(value = "/Mypage/MypageDetail.do" )
	public String mypage(HttpSession session,HttpServletRequest request) throws Exception {
	return "mypage/mypage";
	}
	
	 @RequestMapping(value = "/Mypage/Mypageing.do")
	 @ResponseBody
	 public List<Map<String, Object>> mypage(HttpServletRequest request) throws Exception{
		 Map<String, Object> fmap = new HashMap<String, Object>();
		 Map<String, Object> smap = new HashMap<String, Object>();
		 fmap.put("USER_NO", request.getParameter("USER_NO"));
		 smap.put("USER_NO", request.getParameter("USER_NO"));
		 String fpn =request.getParameter("F_PAG_NUM");
		String spn = request.getParameter("S_PAG_NUM");
		HashMap<String, Object> hash = new HashMap<String, Object>();
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		if(fpn !=null) {
			int fpnum = Integer.parseInt(fpn);
			int fcount = mypageService.countArlimeList(fmap);
			fmap = packaging.Packag(fmap, fpnum, 5, fcount);
			List<Map<String, Object>> list1 = mypageService.selectFollowList(fmap);
			if(list1.size()>0) {
				for(int i = 0; i<list1.size();i++) {
					hash = new HashMap<String, Object>(list1.get(i));
					jsonObj = new JSONObject();
					jsonObj.putAll(hash);
					jsonArr.add(jsonObj);
				}
				jsonObj = new JSONObject();
				jsonObj.putAll(fmap);
				jsonArr.add(jsonObj);
			}
			
			return jsonArr;
		}if(spn!=null) {
			int spnum = Integer.parseInt(spn);
			int scount = mypageService.countProjectArList(smap);
			smap = packaging.Packag(smap, spnum, 5, scount);
			List<Map<String, Object>> list2 = mypageService.selectScrapList(smap);
			if(list2.size()>0) {
				for(int i = 0; i<list2.size();i++) {
					hash = new HashMap<String, Object>(list2.get(i));
					jsonObj = new JSONObject();
					jsonObj.putAll(hash);
					jsonArr.add(jsonObj);
				}
				jsonObj = new JSONObject();
				jsonObj.putAll(smap);
				jsonArr.add(jsonObj);
			
			}
			return jsonArr;
		}	
		return null;
	 }
	
	//유저 상세정보
	@RequestMapping(value = "/main/Mypage.do")
	public ModelAndView mypageDetail(HttpServletRequest request,HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> mapor = new HashMap<String, Object>();
		String user_no = request.getParameter("USER_NO");
		Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
		mapor.put("USER_NO", user_no);
		Map<String, Object> map = mypageService.selectMypageDetail(mapor);
		mav.addObject("map",map);
		mav.setViewName("/mypage/mypagedetail");
		return mav;
	}
	//수정get
	@RequestMapping(value = "/Mypage/Modify.do",method = RequestMethod.GET)
public ModelAndView mypageModifyForm(HttpSession session)throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String,Object> smap = (Map<String, Object>)session.getAttribute("session");
		Map<String, Object> map = mypageService.selectMypageDetail(smap);
		mav.addObject("map", map);
		mav.setViewName("/mypage/mypage_modify");
		return mav;
	
	}
	//수정post
	@RequestMapping(value = "/Mypage/Modify.do",method = RequestMethod.POST )
public ModelAndView mypageModify(HttpServletRequest request,CommandMap commandMap,HttpSession session)throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map2  = (Map<String, Object>)session.getAttribute("session");
		commandMap.put("USER_NO", map2.get("USER_NO"));
		fileUtils.parseInsertFileInfo(commandMap.getMap(), request);		
		mypageService.updateMypage(commandMap.getMap());
		session.setAttribute("session", mypageService.selectMypageDetail(map2));
		mav.setViewName("redirect:/main/Mypage.do?USER_NO="+map2.get("USER_NO"));
		return mav;
}
	//참가프로젝트리스트
	@RequestMapping(value = "/Mypage/ProjectList.do")
public String projectList(HttpServletRequest request,HttpSession session )throws Exception {
		return "/mypage/myProject";
}
	@RequestMapping(value = "/Mypage/Project.do")
	@ResponseBody
	 public List<Map<String, Object>> Projectlist(HttpServletRequest request) throws Exception{
		 Map<String, Object> wmap = new HashMap<String, Object>();
		 wmap.put("USER_NO", request.getParameter("USER_NO"));
		 String wpn =request.getParameter("PAG_NUM");
		HashMap<String, Object> hash = new HashMap<String, Object>();
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		if(wpn !=null) {
			int fpnum = Integer.parseInt(wpn);
			int fcount = mypageService.countProjectList(wmap);
			wmap = packaging.Packag(wmap, fpnum, 5, fcount);
			List<Map<String, Object>> list1 = mypageService.selectProjectList(wmap);
			if(list1.size()>0) {
				for(int i = 0; i<list1.size();i++) {
					hash = new HashMap<String, Object>(list1.get(i));
					jsonObj = new JSONObject();
					jsonObj.putAll(hash);
					jsonArr.add(jsonObj);
				}
				jsonObj = new JSONObject();
				jsonObj.putAll(wmap);
				jsonArr.add(jsonObj);
			}
			return jsonArr;
		
		}
		return null;
	 }
	//작성글 리스트
	@RequestMapping(value = "/Mypage/WriteList.do")
public String writeList()throws Exception {
		return "/mypage/myWrite";
}
	 @RequestMapping(value = "/Mypage/Writepage.do")
	 @ResponseBody
	 public List<Map<String, Object>> writelist(HttpServletRequest request) throws Exception{
		 Map<String, Object> wmap = new HashMap<String, Object>();
		 wmap.put("USER_NO", request.getParameter("USER_NO"));
		 String wpn =request.getParameter("PAG_NUM");
		HashMap<String, Object> hash = new HashMap<String, Object>();
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		if(wpn !=null) {
			int fpnum = Integer.parseInt(wpn);
			int fcount = mypageService.countWriteList(wmap);
			wmap = packaging.Packag(wmap, fpnum, 5, fcount);
			List<Map<String, Object>> list1 = mypageService.selectWriteList(wmap);
			if(list1.size()>0) {
				for(int i = 0; i<list1.size();i++) {
					hash = new HashMap<String, Object>(list1.get(i));
					jsonObj = new JSONObject();
					jsonObj.putAll(hash);
					jsonArr.add(jsonObj);
				}
				jsonObj = new JSONObject();
				jsonObj.putAll(wmap);
				jsonArr.add(jsonObj);
			}
			return jsonArr;
		}
		return null;
	 }
	//유저삭제
	@RequestMapping(value = "/Mypage/UserDelete.do")
public ModelAndView mypageDelete(HttpSession session)throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
		mypageService.deleteUser(smap);
		session.invalidate();
		mav.setViewName("redirect:../board/mainList.do");
		return mav;
}
	//알림페이지로
	@RequestMapping(value = "/Mypage/Notification.do")
public String selectArlimeList()throws Exception {
		return "/mypage/Notification";
}
	 @RequestMapping(value = "/Mypage/Notpage.do")
	 @ResponseBody
public List<Map<String, Object>> notpage(HttpServletRequest request) throws Exception{
	Map<String, Object> bmap = new HashMap<String, Object>();
	Map<String, Object> pmap = new HashMap<String, Object>();
	bmap.put("USER_NO", request.getParameter("USER_NO"));
	pmap.put("USER_NO", request.getParameter("USER_NO"));
	String bpn =request.getParameter("B_PAG_NUM");
	String ppn = request.getParameter("P_PAG_NUM");
	HashMap<String, Object> hash = new HashMap<String, Object>();
	JSONObject jsonObj = new JSONObject();
	JSONArray jsonArr = new JSONArray();
	if(bpn !=null) {
		int bpnum = Integer.parseInt(bpn);
		int bcount = mypageService.countArlimeList(bmap);
		bmap = packaging.Packag(bmap, bpnum, 5, bcount);
		List<Map<String, Object>> list1 = mypageService.selectArlimeList(bmap);
		if(list1.size()>0) {
			for(int i = 0; i<list1.size();i++) {
				hash = new HashMap<String, Object>(list1.get(i));
				jsonObj = new JSONObject();
				jsonObj.putAll(hash);
				jsonArr.add(jsonObj);
			}
			jsonObj = new JSONObject();
			jsonObj.putAll(bmap);
			jsonArr.add(jsonObj);
		}
		return jsonArr;
	}
	if(ppn!=null) {
		int ppnum = Integer.parseInt(ppn);
		int pcount = mypageService.countProjectArList(pmap);
		pmap = packaging.Packag(pmap, ppnum, 5, pcount);
		List<Map<String, Object>> list2 = mypageService.selectProjetArList(pmap);
		if(list2.size()>0) {
			for(int i = 0; i<list2.size();i++) {
				hash = new HashMap<String, Object>(list2.get(i));
				jsonObj = new JSONObject();
				jsonObj.putAll(hash);
				jsonArr.add(jsonObj);
			}
			jsonObj = new JSONObject();
			jsonObj.putAll(pmap);
			jsonArr.add(jsonObj);
			
		
	}	return jsonArr;
	
}return null;
	}
	
	//작성글 알림 삭제
	@RequestMapping(value = "/Mypage/ArlistClick.do")
	public ModelAndView clickArlist(CommandMap map)throws Exception {
		ModelAndView mav = new ModelAndView();
		mypageService.clickArlist(map.getMap());
		 
		mav.setViewName("redirect:/board/detail.do?BOARD_NO="+map.get("BOARD_NO")+"&IDENTI_TYPE="+map.get("IDENTI_TYPE"));
		return mav;
		
	}
	//프로젝트 알림삭제
	@RequestMapping(value = "/Mypage/ProjectArClick.do")
	public ModelAndView clickProjectAr(CommandMap map,HttpSession session)throws Exception{
		ModelAndView mav = new ModelAndView();
		Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
		map.put("USER_NO", smap.get("USER_NO"));
		mypageService.clickProjectAr(map.getMap());
		mav.setViewName("redirect:/Team/List.do?PROJECT_NO="+map.get("PROJECT_NO"));
		return mav;
		
	}
	//팔로우추가
	@RequestMapping(value = "/Mypage/insertFollow.do")
	public ModelAndView insertFollow(HttpServletRequest request,HttpSession session)throws Exception {
		String follower = request.getParameter("USER_NO");
		ModelAndView mav = new ModelAndView();
		Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
		smap.put("FOLLOWER", follower);
		int ch = mypageService.checkFollw(smap);
		if(ch>0) {
			mav.addObject("msg", "이미 팔로우 하셨습니다");
			mav.addObject("url", "../main/Mypage.do?USER_NO="+follower);
			mav.setViewName("/mypage/redirect");
			return mav;
		}else {
			mypageService.insertFollow(smap);
			mav.addObject("msg", "팔로우 하셨습니다");
			mav.addObject("url", "../main/Mypage.do?USER_NO="+follower);
			mav.setViewName("/mypage/redirect");
			return mav;}
	}
	//스크랩추가
	@RequestMapping(value = "/Mypage/insertScrap.do")
	public String insertScrap(HttpServletRequest request,HttpSession session)throws Exception {
		String BOARD_NO = request.getParameter("USER_NO");
		Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
		smap.put("BOARD_NO", BOARD_NO);
		mypageService.insertFollow(smap);
		return "redirect:/board/detail.do?BOARD_NO="+BOARD_NO;
		
	}
	@RequestMapping(value = "/Mypage/Delete.do")
	public String deleteUser(HttpSession session)throws Exception{
		Map<String, Object> map =(Map<String, Object>)session.getAttribute("session");
		mypageService.deleteUser(map);
		return "redirect:../main/logout.do";
	}
	
	@RequestMapping(value = "/Mypage/RepostUser.do")
	public ModelAndView repostUser(CommandMap map)throws Exception{
		
		mypageService.repostUser(map.getMap());
		if(mypageService.countUserReport(map.getMap()) != null) {//신고수20회 이상시 유저 정지
			mypageService.updateUserDisabled(map.getMap());
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "신고하셨습니다");
		mav.addObject("url", "../board/mainList.do");
		mav.setViewName("/mypage/redirect");
		return mav;
				
	}
	
	@RequestMapping(value = "/Mypage/DeleteFollower.do")
	public ModelAndView deleteFollower(CommandMap map)throws Exception{
		mypageService.deleteFollow(map.getMap());
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "팔로우를 해제 했습니다");
		mav.addObject("url", "../main/Mypage.do?USER_NO="+map.get("USER_NO"));
		mav.setViewName("/mypage/redirect");
		return mav;
	}
	@RequestMapping(value = "/Mypage/DeleteScarap.do")
	public ModelAndView deleteScarap(CommandMap map)throws Exception{
		mypageService.deleteScarap(map.getMap());
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "스크랩을 해제 했습니다");
		mav.addObject("url", "../main/Mypage.do?USER_NO="+map.get("USER_NO"));
		mav.setViewName("/mypage/redirect");
		return mav;
	}

}
