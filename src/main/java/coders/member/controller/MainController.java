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
	
	@RequestMapping(value="/main/Login.do", method = RequestMethod.GET)
	public ModelAndView loginForm(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/main/login");

		String naverAuthUrl = naverLoginVO.getAuthorizationUrl(session);
		
		if(request.getParameter("checklogin") == null) {
			mv.addObject("checklogin", true);
		}else {
			mv.addObject("checklogin", request.getParameter("checklogin"));			
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
		System.out.println("jsonObjAll: "+jsonObjAll.toJSONString());
		String result = jsonObjAll.get("response").toString();
				
		JSONObject jsonObj = (JSONObject) parser.parse(result);
		System.out.println("jsonObj: "+jsonObj.toJSONString());
		
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
		
		if(mainService.selectNaverLogin(map) == null) {
			mainService.insertUser(map);			
		}
		
		//데이터베이스에서 사용자 프로필 사진 URL 가져오기
		Map<String, Object> user_profile_images = mainService.selectNaverLogin(map);
		System.out.println(member_nickname);
		System.out.println(member_name);
		System.out.println(member_email);
		System.out.println(member_profile);
		
		mv.addObject("result", apiResult);
		//프로필 url값
		mv.addObject("image", member_profile);//네이버 url에서 가져온 사용사 프로필 사진
		mv.addObject("userimages", user_profile_images.get("PROFILE"));//데이터 베이스에 저장된 사용자 프로필 url
		
		session.setAttribute("session", map);
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
	public ModelAndView userList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/main/userList");
		
		List<Map<String, Object>> list = mainService.selectUserList(commandMap.getMap());
		
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping(value="/main/DeleteUserList.do", method = RequestMethod.GET)
	public ModelAndView deleteUserList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/main/deleteUserList");
		
		List<Map<String, Object>> list = mainService.selectDeleteUserList(commandMap.getMap());
		
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping(value="/main/StopUserList.do", method = RequestMethod.GET)
	public ModelAndView stopUserList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/main/stopUserList");
		
		List<Map<String, Object>> list = mainService.selectStopUserList(commandMap.getMap());
		
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping(value="/main/logout.do", method = RequestMethod.GET)
	public ModelAndView logoutUser(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/main/Login.do");
		
		HttpSession session = request.getSession();
        
        session.invalidate();
		
		return mv;
	}
	
	@RequestMapping(value="/main/findPassword.do", method = {RequestMethod.POST, RequestMethod.GET})
	public void findPassword(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		authKey = mailSendService2.sendAuthMail((String)request.getParameter("EMAIL"));		
		
	}
	
	@RequestMapping(value="/main/findPasswordConfirm.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView findPasswordConfirm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/main/FindPw.do?authKey=" + request.getParameter("authKey"));
		
		System.out.println("인증후1 : " + request.getParameter("EMAIL"));
		System.out.println("인증후2 : " + request.getParameter("authKey"));
		System.out.println("인증후3 : " + authKey);
		System.out.println("인증후4 : " + commandMap.getMap());
		mainService.modifyPassword(commandMap.getMap());
		
		return mv;
	}
	
}
