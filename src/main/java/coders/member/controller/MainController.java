package coders.member.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import coders.common.common.CommandMap;
import coders.member.service.MainService;
import coders.mail.service.MailSendService;

@Controller
public class MainController {
	
	@Resource(name="mainService")
	private MainService mainService;
	@Resource(name="mss")
	private MailSendService mailSendService;
	
	@RequestMapping(value="/main/Login.do", method = RequestMethod.GET)
	public ModelAndView loginForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/main/login");
		
		return mv;
	}
	
	
	@RequestMapping(value="/main/Login.do", method = RequestMethod.POST)
	public ModelAndView login(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/mainList.do");
		
		commandMap.put("EMAIL", request.getParameter("EMAIL"));
		commandMap.put("PASSWORD", request.getParameter("PASSWORD"));
		
		Map<String, Object> map = mainService.selectLoginUser(commandMap.getMap());
		
		
		/*Enumeration enumeration = request.getParameterNames(); // submit을 통해 받은 input 값들
		 
		while (enumeration.hasMoreElements()) {
		  String key = (String)enumeration.nextElement(); // 요소를 받습니다.
		  String val[] = request.getParameterValues(key); // 받은 요소의 name 값을 request 로 부터 찾아옵니다.
		 
		  for (int i = 0; i < val.length; i++) {
		    map.put(key, val);	// map에 key : value 형태로 값을 저장합니다.
		    System.out.println("request : " + key + " = " + val[i]); // 출력하기
		  }
		}*/
		
		mv.addObject("user", map);
		session.setAttribute("session", map);//로그인 유저 정보 세션에 저장
		return mv;
	}
	
	
	@RequestMapping(value="/main/RegisterForm.do", method = RequestMethod.GET)
	public ModelAndView registerForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/main/register");
		
		return mv;
	}
	
	
	@RequestMapping(value="/main/RegisterInsert.do", method = RequestMethod.POST)
	public ModelAndView registerInsert(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/main/Login.do");
		
		commandMap.put("NICK_NAME", request.getParameter("NICK_NAME"));
		commandMap.put("EMAIL", request.getParameter("EMAIL"));
		commandMap.put("PASSWORD", request.getParameter("PASSWORD"));
		commandMap.put("PROFILE", "https://cdn.discordapp.com/attachments/934773446431346706/940842849874878484/profile.jpg");
		mailSendService.sendAuthMail((String)request.getParameter("EMAIL"));
		mainService.insertUser(commandMap.getMap());
		
		return mv;
	}
	
	
	@RequestMapping(value="/main/FindId.do", method = RequestMethod.GET)
	public ModelAndView findId(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/main/id_find");
		
		return mv;
	}
	
	
	@RequestMapping(value="/main/FindPw.do", method = RequestMethod.GET)
	public ModelAndView findPw(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/main/pw_find");
		
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
	
}
