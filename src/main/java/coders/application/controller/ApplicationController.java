package coders.application.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import coders.application.service.ApplicationService;
import coders.common.common.CommandMap;
import coders.project.service.ProjectService;
import coders.resume.service.ResumeService;

@Controller
public class ApplicationController {
	
	@Resource(name="applicationService")
	private ApplicationService applicationService;
	@Resource(name = "projectService")
	private ProjectService projectService;

	@RequestMapping(value= "/Project/Applist.do")
	public ModelAndView ApplicationList(CommandMap commandMap) throws Exception{
		ModelAndView mav = new ModelAndView("/application/applicationList");
		Map<String, Object> map =projectService.selectProjectDetail(commandMap.getMap());
		List<Map<String, Object>> list = applicationService.selectApplicationList(commandMap.getMap());
		List<Map<String, Object>> list1 = applicationService.selectMemberList(commandMap.getMap());
		mav.addObject("list", list);
		mav.addObject("list1", list1);
		mav.addObject("map", map.get("map"));
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
	public ModelAndView ProjectApp(CommandMap commandMap  , HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:/Project/Applist.do?PROJECT_NO=" + commandMap.get("PROJECT_NO"));
		applicationService.ProjectApp(commandMap.getMap());
		return mav;
	}
}
