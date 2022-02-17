package coders.team.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import coders.team.dao.TeamDAO;

@Service("teamService")
public class TeamServiceImpl implements TeamService{

	@Resource(name = "teamDAO")
	private TeamDAO teamDAO;

	@Override
	public List<Map<String, Object>> selectTeamList(Map<String, Object> map) throws Exception {

		return teamDAO.selectTeamList(map);
	}
	public void insertTeam(Map<String, Object> map) throws Exception{
	 teamDAO.insertTeam(map);
	}
	
	@Override
	public Map<String, Object> selectTeamDetail(Map<String, Object> map) throws Exception{
		Map<String, Object> resultMap = teamDAO.selectTeamDetail(map);
		return resultMap;
	}
	@Override
	public void updateTeam(Map<String,Object> map) throws Exception{
		teamDAO.updateTeam(map);
	}
	@Override
	public void deleteTeam(Map<String, Object> map) throws Exception{
		teamDAO.deleteTeam(map);
	}

}
