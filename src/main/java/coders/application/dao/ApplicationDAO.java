package coders.application.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import coders.common.dao.AbstractDAO;

@Repository("applicationDAO")
public class ApplicationDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectApplicationList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("project.selectApplicationList",map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("project.selectMemberList",map);
	}

	public void insertProjectApp(Map<String, Object> map) throws Exception{
		insert("project.insertProjectApp",map);
	}

	public void ProjectApp(Map<String, Object> map) throws Exception{
		update("project.ProjectApp", map);
		
	}
	

}
