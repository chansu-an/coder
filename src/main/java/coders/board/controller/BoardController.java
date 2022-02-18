package coders.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import coders.board.service.BoardService;
import coders.common.common.CommandMap;



@Controller
public class BoardController {

	@Resource(name="boardService")
	private BoardService boardService;
	
	//글목록 보기
	@RequestMapping(value="/board/openBoardList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView openBoardList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/board/board_list");
		
		commandMap.put("ORDER_TYPE", request.getParameter("ORDER_TYPE"));
		commandMap.put("IDENTI_TYPE", request.getParameter("IDENTI_TYPE"));
		
		List<Map<String, Object>> list = boardService.selectBoardList(commandMap.getMap());
		if(!list.isEmpty()) {
			String IDENTI_TYPE = list.get(0).get("IDENTI_TYPE").toString();
			mav.addObject("IDENTI_TYPE", IDENTI_TYPE);			
		}
		mav.addObject("list", list);		

		return mav;
	}
	
	//메인에 올라갈 최근 공지, qna 인기글, 자유게시판 인기글
	@RequestMapping(value="/board/mainList.do")
	public ModelAndView noticeList(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("/board/main_list");		
		
		List<Map<String, Object>> list1 = boardService.selectNoticeList(commandMap.getMap());
		List<Map<String, Object>> list2 = boardService.selectQnaBestList(commandMap.getMap());
		List<Map<String, Object>> list3 = boardService.selectFreeBestList(commandMap.getMap());
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("list3", list3);
		
		return mav;
	}
	
	//글쓰기
	@RequestMapping(value="/board/write.do")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("/board/board_write");
		
		return mav;
	}
	
	//게시글 작성
	@RequestMapping(value="/board/insertBoard.do", method = RequestMethod.POST)
	public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/board/openBoardList.do?IDENTI_TYPE=" + request.getParameter("IDENTI_TYPE"));
		
		boardService.insertBoard(commandMap.getMap(), request);
		
		return mav;
	}
	
	//글 상세보기
	@RequestMapping(value="/board/detail.do")
	public ModelAndView selectBoardDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/board/board_detail");
		
