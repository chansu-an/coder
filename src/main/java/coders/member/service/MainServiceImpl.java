package coders.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
}
