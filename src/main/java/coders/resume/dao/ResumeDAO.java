package coders.resume.dao;

import coders.common.dao.AbstractDAO;

import java.util.Map;


import org.springframework.stereotype.Repository;
@Repository("ResumeDAO")
public class ResumeDAO extends AbstractDAO{
	//이력서 보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectResumeDetail(Map<String, Object> map)throws  Exception{
		return (Map<String, Object>) selectOne("user.selectResumeDetail", map);
	}
	
	//이력서 작성
	public void insertResume(Map<String, Object> map )throws Exception{
		insert("user.insertResume", map);
	}
	
	//이력서 수정
	public void updateResume(Map<String, Object> map )throws Exception{
		update("user.updateResume", map);
	}
	
	//이력서 삭제
	public void deleteResume(Map<String, Object> map )throws Exception{
		delete("user.deleteResume", map);
	}
	

}