//		commandMap.put("BOARD_NO", Integer.parseInt(request.getParameter("BOARD_NO")));
//		commandMap.put("IDENTI_TYPE", request.getParameter("IDENTI_TYPE"));
		
		Map<String, Object> map = boardService.selectBoardDetail(commandMap.getMap());
		Map<String, Object> count = boardService.selectCommentCount(commandMap.getMap());//댓글수
		Map<String, Object> bestcomment = boardService.selectBestComment(commandMap.getMap());//인기 댓글
		
		List<Map<String, Object>> list = boardService.selectCommentList(commandMap.getMap());//댓글 리스트
		List<Map<String, Object>> filelist = boardService.selectFileList(commandMap.getMap());
		
		mav.addObject("map", map);
		mav.addObject("list", list);
		mav.addObject("filelist", filelist);
		mav.addObject("count", count);
		mav.addObject("bestcomment", bestcomment);
		
		return mav;
	}
	
	//글 수정하기폼
	@RequestMapping(value="/board/modify.do", method = RequestMethod.GET)
	public ModelAndView openBoardUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/board/board_modify");
		
		commandMap.put("BOARD_NO", Integer.parseInt(request.getParameter("BOARD_NO")));
		commandMap.put("IDENTI_TYPE", request.getParameter("IDENTI_TYPE"));
		
		Map<String, Object> map = boardService.selectBoardDetail(commandMap.getMap());
		List<Map<String, Object>> filelist = boardService.selectFileList(commandMap.getMap());
		
		mav.addObject("map", map);
		mav.addObject("filelist", filelist);

		
		return mav;
	}
	
	@RequestMapping(value="/board/modify.do", method = RequestMethod.POST)
	public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/board/detail.do?BOARD_NO=" + request.getParameter("BOARD_NO") + "&IDENTI_TYPE=" + request.getParameter("IDENTI_TYPE"));
		System.out.println(commandMap.getMap());
		boardService.updateBoard(commandMap.getMap(), request);
		
		return mav;
	}
	
	//글 삭제하기
	@RequestMapping(value="/board/delete.do", method = RequestMethod.POST)
	public ModelAndView deleteBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/board/openBoardList.do?IDENTI_TYPE=" + request.getParameter("IDENTI_TYPE"));
		
		boardService.deleteBoard(commandMap.getMap());
		return mav;
	}
	
	//삭제글 리스트
	@RequestMapping(value="/board/deleteList.do")
	public ModelAndView deleteList(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("/board/admin_list");
		List<Map<String, Object>> list1 = boardService.selectReportList(commandMap.getMap()); 
		List<Map<String, Object>> list2 = boardService.selectDeleteList(commandMap.getMap());
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		
		return mav;
	}
	
	//신고글, 삭제글 상세보기
	@RequestMapping(value="/board/adminDetail.do")
	public ModelAndView selectAdminDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/board/admin_detail");
				
		commandMap.put("BOARD_NO", Integer.parseInt(request.getParameter("BOARD_NO")));
		Map<String, Object> map = boardService.selectAdminDetail(commandMap.getMap());
		Map<String, Object> count = boardService.selectCommentCount(commandMap.getMap());//댓글수
		Map<String, Object> bestcomment = boardService.selectBestComment(commandMap.getMap());//댓글수
				
		List<Map<String, Object>> list = boardService.selectCommentList(commandMap.getMap());//댓글 리스트
				
		mav.addObject("map", map);
		mav.addObject("list", list);
		mav.addObject("count", count);
		mav.addObject("bestcomment", bestcomment);
				
		return mav;
	}
		
	//삭제글 복구하기
	@RequestMapping(value="/board/restore.do")
	public ModelAndView restoreBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/board/adminList.do");
		commandMap.put("BOARD_NO", Integer.parseInt(request.getParameter("BOARD_NO")));
		commandMap.put("IDENTI_TYPE", request.getParameter("IDENTI_TYPE"));
			
		boardService.restoreBoard(commandMap.getMap());
			
		return mav;
	}
	
	//글 신고하기
	@RequestMapping(value="/board/report.do" )
	public ModelAndView reportBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/board/detail.do?BOARD_NO=" + request.getParameter("BOARD_NO") + "&IDENTI_TYPE=" + request.getParameter("IDENTI_TYPE"));
		
		boardService.reportBoard(commandMap.getMap());
		
		return mav;
	}
	
	//신고글 복구하기
	@RequestMapping(value="/board/reset.do")
	public ModelAndView resetReport(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:/board/adminList.do");
		commandMap.put("BOARD_NO", Integer.parseInt(request.getParameter("BOARD_NO")));
		commandMap.put("IDENTI_TYPE", request.getParameter("IDENTI_TYPE"));
			
		boardService.resetReport(commandMap.getMap());
			
		return mav;
	}
	
	//신고글 리스트
	@RequestMapping(value="/board/reportList.do")
	public ModelAndView reportList(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("/board/board_list");
		List<Map<String, Object>> list = boardService.selectReportList(commandMap.getMap());
		mav.addObject("list", list);
		
		return mav;
	}
	

	//글 추천하기
	@RequestMapping(value="/board/recommend.do" )
	public ModelAndView recommendBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/board/detail.do?BOARD_NO=" + request.getParameter("BOARD_NO") + "&IDENTI_TYPE=" + request.getParameter("IDENTI_TYPE"));
			
		boardService.recommendBoard(commandMap.getMap());
			
		return mav;
	}
	
	//댓글 작성하기

	//게시글 댓글 작성
	@RequestMapping(value="/board/commentInsert.do", method = RequestMethod.POST)
	public ModelAndView InsertComment(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/board/detail.do?BOARD_NO=" + request.getParameter("BOARD_NO") + "&IDENTI_TYPE=" + request.getParameter("IDENTI_TYPE"));
		
		commandMap.put("BOARD_NO", Integer.parseInt(request.getParameter("BOARD_NO")));
		commandMap.put("USER_NO", Integer.parseInt(request.getParameter("USER_NO")));
		commandMap.put("CONTEXT", request.getParameter("CONTEXT"));
		boardService.insertComment(commandMap.getMap());
		
		return mav;
	}
	
	@RequestMapping(value="/board/commentDelete.do")
	public ModelAndView deleteComment(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/board/detail.do?BOARD_NO=" + request.getParameter("BOARD_NO"));
		
		commandMap.put("RE_NO", Integer.parseInt((request.getParameter("RE_NO"))));
		
		boardService.deleteComment(commandMap.getMap());
		
		return mav;
	}
}
