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
	
	public int countWriteList(Map<String, Object> map)throws Exception;
	
	public int countProjectArList(Map<String, Object> map)throws Exception;
	
	public int countProjectList(Map<String, Object> map)throws Exception;
	
	public int countFollowList(Map<String, Object> map)throws Exception;
	
	public int countScrapList(Map<String, Object> map)throws Exception;
	
	public int countArlimeList(Map<String, Object> map)throws Exception;
	
	public void repostUser(Map<String, Object> map)throws Exception;
	
	public int checkFollw(Map<String, Object> map)throws Exception;
	
	public void deleteFollow(Map<String, Object> map)throws Exception;
	
	public void deleteScarap(Map<String, Object> map)throws Exception;
	
	public void updateUserDisabled(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> countUserReport(Map<String, Object> map) throws Exception;
}
