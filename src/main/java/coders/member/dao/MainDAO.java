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
}
