package coders.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import coders.common.common.CommandMap;
import coders.mail.service.MailSendService;
import coders.mail.service.MailSendService2;
import coders.member.NaverLoginVO;
import coders.member.service.MainService;
import coders.mypage.service.MypageService;
import coders.packing.Packaging;

@Controller
public class MainController {
	/* naverLoginVO */
    private NaverLoginVO naverLoginVO;
    private String apiResult = null;
    private String authKey = null;
	
    @Autowired
    private void setnaverLoginVO(NaverLoginVO naverLoginVO) {
        this.naverLoginVO = naverLoginVO;
    }
	
	@Resource(name="mainService")
	private MainService mainService;
	@Resource(name="mypageService")
	private MypageService mypageService;
	@Resource(name="mss")
	private MailSendService mailSendService;
	@Resource(name="mss2")
	private MailSendService2 mailSendService2;
	@Resource(name="Packaging")
	private Packaging packaging;
	
	@RequestMapping(value="/main/Login.do", method = RequestMethod.GET)
	public ModelAndView loginForm(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/main/login");

		String naverAuthUrl = naverLoginVO.getAuthorizationUrl(session);
		
		if(request.getParameter("checklogin") == null) {
			mv.addObject("checklogin", true);
		}else {
			mv.addObject("checklogin", request.getParameter("checklogin"));			
		}
		
		if(request.getParameter("del_gb") != null) {
			mv.addObject("del_gb", request.getParameter("del_gb"));
		}
		
		mv.addObject("url", naverAuthUrl);
		
		return mv;
	}
	
	
	@RequestMapping(value="/main/Login.do", method = RequestMethod.POST)
	public ModelAndView login(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = mainService.selectLoginUser(commandMap.getMap());
		if(map == null) {
			mv.setViewName("redirect:/main/Login.do");			
			mv.addObject("checklogin", false);
			return mv;
		}else if(map.get("DEL_GB").equals("Y") || map.get("USER_STOP").equals("Y")){//정지회원이나 탈퇴회원시
			mv.setViewName("redirect:/main/Login.do");
			mv.addObject("del_gb", "Y");
			return mv;
		}else {
			mv.setViewName("redirect:/board/mainList.do");
		}
		mv.addObject("user", map);		
		session.setAttribute("session", map);//로그인 유저 정보 세션에 저장
		return mv;
	}
	
	//네이버 로그인시
	@RequestMapping(value="/main/naverLogin.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView naverLogin(CommandMap commandMap, HttpServletRequest request, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/mainList.do");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginVO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginVO.getUserProfile(oauthToken);
        
        JSONParser parser = new JSONParser();

		JSONObject jsonObjAll = (JSONObject) parser.parse(apiResult);
		
		String result = jsonObjAll.get("response").toString();
				
		JSONObject jsonObj = (JSONObject) parser.parse(result);
		
		
		String member_nickname = jsonObj.get("nickname").toString();					
		String member_name = jsonObj.get("name").toString();					
		String member_email = jsonObj.get("email").toString();
		String member_profile = jsonObj.get("profile_image").toString();
		
		//map객체에 네이버 url에서 가져온 데이터 넣는작업
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("EMAIL", member_email);
		map.put("NICK_NAME", member_name);
		map.put("PASSWORD", "1111111");//임의값 넣었음
		map.put("PROFILE", member_profile);
		
		if(mainService.confirmNaverId(map) == null) {
			mainService.insertUser(map);			
		}
		
		//세션에 넣을 user 데이터 담을 Map
		Map<String, Object> map2 = mainService.selectNaverLogin(map);
		//프로필 url값
		//mv.addObject("image", member_profile);//네이버 url에서 가져온 사용사 프로필 사진
		//mv.addObject("userimages", user_profile_images.get("PROFILE"));데이터 베이스에 저장된 사용자 프로필 url
		
		session.setAttribute("session", map2);
        /* 네이버 로그인 성공 페이지 View 호출 */
        return mv;
	}
	
	
	@RequestMapping(value="/main/RegisterForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView registerForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/main/register");
		
		return mv;
	}
	
	@RequestMapping(value="/main/checkUserNickName.do", method = RequestMethod.POST)
	@ResponseBody
	public String checkUserNickName(@RequestBody String ID) throws Exception{
		String result2 = null; 
		String result = mainService.confirmUser(ID);
		
		if(result == null) {
			result2 = "0";//아이디없음
		}else {
			result2 = "1";//중복 아이디있음
		}
		return result2;
	}
	
	
	@RequestMapping(value="/main/RegisterInsert.do", method = RequestMethod.POST)
	public ModelAndView registerInsert(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/main/Login.do");
		
		commandMap.put("PROFILE", "TEMP");
		mailSendService.sendAuthMail((String)request.getParameter("EMAIL"));
		mainService.insertUser(commandMap.getMap());
		
		return mv;
	}
	
	
	@RequestMapping(value="/main/FindPw.do", method = RequestMethod.GET)
	public ModelAndView findPw(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/main/pw_find");
		
		if(request.getParameter("authKey") != null) {
			mv.addObject("authKey", request.getParameter("authKey"));
		}
		
		return mv;
	}
	
	@RequestMapping(value="/main/UserList.do", method = RequestMethod.GET)
	public ModelAndView userList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("/main/userList");

		String page = request.getParameter("PAG_NUM");
		int count;
		int pag = 1;
		if(page!=null) {
			pag = Integer.parseInt(page);
		}
		count = mainService.countUser(commandMap.getMap());
		packaging.Packag(commandMap.getMap(), pag, 10, count);
		
		List<Map<String, Object>> list = mainService.selectUserList(commandMap.getMap());

		mav.addObject("list", list);
		mav.addObject("map", commandMap.getMap());
		return mav;
	}
	
	//탈퇴회원(탈퇴 후 7일 이내 / DB에 남아있는 회원) 복구
	@RequestMapping(value="/main/restoreUser.do")
	public ModelAndView restoreUser(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/main/UserList.do");
		commandMap.put("USER_NO", Integer.parseInt(request.getParameter("USER_NO")));
			
		mainService.restoreUser(commandMap.getMap());
			
		return mav;
	}
	//정지회원 복구
	@RequestMapping(value="/main/returnUserDisabled.do")
	public ModelAndView returnUserDisabled(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/main/UserList.do");
		commandMap.put("USER_NO", Integer.parseInt(request.getParameter("USER_NO")));
			
		mainService.returnUserDisabled(commandMap.getMap());
			
		return mav;
	}
	
	@RequestMapping(value="/main/logout.do", method = RequestMethod.GET)
	public ModelAndView logoutUser(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/main/Login.do");
		
		HttpSession session = request.getSession();
        
        session.invalidate();
		
		return mv;
	}
	
	@RequestMapping(value="/main/findPassword.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView findPassword(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		authKey = mailSendService2.sendAuthMail((String)request.getParameter("EMAIL"));		
		
		commandMap.put("authKey", authKey);
		mainService.modifyPassword(commandMap.getMap());
		ModelAndView mv = new ModelAndView("redirect:/main/FindPw.do?authKey=" + authKey);
		
		return mv;
	}
	
}
