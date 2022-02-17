package coders.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import coders.common.common.CommandMap;
import coders.common.common.ProFileUtils;
import coders.mypage.service.MypageService;
import coders.packing.Packaging;

import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	@Resource(name = "Packaging")
	private Packaging packaging;
	@Resource(name = "ProfileUtils")
	private ProFileUtils fileUtils;
	
	@RequestMapping(value = "/Mypage/MypageDetail.do" )
	public ModelAndView mypage(HttpSession session,HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> mapor = new HashMap<String, Object>();
		String user_no = request.getParameter("USER_NO");
		Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
		mav.setViewName("mypage/mypage");
		mapor.put("USER_NO", user_no);
		System.out.println(mapor);
		List<Map<String, Object>> flist = mypageService.selectFollowList(mapor);
		List<Map<String, Object>> slist = mypageService.selectScrapList(mapor);
		int count = flist.size();
		int pnum = 1;
		System.out.println(count);
		String pnums = request.getParameter("PAG_NUM");
		if(pnums!=null) {
			pnum = Integer.parseInt(pnums);
		}
		smap = packaging.Packag(smap, pnum, 2, count);
		mav.addObject("flist",flist);
		mav.addObject("slist",slist);
		mav.addObject("USER_NO",user_no);
		mav.addObject("smap", smap);
		mav.addObject("PAG_NUM", pnums);
		System.out.println(count);
		
		if(smap !=null) {
			String suser_no = String.valueOf(smap.get("USER_NO"));
		if(user_no.equals(suser_no) ) {
			mav.addObject("CHECK","Y");
			return mav;}}
		mav.addObject("CHECK","N");
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
		mav.addObject("USER_NO",user_no);
		if(smap !=null) {
			String suser_no = String.valueOf(smap.get("USER_NO"));
		if(user_no.equals(suser_no) ) {
			mav.addObject("CHECK","Y");
			return mav;}}
		mav.addObject("CHECK","N");
		return mav;
	}
	//수정get
	@RequestMapping(value = "/Mypage/Modify.do",method = RequestMethod.GET)
public ModelAndView mypageModifyForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = (Map<String, Object>)session.getAttribute("session");
		mav.addObject("map", map);
		mav.setViewName("/mypage/mypage_modify");
		return mav;
	
	}
	//수정post
	@RequestMapping(value = "/Mypage/Modify.do",method = RequestMethod.POST )
public ModelAndView mypageModify(HttpServletRequest request,CommandMap commandMap,HttpSession session)throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map2  = (Map<String, Object>)session.getAttribute("session");
		Map<String, Object> map = new HashMap<String, Object>();
		commandMap.put("USER_NO", map2.get("USER_NO"));;
		if(!commandMap.get("PASSWORD").equals(commandMap.get("PASSWORD2"))) {
			mav.setViewName("redirect:/Mypage/Modify.do");
			mav.addObject("pas", "Y");
			return mav;
		}
		fileUtils.parseInsertFileInfo(commandMap.getMap(), request);
		System.out.println(commandMap.getMap());
		mypageService.updateMypage(commandMap.getMap());
		mav.setViewName("redirect:/main/Mypage.do?USER_NO="+map2.get("USER_NO"));
		return mav;
}
	//팔로우리스트
	@RequestMapping(value = "/Mypage/Follow.do")
public ModelAndView followList(HttpServletRequest request,HttpSession session) {
		Map<String, Object> mapor = new HashMap<String, Object>();
		Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
		String user_no = request.getParameter("USER_NO");
		mapor.put("USER_NO", user_no);
		ModelAndView mav = new ModelAndView("/mypage/follow");
		mav.addObject("USER_NO",user_no);
		if(smap !=null) {
			String suser_no = String.valueOf(smap.get("USER_NO"));
		if(user_no.equals(suser_no) ) {
			mav.addObject("CHECK","Y");
			return mav;}}
		mav.addObject("CHECK","N");
		return mav;
}
	//참가프로젝트리스트
	@RequestMapping(value = "/Mypage/ProjectList.do")
