package coders.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public interface BoardService {

	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectBestComment(Map<String, Object> map) throws Exception;

	void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void deleteBoard(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectQnaBestList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectFreeBestList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectDeleteList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectReportList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectCommentList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectCommentCount(Map<String, Object> map) throws Exception;
	
	void insertComment(Map<String, Object> map) throws Exception;
	
	void insertComment2(Map<String, Object> map) throws Exception;
	
	void deleteComment(Map<String, Object> map) throws Exception;

	int reportBoard(Map<String, Object> map) throws Exception;

	int recommendBoard(Map<String, Object> map) throws Exception;
	
	void restoreBoard(Map<String, Object> map) throws Exception;

	void resetReport(Map<String, Object> map) throws Exception;

	Map<String, Object> selectAdminDetail(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> searchBoard(Map<String, Object> map) throws Exception;
	
	int insertScrap(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectCheckScarp(Map<String, Object> map) throws Exception;
	
	int deleteScrap(Map<String, Object> map) throws Exception;
	
}
