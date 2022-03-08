package coders.team.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import coders.common.util.TeamFileUtils;
import coders.team.dao.TeamDAO;

@Service("teamService")
public class TeamServiceImpl implements TeamService {

	@Resource(name = "teamfileUtils")
	private TeamFileUtils teamfileUtils;
	@Resource(name = "teamDAO")
	private TeamDAO teamDAO;

	@Override
	public List<Map<String, Object>> selectTeamList(Map<String, Object> map) throws Exception {
		return teamDAO.selectTeamList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectTeamCalendar(Map<String, Object> map) throws Exception{
		
		return teamDAO.selectTeamCalendar(map);
	}
	
	
	public void insertTeam(Map<String, Object> map, HttpServletRequest request) throws Exception {
		teamDAO.insertTeam(map);

		List<Map<String, Object>> list = teamfileUtils.parseInsertFileInfo(map, request);
		for (int i = 0; i < list.size(); i++) {
			teamDAO.insertTeamFile(list.get(i));
		}
	}

	@Override
	public Map<String, Object> selectTeamDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap = teamDAO.selectTeamDetail(map);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("map", tempMap);
		List<Map<String, Object>> list = teamDAO.selectTeamFileList(map);
		resultMap.put("list", list);

		return resultMap;
	}

	@Override
	public List<Map<String, Object>> selectTeamFileList(Map<String, Object> map) throws Exception {
		return teamDAO.selectTeamFileList(map);
	}

	@Override
	public void updateTeam(Map<String, Object> map, HttpServletRequest request) throws Exception {
		teamDAO.updateTeam(map);
		teamDAO.deleteTeamFileList(map);
		List<Map<String, Object>> list = teamfileUtils.parseUpdateFileInfo(map, request);
		
		Map<String, Object> tempMap = null;
		for (int i = 0, size = list.size(); i < size; i++) {
			tempMap = list.get(i);
			if (tempMap.get("IS_NEW").equals("Y")) {
				teamDAO.insertTeamFile(tempMap);
			} else {
				teamDAO.updateTeamFile(tempMap);

			}
		}

	}

	@Override
	public void deleteTeam(Map<String, Object> map) throws Exception {
		teamDAO.deleteTeam(map);
	}
	
	

	
	
	

}
