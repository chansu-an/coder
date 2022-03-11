package coders.mypage.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import coders.common.common.CommandMap;
import coders.common.util.ProFileUtils;
import coders.member.service.MainService;
import coders.mypage.service.MypageService;
import coders.packing.Packaging;

import org.springframework.web.bind.annotation.RequestMethod;

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
	public ModelAndView mypage(HttpSession session,HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> fmap = new HashMap<String, Object>();
		Map<String, Object> smap = new HashMap<String, Object>();
		fmap.put("USER_NO", request.getParameter("USER_NO"));
		smap.put("USER_NO", request.getParameter("USER_NO"));
		int fpnum = 1;
		String fpnums = request.getParameter("F_PAG_NUM");
		if(fpnums!=null) {
			fpnum = Integer.parseInt(fpnums);
		}
		int spnum = 1;
		String spnums = request.getParameter("S_PAG_NUM");
		if(spnums!=null) {
			spnum = Integer.parseInt(spnums);
		}
		
		int fcount = mypageService.countFollowList(fmap);
		int scount = mypageService.countScrapList(smap);
		smap = packaging.Packag(smap,spnum, 5, scount);
		fmap = packaging.Packag(fmap,fpnum, 5, fcount);
		mav.setViewName("mypage/mypage");
		List<Map<String, Object>> flist = mypageService.selectFollowList(fmap);
		List<Map<String, Object>> slist = mypageService.selectScrapList(smap);
		mav.addObject("flist",flist);
		mav.addObject("slist",slist);
		mav.addObject("smap", smap);
		mav.addObject("fmap", fmap);
		return mav;
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
public ModelAndView projectList(HttpServletRequest request,HttpSession session )throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> mapor = new HashMap<String, Object>();
		String user_no = request.getParameter("USER_NO");
		mapor.put("USER_NO", user_no);
		int pnum = 1;
		String pnums = request.getParameter("PAG_NUM");
		if(pnums!=null) {
			pnum = Integer.parseInt(pnums);
		}
		int count = mypageService.countProjectList(mapor);
		mapor = packaging.Packag(mapor, pnum, 5, count);
		List<Map<String, Object>> list = mypageService.selectProjectList(mapor);
		mav.addObject("map", mapor);
		mav.addObject("list",list);
		mav.setViewName("/mypage/myProject");
		return mav;
}
	//작성글 리스트
	@RequestMapping(value = "/Mypage/WriteList.do")
public ModelAndView writeList(HttpServletRequest request,HttpSession session )throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> mapor = new HashMap<String, Object>();
		String user_no = request.getParameter("USER_NO");
		mapor.put("USER_NO",user_no);
		int pnum = 1;
		String pnums = request.getParameter("PAG_NUM");
		if(pnums!=null) {
			pnum = Integer.parseInt(pnums);
		}
		int count = mypageService.countWriteList(mapor);
		mapor = packaging.Packag(mapor, pnum, 5, count);
		List<Map<String, Object>> list = mypageService.selectWriteList(mapor);
		mav.addObject("list",list);
		mav.addObject("map", mapor);
		mav.setViewName("/mypage/myWrite");
		return mav;
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
public ModelAndView selectArlimeList(HttpServletRequest request)throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> bmap = new HashMap<String, Object>();
		Map<String, Object> pmap = new HashMap<String, Object>();
		bmap.put("USER_NO", request.getParameter("USER_NO"));
		pmap.put("USER_NO", request.getParameter("USER_NO"));
		int bpnum = Integer.parseInt(request.getParameter("B_PAG_NUM"));
		int ppnum = Integer.parseInt(request.getParameter("P_PAG_NUM"));
		int pcount = mypageService.countProjectArList(pmap);
		int bcount = mypageService.countArlimeList(bmap);
		bmap = packaging.Packag(bmap, bpnum, 5, bcount);
		pmap = packaging.Packag(pmap, ppnum, 5, pcount);
		
		List<Map<String, Object>> list1 = mypageService.selectArlimeList(bmap);
		List<Map<String, Object>> list2 = mypageService.selectProjetArList(pmap);
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("bmap", bmap);
		mav.addObject("pmap", pmap);	
		mav.setViewName("/mypage/Notification");
		return mav;
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
