package coders.mypage.service;

import java.util.List;
import java.util.Map;

public interface MypageService {
	public Map<String, Object> selectMypageDetail(Map<String, Object> map)throws Exception;
	
	public List<Map<String, Object>> selectProjectList(Map<String, Object> map)throws Exception;
	
	public List<Map<String, Object>> selectWriteList(Map<String, Object> map)throws Exception;
	
	public List<Map<String, Object>> selectArlimeList(Map<String, Object> map)throws Exception;
	
	public List<Map<String, Object>> selectProjetArList(Map<String, Object> map)throws Exception;
		
	public List<Map<String, Object>> selectprojectArList(Map<String, Object> map)throws Exception;
	
	public void clickArlist (Map<String, Object> map)throws Exception;
	
	public void clickProjectAr (Map<String, Object> map)throws Exception;

	public List<Map<String, Object>> selectFollowList(Map<String, Object> map)throws Exception;
	
	public List<Map<String, Object>> selectScrapList(Map<String, Object> map)throws Exception;
	
	public void updateMypage(Map<String, Object> map)throws Exception;
	
	public void deleteUser(Map<String, Object> map )throws Exception;
	
	public void insertScrap(Map<String, Object> map)throws Exception;
	
	public void insertFollow(Map<String, Object> map)throws Exception;
}
