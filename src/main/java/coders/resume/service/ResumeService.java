package coders.resume.service;

import java.util.Map;

public interface ResumeService {
	public Map<String, Object> selectResumeDetail(Map<String, Object> map)throws  Exception;
	
	public void insertResume(Map<String, Object> map )throws Exception;
	
	public void updateResume(Map<String, Object> map )throws Exception;
	
	public void deleteResume(Map<String, Object> map )throws Exception;

}
