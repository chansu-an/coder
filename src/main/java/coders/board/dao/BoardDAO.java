package coders.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import coders.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("board.selectBoardList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("board.selectBoardDetail", map);
	}

	public void updateHitCnt(Map<String, Object> map) {
		update("board.updateHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("board.selectFileList", map);
	}

	public void insertBoard(Map<String, Object> map) throws Exception{
		insert("board.insertBoard", map);
		
	}
	
	public void insertComment(Map<String, Object> map) throws Exception{
		insert("board.insertComment", map);
		update("board.boardNotice", map);
	}
	
	public void insertComment2(Map<String, Object> map) throws Exception{
		insert("board.insertComment2", map);
		update("board.boardNotice", map);
	}

	public void insertFile(Map<String, Object> map) throws Exception {
		insert("board.insertFile", map);
		
	}

	public void update(Map<String, Object> map) throws Exception{
		update("board.updateBoard", map);
		
	}

	public void delete(Map<String, Object> map) throws Exception{
		update("board.deleteBoard", map);
		
	}
	
	public void deleteComment(Map<String, Object> map) throws Exception{
		update("board.commentDelete", map);
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("board.selectNoticeList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaBestList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("board.selectQnaBestList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFreeBestList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("board.selectFreeBestList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectDeleteList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("board.selectDeleteList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReportList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("board.selectReportList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCommentList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("board.commentList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCommentCount(Map<String, Object> map) {
		return (Map<String, Object>)selectOne("board.commentCount", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBestComment(Map<String, Object> map) {
		return (Map<String, Object>)selectOne("board.bestComment", map);
	}

	public int reportBoard(Map<String, Object> map) {
		return (int) update("board.reportBoard", map);	
	}

	public int recommendBoard(Map<String, Object> map) {
		return (int) update("board.recommendBoard", map);
	}
	
	public void restoreBoard(Map<String, Object> map) {
		update("board.returnDelete", map);
	}

	public void resetReport(Map<String, Object> map) {
		update("board.returnReport", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectAdminDetail(Map<String, Object> map) {
		return (Map<String, Object>)selectOne("board.selectAdminDetail", map);
	}
	
	public void deleteFileList(Map<String, Object> map) {
		update("board.deleteFileList", map);
	}
	
	public void updateFile(Map<String, Object> map) {
		update("board.updateFile", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchBoard(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("board.searchBoard", map);		
	}
	

	public int commentCount(Map<String, Object> map) {
		return (int)selectOne("board.commentCount",map);
	}
	
	public int countDeleteList(Map<String, Object> map) {
		return (int)selectOne("board.countDeleteList",map);
	}
	
	public int countReportList(Map<String, Object> map) {
		return (int)selectOne("board.countReportList",map);
	}
	
	public int countborad(Map<String, Object> map) {
		return (int)selectOne("board.countborad",map);
	}

	public int insertScrap(Map<String, Object> map) {
		return (int) insert("board.insertScrap", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCheckScrap(Map<String, Object> map) {
		return (Map<String, Object>)selectOne("board.checkScrap", map);
	}
	
	public int deleteScrap(Map<String, Object> map) throws Exception{
		return (int) update("board.deleteScarp", map);
		
	}
	
	public int updateRecommandComment(Map<String, Object> map) throws Exception{
		return (int) update("board.recommandComment", map);
		
	}
	

}
