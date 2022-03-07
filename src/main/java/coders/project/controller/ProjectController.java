package coders.project.controller;

import java.util.HashMap;
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
import coders.common.service.CommonProjectService;
import coders.packing.Packaging;
import coders.project.service.ProjectService;

@Controller
public class ProjectController {

	@Resource(name = "projectService")
	private ProjectService projectService;

	@Resource(name = "Packaging")
	private Packaging packaging;

//	프로젝트 리스트
	@RequestMapping(value = "/Project/Project.do")
	public ModelAndView ProjectList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		int count;
		int pag = 1;
		String pags = request.getParameter("PAG_NUM");
		if (pags != null) {
			pag = Integer.parseInt(pags);
		}
		
		
		ModelAndView mav = new ModelAndView("/project/project_board_list");
		count = projectService.countProjectList(commandMap.getMap());
		packaging.Packag(commandMap.getMap(), pag, 5, count);
		

		// 추가 02.15
		/* projectService.insertProject(commandMap.getMap(),request); */

		List<Map<String, Object>> list = projectService.selectProjectList(commandMap.getMap());
		List<Map<String, Object>> list1 = projectService.selectProjectSList(commandMap.getMap());
		System.out.println(list1);
		List<Map<String, Object>> list2 = projectService.selectProjectEList(commandMap.getMap());
		System.out.println(list2);
		mav.addObject("list", list);
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("map", commandMap.getMap());
		
		
		
		
		
		
		
		
		return mav;
	}
	@RequestMapping(value = "/Project/ProjectS.do")
	public ModelAndView ProjectListS(CommandMap commandMap, HttpServletRequest request) throws Exception {
		int count;
		int pag = 1;
		String pags = request.getParameter("PAG_NUM");
		if (pags != null) {
			pag = Integer.parseInt(pags);
		}
		ModelAndView mav = new ModelAndView("/project/project_board_slist");
		count = projectService.countProjectList(commandMap.getMap());
		packaging.Packag(commandMap.getMap(), pag, 5, count);

		// 추가 02.15
		/* projectService.insertProject(commandMap.getMap(),request); */

		List<Map<String, Object>> list1 = projectService.selectProjectSList(commandMap.getMap());
		System.out.println(list1);
		mav.addObject("list1", list1);
		mav.addObject("map", commandMap.getMap());
		return mav;
	}
	
	@RequestMapping(value = "/Project/ProjectE.do")
	public ModelAndView ProjectListeE(CommandMap commandMap, HttpServletRequest request) throws Exception {
		int count;
		int pag = 1;
		String pags = request.getParameter("PAG_NUM");
		if (pags != null) {
			pag = Integer.parseInt(pags);
		}
		ModelAndView mav = new ModelAndView("/project/project_board_elist");
		count = projectService.countProjectList(commandMap.getMap());
		packaging.Packag(commandMap.getMap(), pag, 5, count);

		// 추가 02.15
		/* projectService.insertProject(commandMap.getMap(),request); */

		List<Map<String, Object>> list2 = projectService.selectProjectEList(commandMap.getMap());
		System.out.println(list2);
		mav.addObject("list2", list2);
		mav.addObject("map", commandMap.getMap());
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
		System.out.println(commandMap.getMap());
		projectService.insertProject(commandMap.getMap(), request);

		return mav;
	}

//프로젝트 상세보기
	@RequestMapping(value = "/Project/Detail.do")
	public ModelAndView ProjectDetail(HttpServletRequest request,HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("/project/project_board_detail");
		Map<String, Object> smap = new HashMap<String, Object>();	
		if(session.getAttribute("session") != null) {
			smap = (Map<String, Object>) session.getAttribute("session");
			smap.put("PROJECT_NO", request.getParameter("PROJECT_NO"));
		int checkProject = projectService.checkProjectApp(smap);//참가신청했는지 판별
		mav.addObject("checkProject", checkProject);
		System.out.println(checkProject);
		}
		smap.put("PROJECT_NO", request.getParameter("PROJECT_NO"));
		
		
		System.out.println(smap);
		Map<String, Object> map = projectService.selectProjectDetail(smap);
		if(request.getParameter("END") != null) {//종료된 프로젝트는 참가신청버튼 안보이게 함
			mav.addObject("end", request.getParameter("END"));
		}
		
		
		mav.addObject("map", map.get("map"));
		mav.addObject("list", map.get("list"));
		return mav;

	}

//프로젝트 수정폼
	@RequestMapping(value = "/Project/Modify.do", method = RequestMethod.GET)
	public ModelAndView ProjectModifyForm(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("/project/project_board_modify");
		Map<String, Object> map = projectService.selectProjectDetail(commandMap.getMap());


		mav.addObject("map", map.get("map"));
		mav.addObject("list", map.get("list"));
		return mav;
	}

//프로젝트 수정
	@RequestMapping(value = "/Project/Modify.do", method = RequestMethod.POST)
	public ModelAndView ProjectModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/Project/Detail.do");

		projectService.updateProject(commandMap.getMap(), request); 
		mav.addObject("PROJECT_NO", commandMap.get("PROJECT_NO"));

		return mav;
	}

//프로젝트 삭제
	@RequestMapping(value = "/Project/Delete.do")
	public ModelAndView ProjectDelete(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/Project/Project.do");

		projectService.deleteProject(commandMap.getMap());
		return mav;

	}
	

}