public ModelAndView projectList(HttpServletRequest request,HttpSession session )throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> mapor = new HashMap<String, Object>();
		Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
		String user_no = request.getParameter("USER_NO");
		mapor.put("USER_NO", user_no);
		List<Map<String, Object>> list = mypageService.selectProjectList(mapor);
		mav.addObject("list",list);
		mav.setViewName("/mypage/myProject");
		mav.addObject("USER_NO",user_no);
		if(smap !=null) {
			String suser_no = String.valueOf(smap.get("USER_NO"));
		if(user_no.equals(suser_no) ) {
			mav.addObject("CHECK","Y");
			return mav;}}
		mav.addObject("CHECK","N");
		return mav;
}
	//작성글 리스트
	@RequestMapping(value = "/Mypage/WriteList.do")
public ModelAndView writeList(HttpServletRequest request,HttpSession session )throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> mapor = new HashMap<String, Object>();
		Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
		String user_no = request.getParameter("USER_NO");
		mapor.put("USER_NO",user_no );
		List<Map<String, Object>> list = mypageService.selectWriteList(mapor);
		System.out.println(list);
		mav.addObject("list",list);
		mav.setViewName("/mypage/myWrite");
		mav.addObject("USER_NO",user_no);
		if(smap !=null) {
			String suser_no = String.valueOf(smap.get("USER_NO"));
		if(user_no.equals(suser_no) ) {
			mav.addObject("CHECK","Y");
			return mav;}}
		mav.addObject("CHECK","N");
		return mav;
}
	//유저삭제
	@RequestMapping(value = "/Mypage/UserDelete.do")
public ModelAndView mypageDelete(HttpSession session)throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
		mypageService.deleteUser(smap);
		mav.setViewName("redirect:/userDelete");
		return mav;
}
	//알림페이지로
	@RequestMapping(value = "/Mypage/Notification.do")
public ModelAndView selectArlimeList(HttpSession session)throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
		List<Map<String, Object>> list1 = mypageService.selectArlimeList(smap);
		List<Map<String, Object>> list2 = mypageService.selectProjetArList(smap);
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("smap", smap);
		mav.setViewName("/mypage/Notification");
		return mav;
}
	//작성글 알림 삭제
	@RequestMapping(value = "/Mypage/ArlistClick.do")
	public ModelAndView clickArlist(HttpServletRequest request)throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> mapor = new HashMap<String, Object>();
		String no = request.getParameter("BOARD_NO");
		 mapor.put("BOARD_NO", no); mypageService.clickArlist(mapor);
		mav.setViewName("redirect:/board/detail.do?BOARD_NO="+no);
		return mav;
		
	}
	//프로젝트 알림삭제
	@RequestMapping(value = "/Mypage/ProjectArClick.do")
	public ModelAndView clickProjectAr(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> mapor = new HashMap<String, Object>();
		String no = request.getParameter("PROJECT_NO");
		mav.setViewName("redirect:/Project/Team.do?PROJECT_NO="+no);
		return mav;
		
	}
	//팔로우추가
	@RequestMapping(value = "/Mypage/insertFollow.do")
	public String insertFollow(HttpServletRequest request,HttpSession session)throws Exception {
		String follower = request.getParameter("USER_NO");
		Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
		if(smap==null) {
			//로그인 안함
			return "redirect:/main/Mypage.do?USER_NO="+follower;}
		String user_no	= String.valueOf(smap.get("USER_NO"));
		if(user_no.equals(follower)) {
			//자기자신팔로우
			return "redirect:/main/Mypage.do?USER_NO="+follower;
		}
		smap.put("FOLLOWER", follower);
		mypageService.insertFollow(smap);
		return "redirect:/main/Mypage.do?USER_NO="+follower;
		
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

}
