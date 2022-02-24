package coders.application.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import coders.application.service.ApplicationService;
import coders.common.common.CommandMap;

@Controller
public class ApplicationController {
	
	@Resource(name="applicationService")
	private ApplicationService applicationService;
	
	@RequestMapping(value= "/Project/Applist.do")
	public ModelAndView ApplicationList(CommandMap commandMap) throws Exception{
		ModelAndView mav = new ModelAndView("/application/applicationList");
		List<Map<String, Object>> list = applicationService.selectApplicationList(commandMap.getMap());
		List<Map<String, Object>> list1 = applicationService.selectMemberList(commandMap.getMap());
		mav.addObject("list", list);
		mav.addObject("list1", list1);
		return mav;
	}
	@RequestMapping(value= "/Project/Appjoin.do")
	public ModelAndView insertProjectApp(HttpSession session,HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:/Project/Detail.do?PROJECT_NO=" + request.getParameter("PROJECT_NO"));
		Map<String, Object> map = (Map<String, Object>)session.getAttribute("session");
		map.put("PROJECT_NO",request.getParameter("PROJECT_NO"));
		applicationService.insertProjectApp(map);
		return mav;
	
	}
	
	@RequestMapping(value= "/Project/ProjectApp.do")
	public ModelAndView ProjectApp(HttpSession session, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:/Project/Applist.do");
		Map<String, Object> map = (Map<String, Object>)session.getAttribute("session");
		map.put("PROJECT_NO", request.getParameter("PROJECT_NO"));
		applicationService.ProjectApp(map);
		return mav;
	}
}
