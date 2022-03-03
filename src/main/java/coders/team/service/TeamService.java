package coders.team.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface TeamService {

	List<Map<String, Object>> selectTeamList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectTeamFileList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectTeamDetail(Map<String, Object> map) throws Exception;

	void insertTeam(Map<String, Object> map,HttpServletRequest request) throws Exception;
	
	void updateTeam(Map<String, Object> map,HttpServletRequest request) throws Exception;

	void deleteTeam(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectTeamCalendar(Map<String, Object> map) throws Exception;
	
	

	
	

}
