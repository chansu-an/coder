package coders.project.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.expression.spel.ast.OperatorBetween;


public interface ProjectService {

	List<Map<String, Object>> selectProjectList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectProjectSList(Map<String, Object> map) throws Exception;   //projectcontoller list의 1번list

	List<Map<String, Object>> selectProjectEList(Map<String, Object> map) throws Exception;   //projectcontoller list의 2번list


	List<Map<String, Object>> selectProjectFileList(Map<String, Object> map)throws Exception;

	Map<String, Object> selectProjectDetail(Map<String, Object> map) throws Exception;

	//0216 수정 
	void updateProject(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void deleteProject(Map<String, Object> map) throws Exception;

	void insertProjectApp(Map<String, Object> map) throws Exception;

	// 파일 업로드 
		
	// project Controller의 추가 02.15
		void insertProject(Map<String,Object>map,HttpServletRequest request)throws Exception;
	
}
