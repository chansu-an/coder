package coders.team.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import coders.common.dao.AbstractDAO;

@Repository("teamDAO")
public class TeamDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTeamList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("project.selectTeamList", map);
	}

	public void insertTeam(Map<String, Object> map) throws Exception {
		insert("team.insertTeam", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTeamDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("team.selectTeamDetail", map);
	}

	public void updateTeam(Map<String, Object> map) throws Exception {
		update("team.updateTeam", map);
		
	}

	public void deleteTeam(Map<String, Object> map) throws Exception{
		delete("team.deleteTeam", map);
		// TODO Auto-generated method stub
		
	}

}
