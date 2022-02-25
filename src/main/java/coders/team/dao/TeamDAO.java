package coders.team.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import coders.common.dao.AbstractDAO;

@Repository("teamDAO")
public class TeamDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTeamList(Map<String, Object> map) throws Exception {
		System.out.println("DAO");
		return (List<Map<String, Object>>) selectList("team.selectTeamList", map);
	}

	public void insertTeam(Map<String, Object> map) throws Exception {
		insert("team.insertTeam", map);
		insert("team.ProjectAr", map);
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
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTeamFileList(Map<String, Object> map) throws Exception{
	
		return (List<Map<String, Object>>) selectList("team.selectTeamFile", map); 
	}

	public void deleteTeamFileList(Map<String, Object> map) {

		update("team.deleteTeamFileList", map);
		
	}
	public void updateTeamFile(Map<String, Object>map)throws Exception{
		update("team.updateTeamFile", map);
	}

	public void insertTeamFile(Map<String, Object> map) throws Exception {
		insert("team.insertTeamFile", map);
		
	}

}
