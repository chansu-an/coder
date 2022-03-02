package coders.member.service;

import java.util.List;
import java.util.Map;

public interface MainService {
	
	List<Map<String, Object>> selectUserList(Map<String, Object> map) throws Exception;
	
	Map<String,Object> selectLoginUser(Map<String, Object> map) throws Exception;
	
	Map<String,Object> selectUserMyPage(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectDeleteUserList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectStopUserList(Map<String, Object> map) throws Exception;
	
	void insertUser(Map<String, Object> map) throws Exception;
	
	String confirmUser(String ID) throws Exception;
	
	Map<String,Object> selectNaverLogin(Map<String, Object> map) throws Exception;
	
	void modifyPassword(Map<String, Object> map) throws Exception;
	
	int countAlarm(Map<String, Object> map) throws Exception;
	
	int countProjectAlarm(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> arlimeList(Map<String, Object> map) throws Exception;
}
