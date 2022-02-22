package coders.board.service;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import coders.board.dao.BoardDAO;
import coders.common.util.BoardFileUtils;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	
	@Resource(name="boardFileUtils") 
	private BoardFileUtils boardFileUtils;
	 

	@Resource(name = "boardDAO")
	private BoardDAO boardDAO;

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return boardDAO.selectBoardList(map);
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		boardDAO.updateHitCnt(map);
		
		return boardDAO.selectBoardDetail(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		boardDAO.insertBoard(map);		

		List<Map<String, Object>> list = boardFileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++) {
			boardDAO.insertFile(list.get(i)); 
		}
		 
	}

	@Override
	public void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		boardDAO.update(map);
		System.out.println("map : " + map);
		
		List<Map<String,Object>> list = boardFileUtils.parseUpdateFileInfo(map, request);
		System.out.println("list : " + list);
		// List를 Set으로 변경 ->리스트 중복값 제거하는 작업
		Set<Map<String,Object>> set = new HashSet<Map<String,Object>>(list);
		// Set을 List로 변경
		List<Map<String,Object>> newList =new ArrayList<Map<String,Object>>(set);
		// 결과 출력
		System.out.println("newList : " + newList);
		Map<String,Object> tempMap = null;
		Map<String,Object> tempMap2 = null;
		
		
		for(int j=0, size2=newList.size(); j<size2; j++){
			tempMap2 = newList.get(j);
			System.out.println(tempMap2.containsKey("DELETE_NO"));
			if(tempMap2.containsKey("DELETE_NO")) {				
				System.out.println(tempMap2);
				boardDAO.deleteFileList(tempMap2);				
			}			
		}
		
		
		for(int i=0, size=list.size(); i<size; i++){
			tempMap = list.get(i);
			System.out.println("list.get : " + list.get(i));
			if(tempMap.isEmpty() || tempMap.containsKey("DELETE_NO")) {
				continue;
			}
			if(tempMap.get("IS_NEW").equals("Y")){//기존파일 수정
				System.out.println("updateFile");
				boardDAO.updateFile(tempMap);
				System.out.println("성공1");
			}
			else if(tempMap.get("IS_NEW").equals("I")){
				boardDAO.insertFile(tempMap);
			}
			
			
		}

	}

	// 게시글 삭제하기
	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		boardDAO.delete(map);
	}

	// 메인에 보여질 최근 공지글
	@Override
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		return boardDAO.selectNoticeList(map);
	}

	// 메인에 보여질 인기글
	@Override
	public List<Map<String, Object>> selectQnaBestList(Map<String, Object> map) throws Exception {
		return boardDAO.selectQnaBestList(map);
	}

	@Override
	public List<Map<String, Object>> selectFreeBestList(Map<String, Object> map) throws Exception {
		return boardDAO.selectFreeBestList(map);
	}

	//삭제글 리스트
	@Override
	public List<Map<String, Object>> selectDeleteList(Map<String, Object> map) throws Exception {
		return boardDAO.selectDeleteList(map);
	}
	
	//신고글 리스트
	@Override
	public List<Map<String, Object>> selectReportList(Map<String, Object> map) throws Exception {
		return boardDAO.selectReportList(map);
	}

	//게시글의 댓글 리스트
	@Override
	public List<Map<String, Object>> selectCommentList(Map<String, Object> map) throws Exception {
		return boardDAO.selectCommentList(map);
	}

	//게시글 댓글수
	@Override
	public Map<String, Object> selectCommentCount(Map<String, Object> map) throws Exception {
		return boardDAO.selectCommentCount(map);
	}

	//게시글 신고하기
	@Override
	public void reportBoard(Map<String, Object> map) throws Exception {
		boardDAO.reportBoard(map);
	}

	//게시글 추천하기
	@Override
	public void recommendBoard(Map<String, Object> map) throws Exception {
		boardDAO.recommendBoard(map);
		
	}

	//게시글 댓글 삽입
	@Override
	public void insertComment(Map<String, Object> map) throws Exception {
		boardDAO.insertComment(map);		
	}
	
	//게시글 대댓글 삽입
	@Override
	public void insertComment2(Map<String, Object> map) throws Exception {
		boardDAO.insertComment2(map);		
	}

	//게시글 댓글 삭제
	@Override
	public void deleteComment(Map<String, Object> map) throws Exception {
		boardDAO.deleteComment(map);
	}

	@Override
	public Map<String, Object> selectBestComment(Map<String, Object> map) throws Exception {
		return boardDAO.selectBestComment(map);
	}
	
	//삭제글 복원
	@Override
	public void restoreBoard(Map<String, Object> map) throws Exception {
		boardDAO.restoreBoard(map);	
	}

	//신고글 복원
	@Override
	public void resetReport(Map<String, Object> map) throws Exception {
		boardDAO.resetReport(map);
	}

	//삭제글, 신고글 상세보기
	@Override
	public Map<String, Object> selectAdminDetail(Map<String, Object> map) throws Exception {
		return boardDAO.selectAdminDetail(map);
	}

	//게시글 파일리스트
	@Override
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception {
		return boardDAO.selectFileList(map);
	}
	
	//게시글 검색하기
	@Override
	public List<Map<String, Object>> searchBoard(Map<String, Object> map) throws Exception {
		return boardDAO.searchBoard(map);
	}

	@Override
	public void insertScrap(Map<String, Object> map) throws Exception {
		boardDAO.insertScrap(map);
	}
	
	
}
