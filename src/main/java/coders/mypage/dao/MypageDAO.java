package coders.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.expression.spel.ast.OperatorBetween;
import org.springframework.stereotype.Repository;
import coders.common.dao.AbstractDAO;

@Repository("MypageDAO")
public class MypageDAO extends AbstractDAO{
	
	//내정보 보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMypageDetail(Map<String, Object> map)throws Exception{
		return(Map<String, Object>) selectOne("user.selectMypageDetail", map);
	}
	//내정보수정
	public void updateMypage(Map<String, Object> map)throws Exception{
		update("user.updateMypage", map);
	}
	//참여 프로젝트 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProjectList(Map<String, Object> map)throws Exception{
		return(List<Map<String, Object>>)selectList("user.selectProjectList", map);
	}
	//유저삭제
	public void deleteUser(Map<String, Object> map )throws Exception{
		update("user.deleteUser", map);
	}
	//스크랩추가
	public void insertScrap(Map<String, Object> map)throws Exception{
		insert("user.insertScrap", map);
	}
	//팔로우추가
	public void insertFollow(Map<String, Object> map)throws Exception{
		insert("user.insertFollow", map);
	}
	
	//작성글 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectWriteList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("user.selectWriteList", map);
	}
	//작성글 알림 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectArlimeList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("user.selectArlimeList", map);
	} 
	//프로젝트 알림 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectprojectArList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("user.selectProjectArList", map);
	}
	//프로젝트 알림 삭제
	public void clickArlist(Map<String, Object> map) throws Exception{
		update("user.clickArlist", map);
	} 
	
	//작성글 알림 삭제
	public void clickProjectAr(Map<String, Object> map) throws Exception{
		update("user.clickProjectAr", map);
	}
	//팔로우 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFollowList(Map<String, Object> map)throws Exception{
		return (List<Map<String,Object>>)selectList("user.selectFollowList",map);
	}
	//스크랩 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectScrapList(Map<String, Object> map)throws Exception{
		return (List<Map<String,Object>>)selectList("user.selectScrapList",map);
	}
	
	

}
