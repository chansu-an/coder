package coders.application.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import coders.application.dao.ApplicationDAO;

@Service("applicationService")
public class ApplicationServiceImpl implements ApplicationService{
	
	@Resource(name="applicationDAO")
	private ApplicationDAO applicationDAO;

	@Override
	public List<Map<String, Object>> selectApplicationList(Map<String, Object> map) throws Exception {
		return applicationDAO.selectApplicationList(map);
	}

	@Override
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		return applicationDAO.selectMemberList(map);
	}

	@Override
	public void insertProjectApp(Map<String, Object> map) throws Exception {
		 applicationDAO.insertProjectApp(map);
		
	}
	
	@Override
	public void ProjectApp(Map<String, Object> map) throws Exception{
		applicationDAO.ProjectApp(map);
	}
	
	@Override
	public Map<String, Object> checkapp(Map<String, Object> map) throws Exception {
		return applicationDAO.checkapp(map);
	}
	
}
