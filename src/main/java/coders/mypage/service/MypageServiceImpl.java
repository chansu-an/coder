package coders.mypage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import coders.mypage.dao.MypageDAO;
@Service("MypageService")
public class MypageServiceImpl implements MypageService {
	
	@Resource(name="MypageDAO")
	private MypageDAO mypageDAO;

	@Override
	public Map<String, Object> selectMypageDetail(Map<String, Object> map) throws Exception {
		return mypageDAO.selectMypageDetail(map);
	}

	@Override
	public List<Map<String, Object>> selectProjectList(Map<String, Object> map) throws Exception {
		
		return mypageDAO.selectProjectList(map);
	}

	@Override
	public List<Map<String, Object>> selectWriteList(Map<String, Object> map) throws Exception {
		return mypageDAO.selectWriteList(map);
	}

	@Override
	public List<Map<String, Object>> selectArlimeList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mypageDAO.selectArlimeList(map);
	}

	@Override
	public List<Map<String, Object>> selectProjetArList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mypageDAO.selectprojectArList(map);
	}

	@Override
	public List<Map<String, Object>> selectprojectArList(Map<String, Object> map) throws Exception {
		return mypageDAO.selectprojectArList(map);
	}

	@Override
	public void clickArlist(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		mypageDAO.clickArlist(map);
	}

	@Override
	public void clickProjectAr(Map<String, Object> map) throws Exception {
		mypageDAO.clickProjectAr(map);
	}

	@Override
	public List<Map<String, Object>> selectFollowList(Map<String, Object> map) throws Exception {
		return mypageDAO.selectFollowList(map);
	}

	@Override
	public List<Map<String, Object>> selectScrapList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return  mypageDAO.selectScrapList(map);
	}

	@Override
	public void updateMypage(Map<String, Object> map) throws Exception {
		mypageDAO.updateMypage(map);
		
	}

	@Override
	public void deleteUser(Map<String, Object> map) throws Exception {
		mypageDAO.deleteUser(map);
		
	}

	@Override
	public void insertScrap(Map<String, Object> map) throws Exception {
		mypageDAO.insertScrap(map);
		
	}

	@Override
	public void insertFollow(Map<String, Object> map) throws Exception {
		mypageDAO.insertFollow(map);
		
	}
}

