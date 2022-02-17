package coders.team.service;

import java.util.List;
import java.util.Map;

public interface TeamService {

	List<Map<String, Object>> selectTeamList(Map<String, Object> map) throws Exception;

	void insertTeam(Map<String, Object> map) throws Exception;

	Map<String, Object> selectTeamDetail(Map<String, Object> map) throws Exception;

	void updateTeam(Map<String, Object> map) throws Exception;

	void deleteTeam(Map<String, Object> map) throws Exception;

	

}
