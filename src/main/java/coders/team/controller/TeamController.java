package coders.team.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import coders.common.common.CommandMap;
import coders.team.service.TeamService;

@Controller
public class TeamController {

	@Resource(name = "teamService")
	private TeamService teamService;

	@RequestMapping(value = "/Project/Team.do")
	public ModelAndView TeamList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/team/PD_list");

		List<Map<String, Object>> list = teamService.selectTeamList(commandMap.getMap());

		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/Project/Team/Write.do", method = RequestMethod.GET)
	public ModelAndView TeamWriteForm(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("/team/PD_write");

		return mav;
	}

	@RequestMapping(value = "/project/Team/Write.do", method = RequestMethod.POST)
	public ModelAndView TeamWrite(CommandMap commandMap,HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/team/PD_list");

		teamService.insertTeam(commandMap.getMap(), request);
		return mav;
	}

	@RequestMapping(value = "/Project/Team/Detail.do")
	public ModelAndView TeamDetail(CommandMap commandMap,HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/team/PD_detail");
		
		Map<String, Object> map = teamService.selectTeamDetail(commandMap.getMap());
		mav.addObject("map", map.get("map"));
		mav.addObject("list", map.get("list"));

		return mav;

	}

	@RequestMapping(value = "/Project/Team/Modify.do", method = RequestMethod.GET)
	public ModelAndView TeamModifyForm(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("/team/PD_modify");

		Map<String, Object> map = teamService.selectTeamDetail(commandMap.getMap());
		mav.addObject("map", map.get("map"));
		mav.addObject("list",map.get("list"));
		return mav;
	}

	@RequestMapping(value = "/Project/Team/Modify.do", method = RequestMethod.POST)
	public ModelAndView TeamModify(CommandMap commandMap,HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/team/PD_detail");

		teamService.updateTeam(commandMap.getMap(), request);
		mav.addObject("PD_BOARD_NO", commandMap.get("PD_BOARD_NO"));
		return mav;
	}

	@RequestMapping(value = "/Project/Team/Delete.do")
	public ModelAndView TeamDelete(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/team/PD_list");

		teamService.deleteTeam(commandMap.getMap());
		return mav;

	}


}
