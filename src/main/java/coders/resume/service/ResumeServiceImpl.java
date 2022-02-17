package coders.resume.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import coders.resume.dao.ResumeDAO;

@Service("ResumeService")
public class ResumeServiceImpl implements ResumeService{
	@Resource(name = "ResumeDAO")
	private ResumeDAO resumeDAO;

	@Override
	public Map<String, Object> selectResumeDetail(Map<String, Object> map) throws Exception {
		return resumeDAO.selectResumeDetail(map);
	}

	@Override
	public void insertResume(Map<String, Object> map) throws Exception {
		resumeDAO.insertResume(map);
		
	}

	@Override
	public void updateResume(Map<String, Object> map) throws Exception {
		resumeDAO.updateResume(map);
		
	}

	@Override
	public void deleteResume(Map<String, Object> map) throws Exception {
		resumeDAO.deleteResume(map);
		
	}
	
	

}
