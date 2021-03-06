package coders.project.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import coders.project.dao.ProjectDAO;
import coders.util.FileUtils;

@Service("projectService")
public class ProjectServiceImpl implements ProjectService {

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name = "projectDAO")
	private ProjectDAO projectDAO;


	@Override
	public List<Map<String, Object>> selectProjectList(Map<String, Object> map) throws Exception {

		return projectDAO.selectProjectList(map);
	}

	@Override
	public List<Map<String, Object>> selectProjectSList(Map<String, Object> map) throws Exception {

		return projectDAO.selectProjectSList(map);
	}

	@Override
	public List<Map<String, Object>> selectProjectEList(Map<String, Object> map) throws Exception {

		return projectDAO.selectProjectEList(map);
	}

	@Override
	public void insertProject(Map<String, Object> map,HttpServletRequest request) throws Exception {
		projectDAO.insertProject(map);
		
	 List<Map<String, Object>> list	=fileUtils.parseInsertFileInfo(map, request);
	 for (int i = 0; i <list.size(); i++) {
		 projectDAO.insertProjectFile(list.get(i));
		
	}
	
}
	
	@Override
	public Map<String, Object> selectProjectDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = projectDAO.selectProjectDetail(map);
		resultMap.put("map", tempMap);
		
		List<Map<String,Object>> list = projectDAO.selectProjectFileList(map);
		resultMap.put("list", list);
		
		
		
		return resultMap;
	}
	
	
	

	@Override
	public List<Map<String, Object>> selectProjectFileList(Map<String, Object> map) throws Exception {
		return projectDAO.selectProjectFileList(map);
	}

	@Override
	public void updateProject(Map<String, Object> map, HttpServletRequest request) throws Exception {
		projectDAO.updateProject(map);
		projectDAO.deleteFileList(map);
		List<Map<String,Object>>list = fileUtils.parseUpdateFileInfo(map, request); //????????????  --> ?????? 
		Map<String,Object>tempMap = null;
		for(int i =0,size = list.size(); i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {  //???????????? 0219 
				projectDAO.insertProjectFile(tempMap);
			}
			else {
				projectDAO.updateFile(tempMap);
				
			}
		}

	}
	

	@Override
	public void deleteProject(Map<String, Object> map) throws Exception {
		projectDAO.deleteProject(map);
	}

	@Override
	public int countProjectList(Map<String, Object> map) throws Exception {
		return projectDAO.countProjectlist(map);
	}
	
	
//	 @Override 
//	 public void updateFileList(Map<String,Object>map)throws Exception{
//		 projectDAO.updateFileList(map);
//	 }

	@Override
	public int checkProjectApp(Map<String, Object> map) throws Exception {
		return projectDAO.checkProjectApp(map);
	}

	@Override
	public int countProjectSlist(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return projectDAO.countProjectSlist(map);
	}

	@Override
	public int countProjectElist(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return projectDAO.countProjectElist(map);
	}
	
	
	

}
