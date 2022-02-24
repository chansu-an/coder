package coders.application.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		commandMap.put("PROJECT_NO", "73");
		commandMap.put("USER_NO", "1");
		List<Map<String, Object>> list = applicationService.selectApplicationList(commandMap.getMap());
		List<Map<String, Object>> list1 = applicationService.selectMemberList(commandMap.getMap());
		System.out.println(commandMap.getMap());
		mav.addObject("list", list);
		mav.addObject("list1", list1);
		return mav;
	}

}
