package coders.project.dao;

import java.util.List;
import java.util.Map;


import org.springframework.stereotype.Repository;

import coders.common.dao.AbstractDAO;

@Repository("projectDAO")
public class ProjectDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProjectList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("project.selectProjectList", map);
	}

	public void insertProject(Map<String, Object> map) throws Exception {
		insert("project.insertProject", map);
		insert("project.autoProjectApp", map);

	}

	public void selectProject(Map<String, Object> map) throws Exception {
		selectList("project.selectProject", map);

	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectProjectDetail(Map<String, Object> map) throws Exception {

		return (Map<String, Object>) selectOne("project.selectProjectDetail", map);
	}

	public void updateProject(Map<String, Object> map) throws Exception {
		update("project.updateProject", map);

	}

	public void deleteProject(Map<String, Object> map) throws Exception {
		update("project.deleteProject", map);

	}


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProjectSList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("project.selectProjectSList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProjectEList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("project.selectProjectEList", map);
	}

	// 파일업로드 
	
		public void insertProjectFile(Map<String,Object>map)throws Exception{
			insert("project.insertProjectFile",map);
		}
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> selectProjectFileList(Map<String,Object>map)throws Exception{
			return(List<Map<String, Object>>)selectList("project.selectProjectFile",map);
		}

		public void updateFile(Map<String,Object>map)throws Exception{
			update("project.updateFile",map);
		}

		public void deleteFileList(Map<String, Object> map) {
		update("project.deleteFileList",map);
			
		}
		public int countProjectlist(Map<String, Object> map)throws Exception{
			return (int)selectOne("project.countProjectList",map);
		}
		
		public int countProjectSlist(Map<String, Object> map)throws Exception{
			return (int)selectOne("project.countProjectSList",map);
		}
		
		public int countProjectElist(Map<String, Object> map)throws Exception{
			return (int)selectOne("project.countProjectEList",map);
		}
		
	public int checkProjectApp(Map<String, Object> map) throws Exception {
		return (int) selectOne("project.checkProjectApp", map);
	}

}
