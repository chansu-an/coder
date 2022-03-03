package coders.team.controller;

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
import coders.team.service.TeamService;

@Controller
public class TeamController {

	@Resource(name = "teamService")
	private TeamService teamService;

	@RequestMapping(value = "/Team/List.do")
	public ModelAndView TeamList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/team/team_list");
		
		commandMap.put("PROJECT_NO", request.getParameter("PROJECT_NO"));
		List<Map<String, Object>> list = teamService.selectTeamList(commandMap.getMap());
		
		mav.addObject("list", list);
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/Team/Calendar.do", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> selectTeamCalendar(CommandMap commandMap,HttpServletRequest request) throws Exception{
		System.out.println(request.getParameter("PROJECT_NO"));
		List<Map<String, Object>> list = teamService.selectTeamCalendar(commandMap.getMap());
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<String, Object>();
		
		for(int i = 0; i<list.size(); i++) {
			hash.put("title", list.get(i).get("PD_TITLE"));
			hash.put("start", list.get(i).get("PD_START"));
			hash.put("end", list.get(i).get("PD_END"));
			
			jsonObj = new JSONObject();
			jsonObj.putAll(hash);
			jsonArr.add(jsonObj);
		}
		System.out.println(jsonArr);
		return jsonArr;
	}

	@RequestMapping(value = "/Team/Write.do", method = RequestMethod.GET)
	public ModelAndView TeamWriteForm(HttpServletRequest request,HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("/team/team_write");
	
		
		return mav;
	}

	@RequestMapping(value = "/Team/Write.do", method = RequestMethod.POST)
	public ModelAndView TeamWrite(CommandMap commandMap,HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/Team/List.do?PROJECT_NO="+commandMap.getMap().get("PROJECT_NO"));
		System.out.println(commandMap.getMap());
		teamService.insertTeam(commandMap.getMap(), request);
		
		return mav;
	}

	@RequestMapping(value = "/Team/Detail.do")
	public ModelAndView TeamDetail(CommandMap commandMap,HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/team/team_detail");
		
		Map<String, Object> map = teamService.selectTeamDetail(commandMap.getMap());
		mav.addObject("map", map.get("map"));
		mav.addObject("list", map.get("list"));
		System.out.println(commandMap.getMap());
		return mav;

	}

	@RequestMapping(value = "/Team/Modify.do", method = RequestMethod.GET)
	public ModelAndView TeamModifyForm(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("/team/team_modify");

		Map<String, Object> map = teamService.selectTeamDetail(commandMap.getMap());
		System.out.println(commandMap.getMap());
		mav.addObject("map", map.get("map"));
		mav.addObject("list",map.get("list"));
		return mav;
	}

	@RequestMapping(value = "/Team/Modify.do", method = RequestMethod.POST)
	public ModelAndView TeamModify(CommandMap commandMap,HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/Team/Detail.do");

		teamService.updateTeam(commandMap.getMap(), request);
		mav.addObject("PD_BOARD_NO", commandMap.get("PD_BOARD_NO"));
		return mav;
	}

	@RequestMapping(value = "/Team/Delete.do")
	public ModelAndView TeamDelete(CommandMap commandMap,HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/Team/List.do?PROJECT_NO="+request.getParameter("PROJECT_NO"));

		teamService.deleteTeam(commandMap.getMap());
		return mav;

	}


}
