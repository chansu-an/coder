package coders.project.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import coders.common.common.CommandMap;
import coders.common.service.CommonProjectService;
import coders.project.service.ProjectService;

@Controller
public class ProjectController {

	@Resource(name = "projectService")
	private ProjectService projectService;

//	프로젝트 리스트
	@RequestMapping(value = "/Project/Project.do")
	public ModelAndView ProjectList(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView("/project/project_board_list");

		// 추가 02.15
		/* projectService.insertProject(commandMap.getMap(),request); */

		List<Map<String, Object>> list = projectService.selectProjectList(commandMap.getMap());
		List<Map<String, Object>> list1 = projectService.selectProjectSList(commandMap.getMap());
		List<Map<String, Object>> list2 = projectService.selectProjectEList(commandMap.getMap());
		mav.addObject("list", list);
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		return mav;
	}

//프로젝트 작성폼
	@RequestMapping(value = "/Project/Write.do", method = RequestMethod.GET)
	public ModelAndView ProjectWriteForm(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("/project/project_board_write");

		return mav;
	}

//프로젝트 작성
	@RequestMapping(value = "/Project/Write.do", method = RequestMethod.POST)
	public ModelAndView ProjectWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/Project/Project.do");

		commandMap.put("USER_NO", "1");
		System.out.println(commandMap.getMap());
		projectService.insertProject(commandMap.getMap(), request);

		return mav;
	}

//프로젝트 상세보기
	@RequestMapping(value = "/Project/Detail.do")
	public ModelAndView ProjectDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/project/project_board_detail");

		Map<String, Object> map = projectService.selectProjectDetail(commandMap.getMap());
		mav.addObject("map", map.get("map"));
		mav.addObject("list", map.get("list"));
		return mav;

	}

//프로젝트 수정폼
	@RequestMapping(value = "/Project/Modify.do", method = RequestMethod.GET)
	public ModelAndView ProjectModifyForm(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("/project/project_board_modify");
		Map<String, Object> map = projectService.selectProjectDetail(commandMap.getMap());
	
//		System.out.println(list);
//		System.out.println(map);
		mav.addObject("map", map.get("map"));
		mav.addObject("list", map.get("list"));
		return mav;
	}

//프로젝트 수정
	@RequestMapping(value = "/Project/Modify.do", method = RequestMethod.POST)
	public ModelAndView ProjectModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/Project/Detail.do");

		projectService.updateProject(commandMap.getMap(), request); // 에러발생  0219 
		mav.addObject("PROJECT_NO", commandMap.get("PROJECT_NO"));

		return mav;
	}

//프로젝트 삭제
	@RequestMapping(value = "/Project/Delete.do")
	public ModelAndView ProjectDelete(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/project/project_board_list");

		projectService.deleteProject(commandMap.getMap());
		return mav;

	}

//프로젝트참가신청
	@RequestMapping(value = "/Project/Application.do")
	public ModelAndView ProjectApplication(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/project/project_board_detail");

		projectService.insertProjectApp(commandMap.getMap());
		return mav;

	}

}