package coders.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import coders.member.dao.MainDAO;

@Service("mainService")
public class MainServiceImpl implements MainService{
	
	@Resource(name="mainDAO")
	private MainDAO mainDAO;
	
	@Override
	public List<Map<String, Object>> selectUserList(Map<String, Object> map) throws Exception {
		return mainDAO.selectUserList(map);
	}
	
	@Override
	public Map<String, Object> selectLoginUser(Map<String, Object> map) throws Exception{
		return mainDAO.selectLoginUser(map);
	}

	@Override
	public Map<String, Object> selectUserMyPage(Map<String, Object> map) throws Exception {
		return mainDAO.selectUserMyPage(map);
	}

	@Override
	public List<Map<String, Object>> selectDeleteUserList(Map<String, Object> map) throws Exception {
		return mainDAO.selectDeleteUserList(map);
	}

	@Override
	public List<Map<String, Object>> selectStopUserList(Map<String, Object> map) throws Exception {
		return mainDAO.selectStopUserList(map);
	}

	@Override
	public void insertUser(Map<String, Object> map) throws Exception {
		mainDAO.insertUser(map);
	}
	
	@Override
	public String confirmUser(String ID) throws Exception {
		return mainDAO.confirmUser(ID);
	}

	@Override
	public Map<String, Object> confirmNaverId(Map<String, Object> map) throws Exception {
		return mainDAO.confirmNaverId(map);
	}
	
	@Override
	public Map<String, Object> selectNaverLogin(Map<String, Object> map) throws Exception {
		return mainDAO.confirmNaverId(map);
	}
	
	@Override
	public void modifyPassword(Map<String, Object> map) throws Exception {
		mainDAO.modifyPassword(map);
	}

	@Override
	public int countAlarm(Map<String, Object> map) throws Exception {
		return mainDAO.countAlarm(map);
	}

	@Override
	public int countProjectAlarm(Map<String, Object> map) throws Exception {
		return mainDAO.countProjectAlarm(map);
	}
	
	@Override
	public List<Map<String, Object>> arlimeList(Map<String, Object> map) throws Exception {
		return mainDAO.arlimeList(map);
	}
	
	@Override
	public void restoreUser(Map<String, Object> map) throws Exception {
		mainDAO.restoreUser(map);		
	}

	@Override
	public void returnUserDisabled(Map<String, Object> map) throws Exception {
		mainDAO.returnUserDisabled(map);		
	}

}
