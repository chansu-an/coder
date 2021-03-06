package coders.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import coders.common.dao.AbstractDAO;

@Repository("mainDAO")
public class MainDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectUserList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("user.selectUserList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLoginUser(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("user.login", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectUserMyPage(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("user.selectMypageDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectDeleteUserList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("user.selectDeleteUserList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectStopUserList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("user.selectStopUserList", map);
	}
	
	public void insertUser(Map<String, Object> map) throws Exception{
		insert("user.insertUser", map);
	}
	
	public String confirmUser(String ID) throws Exception{
		return (String) selectOne("user.confirmid", ID);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> confirmNaverId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("user.confirmNaverId", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNaverLogin(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("user.selectNaverLogin", map);
	}
	
	public void modifyPassword(Map<String, Object> map) throws Exception{
		update("user.modifyPassword", map);
	}
	
	public int countAlarm(Map<String, Object> map) throws Exception{
		return (int) selectOne("user.countArlimeList", map);
	}
	
	public int countProjectAlarm(Map<String, Object> map) throws Exception{
		return (int) selectOne("user.countProjectArList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> arlimeList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("user.arlimeList", map);
	}
	
	public void restoreUser(Map<String, Object> map) throws Exception{
		update("user.restoreUser", map);
	}

	public void returnUserDisabled(Map<String, Object> map) throws Exception {
		update("user.returnUserDisabled", map);	
	}

	public int countUser(Map<String, Object> map) throws Exception {
		return (int) selectOne("user.countUser", map);
	}
}
