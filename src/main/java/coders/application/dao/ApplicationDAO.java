package coders.application.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import coders.common.dao.AbstractDAO;

@Repository("applicationDAO")
public class ApplicationDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectApplicationList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("project.selectApplicationList");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("project.selectMemberList");
	}

}
