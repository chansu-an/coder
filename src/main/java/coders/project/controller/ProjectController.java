package coders.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String ProjectList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		return "/project/project_board_list";
	}
	 @RequestMapping(value = "/Project/Projectpage.do")
	 @ResponseBody
	 public List<Map<String, Object>> Projectpage(HttpServletRequest request) throws Exception{
		 Map<String, Object> wmap = new HashMap<String, Object>();
		 wmap.put("KEYWORD", request.getParameter("KEYWORD"));
		 wmap.put("SEARCH_TYPE", request.getParameter("SEARCH_TYPE"));
		 String wpn =request.getParameter("PAG_NUM");
		HashMap<String, Object> hash = new HashMap<String, Object>();
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		if(wpn !=null) {
			
			int fpnum = Integer.parseInt(wpn);
			int fcount = projectService.countProjectList(wmap);
			wmap = packaging.Packag(wmap, fpnum, 5, fcount);
			List<Map<String, Object>> list1 = projectService.selectProjectList(wmap);
			if(list1.size()>0) {
				for(int i = 0; i<list1.size();i++) {
					hash = new HashMap<String, Object>(list1.get(i));
					jsonObj = new JSONObject();
					jsonObj.putAll(hash);
					jsonArr.add(jsonObj);
				}
				jsonObj = new JSONObject();
				jsonObj.putAll(wmap);
				jsonArr.add(jsonObj);
			}
			return jsonArr;
		}
		return null;
	 }
	@RequestMapping(value = "/Project/ProjectS.do")
	public String ProjectListS(CommandMap commandMap, HttpServletRequest request) throws Exception {
		return "/project/project_board_slist";
	}
	@RequestMapping(value = "/Project/ProjectSpage.do")
	 @ResponseBody
	 public List<Map<String, Object>> ProjectS(HttpServletRequest request) throws Exception{
		 Map<String, Object> wmap = new HashMap<String, Object>();
		 wmap.put("KEYWORD", request.getParameter("KEYWORD"));
		 wmap.put("SEARCH_TYPE", request.getParameter("SEARCH_TYPE"));
		 String wpn =request.getParameter("PAG_NUM");
		HashMap<String, Object> hash = new HashMap<String, Object>();
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		if(wpn !=null) {
			int fpnum = Integer.parseInt(wpn);
			int fcount = projectService.countProjectSlist(wmap);
			wmap = packaging.Packag(wmap, fpnum, 5, fcount);
			List<Map<String, Object>> list1 = projectService.selectProjectList(wmap);
			if(list1.size()>0) {
				for(int i = 0; i<list1.size();i++) {
					hash = new HashMap<String, Object>(list1.get(i));
					jsonObj = new JSONObject();
					jsonObj.putAll(hash);
					jsonArr.add(jsonObj);
				}
				jsonObj = new JSONObject();
				jsonObj.putAll(wmap);
				jsonArr.add(jsonObj);
			}
			return jsonArr;
		}
		return null;
	 }
	
	@RequestMapping(value = "/Project/ProjectE.do")
	public String ProjectListeE(CommandMap commandMap, HttpServletRequest request) throws Exception {
		return "/project/project_board_elist";
	}
	@RequestMapping(value = "/Project/ProjectEpage.do")
	 @ResponseBody
	 public List<Map<String, Object>> ProjectE(HttpServletRequest request) throws Exception{
		 Map<String, Object> wmap = new HashMap<String, Object>();
		 wmap.put("KEYWORD", request.getParameter("KEYWORD"));
		 wmap.put("SEARCH_TYPE", request.getParameter("SEARCH_TYPE"));
		 String wpn =request.getParameter("PAG_NUM");
		HashMap<String, Object> hash = new HashMap<String, Object>();
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		if(wpn !=null) {
			int fpnum = Integer.parseInt(wpn);
			int fcount = projectService.countProjectElist(wmap);
			wmap = packaging.Packag(wmap, fpnum, 5, fcount);
			List<Map<String, Object>> list1 = projectService.selectProjectList(wmap);
			if(list1.size()>0) {
				for(int i = 0; i<list1.size();i++) {
					hash = new HashMap<String, Object>(list1.get(i));
					jsonObj = new JSONObject();
					jsonObj.putAll(hash);
					jsonArr.add(jsonObj);
				}
				jsonObj = new JSONObject();
				jsonObj.putAll(wmap);
				jsonArr.add(jsonObj);
			}
			return jsonArr;
		}
		return null;
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
		
		}
		smap.put("PROJECT_NO", request.getParameter("PROJECT_NO"));
		
		
		
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








