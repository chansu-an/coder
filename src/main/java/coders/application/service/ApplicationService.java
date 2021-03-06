package coders.application.service;

import java.util.List;
import java.util.Map;

public interface ApplicationService {

	List<Map<String, Object>> selectApplicationList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectMemberList(Map<String, Object> map)throws Exception;

	void insertProjectApp(Map<String, Object> map)throws Exception;

	void ProjectApp(Map<String, Object> map) throws Exception; 
	
	Map<String, Object> checkapp(Map<String, Object> map )throws Exception;
	
}
