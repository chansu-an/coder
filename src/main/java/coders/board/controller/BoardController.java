package coders.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import coders.board.service.BoardService;
import coders.common.common.CommandMap;
import coders.packing.Packaging;



@Controller
public class BoardController {

	@Resource(name="boardService")
	private BoardService boardService;
	@Resource(name="Packaging")
	private Packaging packaging;
	
	//글목록 보기 /board/openBoardList.do?IDENTI_TYE=1
	@ResponseBody
	@RequestMapping(value="/board/openBoardList.do", method = RequestMethod.POST)
	public ModelAndView openBoardList2(@RequestBody Map<String, Object> test, CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
			
		commandMap.put("IDENTI_TYPE", test.get("IDENTI_TYPE"));
		commandMap.put("ORDER_TYPE", test.get("ORDER_TYPE"));		
		String page = request.getParameter("PAG_NUM");
		int pag = 1;
		int count;
		if(page!=null) {
			pag = Integer.parseInt(page);
		}
		//정렬
		if(test.get("ORDER_TYPE") != null) {
			commandMap.put("ORDER_TYPE", test.get("ORDER_TYPE"));
			mav.addObject("order_type", test.get("ORDER_TYPE"));
		}
			
		String key = (String) test.get("SEARCH_TYPE");
		List<Map<String, Object>> list = null;
		if(key==null) {
			count = boardService.countborad(commandMap.getMap());
			packaging.Packag(commandMap.getMap(), pag, 10, count);

			
			list = boardService.selectBoardList(commandMap.getMap());
			if(!list.isEmpty()) {
				String IDENTI_TYPE = list.get(0).get("IDENTI_TYPE").toString();
				mav.addObject("IDENTI_TYPE", IDENTI_TYPE);			
			}
		}

		//검색기능	
		if(key!=null) {
			commandMap.put("KEYWORD", test.get("KEYWORD"));
			commandMap.put("SEARCH_TYPE", test.get("SEARCH_TYPE"));
			count = boardService.countsearchborad(commandMap.getMap());
			packaging.Packag(commandMap.getMap(), pag, 10, count);
			

			list = boardService.searchBoard(commandMap.getMap());
			mav.addObject("searchType", test.get("SEARCH_TYPE"));
			mav.addObject("keyWord", test.get("KEYWORD"));

		}
		
			
		mav.addObject("list", list);
		mav.addObject("map", commandMap.getMap());
			
		return mav;
	}
		
	//글목록 보기 /board/openBoardList.do?IDENTI_TYE=1
	@RequestMapping(value="/board/openBoardList.do", method = RequestMethod.GET)
	public ModelAndView openBoardList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/board/board_list");
		String page = request.getParameter("PAG_NUM");
		int pag = 1;
		int count;
		if(page!=null) {
			pag = Integer.parseInt(page);
		}
			//정렬
		if(request.getParameter("ORDER_TYPE") != null) {
			commandMap.put("ORDER_TYPE", request.getParameter("ORDER_TYPE"));
		}
			
		String key = request.getParameter("KEYWORD");
		List<Map<String, Object>> list = null;
		if(key==null) {
			count = boardService.countborad(commandMap.getMap());
			packaging.Packag(commandMap.getMap(), pag, 10, count);
				
				
			list = boardService.selectBoardList(commandMap.getMap());
			if(!list.isEmpty()) {
				String IDENTI_TYPE = list.get(0).get("IDENTI_TYPE").toString();
				mav.addObject("IDENTI_TYPE", IDENTI_TYPE);			
			}
		}
			
		//검색기능	
		if(key!=null) {
			commandMap.put("SEARCH_TYPE", request.getParameter("SEARCH_TYPE"));
			commandMap.put("KEYWORD", key);
			count = boardService.countsearchborad(commandMap.getMap());
			packaging.Packag(commandMap.getMap(), pag, 10, count);
				
			System.out.println(commandMap.getMap());
			list = boardService.searchBoard(commandMap.getMap());
			mav.addObject("searchType", request.getParameter("SEARCH_TYPE"));
			mav.addObject("keyWord", request.getParameter("KEYWORD"));
				
		}
			
		mav.addObject("list", list);
		mav.addObject("map", commandMap.getMap());
			
		return mav;
	}	
	
	//메인에 올라갈 최근 공지, qna 인기글, 자유게시판 인기글
	@RequestMapping(value="/board/mainList.do", method = RequestMethod.GET)
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
	public ModelAndView selectBoardDetail(@RequestParam Map<String, Object> cmap,CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("/board/board_detail");
		cmap = commandMap.getMap();

		int count;
		String page = request.getParameter("PAG_NUM");
		int pag = 1;
		if(page==null) {
			boardService.updateHitCnt(commandMap.getMap());//조회수
			
			}
		if(page!=null) {
			pag = Integer.parseInt(page);
		}
		count = boardService.commentCount(commandMap.getMap());
		packaging.Packag(commandMap.getMap(), pag, 5, count);

		System.out.println(commandMap.getMap());
		Map<String, Object> map = boardService.selectBoardDetail(commandMap.getMap());
		Map<String, Object> bestcomment = boardService.selectBestComment(commandMap.getMap());//인기 댓글
		List<Map<String, Object>> list = boardService.selectCommentList(commandMap.getMap());//댓글 리스트
		List<Map<String, Object>> filelist = boardService.selectFileList(commandMap.getMap());//첨부파일 리스트
		Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
		int test = 0;
		if(smap != null) {
			commandMap.getMap().put("USER_NO", smap.get("USER_NO"));
			Map<String, Object> scrapcount = boardService.selectCheckScarp(commandMap.getMap());//스크랩 확인
			if(scrapcount != null) {//스크랩 있을시 
				test = 1;
			}
		}	
		mav.addObject("scrapcheck", test);
		mav.addObject("map", map);
		mav.addObject("list", list);
		mav.addObject("filelist", filelist);
		mav.addObject("count", count);
		mav.addObject("bestcomment", bestcomment);
		mav.addObject("pmap", commandMap.getMap());
		
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
	
	//삭제글, 신고글 리스트
	@RequestMapping(value="/board/adminList.do")
	public ModelAndView adminList(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();	
		Map<String, Object> rmap = new HashMap<String, Object>();
		Map<String, Object> dmap = new HashMap<String, Object>();
		
		int reportNum = Integer.parseInt(request.getParameter("R_PAG_NUM"));
		int deleteNum = Integer.parseInt(request.getParameter("D_PAG_NUM"));
		int reportCount = boardService.countReportList(rmap);
		int deleteCount = boardService.countDeleteList(dmap);
		rmap = packaging.Packag(rmap, reportNum, 5, reportCount);
		dmap = packaging.Packag(dmap, deleteNum, 5, deleteCount);
		
		List<Map<String, Object>> list1 = boardService.selectReportList(rmap); 
		List<Map<String, Object>> list2 = boardService.selectDeleteList(dmap);
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("rmap", rmap);
		mav.addObject("dmap", dmap);	
		mav.setViewName("/board/admin_list");
		return mav;
	}
	 @RequestMapping(value = "/board/adminpage.do")
	 @ResponseBody
public List<Map<String, Object>> notpage(HttpServletRequest request) throws Exception{
	Map<String, Object> bmap = new HashMap<String, Object>();
	Map<String, Object> pmap = new HashMap<String, Object>();
	String bpn =request.getParameter("D_PAG_NUM");
	String ppn = request.getParameter("R_PAG_NUM");
	HashMap<String, Object> hash = new HashMap<String, Object>();
	JSONObject jsonObj = new JSONObject();
	JSONArray jsonArr = new JSONArray();
	if(bpn !=null) {
		int bpnum = Integer.parseInt(bpn);
		int bcount = boardService.countDeleteList(bmap);
		bmap = packaging.Packag(bmap, bpnum, 5, bcount);
		List<Map<String, Object>> list1 = boardService.selectDeleteList(bmap);
		if(list1.size()>0) {
			for(int i = 0; i<list1.size();i++) {
				hash = new HashMap<String, Object>(list1.get(i));
				jsonObj = new JSONObject();
				jsonObj.putAll(hash);
				jsonArr.add(jsonObj);
			}
			jsonObj = new JSONObject();
			jsonObj.putAll(bmap);
			jsonArr.add(jsonObj);
		}
		return jsonArr;
	}
	
	if(ppn!=null) {
		int ppnum = Integer.parseInt(ppn);
		int pcount = boardService.countReportList(pmap);
		pmap = packaging.Packag(pmap, ppnum, 5, pcount);
		List<Map<String, Object>> list2 = boardService.selectReportList(pmap);
		if(list2.size()>0) {
			for(int i = 0; i<list2.size();i++) {
				hash = new HashMap<String, Object>(list2.get(i));
				jsonObj = new JSONObject();
				jsonObj.putAll(hash);
				jsonArr.add(jsonObj);
			}
			jsonObj = new JSONObject();
			jsonObj.putAll(pmap);
			jsonArr.add(jsonObj);
			
		}
		return jsonArr;
	
}return null;
	}
	
	//신고글, 삭제글 상세보기
	@RequestMapping(value="/board/adminDetail.do")
	public ModelAndView selectAdminDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
	   ModelAndView mav = new ModelAndView("/board/admin_detail");
	      
	   int count;
	   String page = request.getParameter("PAG_NUM");
	   int pag = 1;
	   if(page!=null) {
	      pag = Integer.parseInt(page);
	   }
	   count = boardService.commentCount(commandMap.getMap());
	   packaging.Packag(commandMap.getMap(), pag, 5, count);
	      
	   Map<String, Object> map = boardService.selectBoardDetail(commandMap.getMap());
	   Map<String, Object> bestcomment = boardService.selectBestComment(commandMap.getMap());//인기 댓글
	   List<Map<String, Object>> list = boardService.selectCommentList(commandMap.getMap());//댓글 리스트
	   List<Map<String, Object>> filelist = boardService.selectFileList(commandMap.getMap());//첨부파일 리스트
	   
	   mav.addObject("map", map);
	   mav.addObject("list", list);
	   mav.addObject("filelist", filelist);
	   mav.addObject("count", count);
	   mav.addObject("bestcomment", bestcomment);
	   mav.addObject("pmap", commandMap.getMap());
	      
	   return mav;
	}
	
		
	//삭제글 복구하기
	@RequestMapping(value="/board/restore.do")
	public ModelAndView restoreBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/board/adminList.do?R_PAG_NUM=1&D_PAG_NUM=1");
		commandMap.put("BOARD_NO", Integer.parseInt(request.getParameter("BOARD_NO")));
		commandMap.put("IDENTI_TYPE", request.getParameter("IDENTI_TYPE"));
			
		boardService.restoreBoard(commandMap.getMap());
			
		return mav;
	}
	
	//글 신고하기
	@RequestMapping(value="/board/report.do", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public int reportBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		int report_result = boardService.reportBoard(commandMap.getMap());
		
		return report_result;
	}
	
	//신고글 복구하기
	@RequestMapping(value="/board/reset.do")
	public ModelAndView resetReport(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:/board/adminList.do?R_PAG_NUM=1&D_PAG_NUM=1");
		commandMap.put("BOARD_NO", Integer.parseInt(request.getParameter("BOARD_NO")));
		commandMap.put("IDENTI_TYPE", request.getParameter("IDENTI_TYPE"));
			
		boardService.resetReport(commandMap.getMap());
			
		return mav;
	}
	
	/*신고글 리스트
	@RequestMapping(value="/board/reportList.do")
	public ModelAndView reportList(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("/board/board_list");
		List<Map<String, Object>> list = boardService.selectReportList(commandMap.getMap());
		mav.addObject("list", list);
		
		return mav;
	}*/
	

	//글 추천하기
	@RequestMapping(value="/board/recommend.do", method = {RequestMethod.POST, RequestMethod.GET} )
	@ResponseBody
	public int recommendBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
			
		int recommend_result = boardService.recommendBoard(commandMap.getMap());

		return recommend_result;
	}

	//게시글 댓글 작성
	@RequestMapping(value="/board/commentInsert.do")
	@ResponseBody
	public void InsertComment(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
	
		boardService.insertComment(commandMap.getMap());
	}
	
	 @RequestMapping(value="/board/commentList.do", produces="application/json; charset=utf8")
	 @ResponseBody
	  public List<Map<String, Object>> ajax_commentList(CommandMap commandMap, HttpServletRequest request) throws Exception{
	        
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArr = new JSONArray();
			HashMap<String, Object> hash = new HashMap<String, Object>();
			int count = boardService.commentCount(commandMap.getMap());
			int pag = 1;
			String page = request.getParameter("PAG_NUM");
			
			if(page != null) {
			 pag = Integer.parseInt(page);}
			
			packaging.Packag(commandMap.getMap(), pag, 5, count);
	        // 해당 게시물 댓글
	        List<Map<String, Object>> commentVO = boardService.selectCommentList(commandMap.getMap());
	        
	        if(commentVO.size() > 0){
	            for(int i=0; i<commentVO.size(); i++){
	            	hash = new HashMap<String, Object>(commentVO.get(i));
	                jsonObj = new JSONObject();
	    			jsonObj.putAll(hash);
	    			jsonArr.add(jsonObj);
	            }
	            
	        }
	        	jsonObj = new JSONObject();
	             jsonObj.putAll(new HashMap<String, Object>(commandMap.getMap()));
	             jsonArr.add(jsonObj);
	             System.out.println(jsonArr);
	        return jsonArr;
	        
	    }
	
	//게시글 대댓글 작성
	@RequestMapping(value="/board/commentInsert2.do", method = RequestMethod.POST)
	public ModelAndView InsertComment2(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/board/detail.do?BOARD_NO=" + request.getParameter("BOARD_NO") + "&IDENTI_TYPE=" + request.getParameter("IDENTI_TYPE"));
		
		boardService.insertComment2(commandMap.getMap());
		
		return mav;
	}
	
	@RequestMapping(value="/board/commentDelete.do")
	public void deleteComment(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/board/detail.do?BOARD_NO=" + request.getParameter("BOARD_NO") + "&IDENTI_TYPE=" + request.getParameter("IDENTI_TYPE"));
		System.out.println(commandMap.getMap());
		boardService.deleteComment(commandMap.getMap());
		
	}
	
	//스크랩 추가하기
	@RequestMapping(value="/board/insertScrap.do")
	@ResponseBody
	public int insertScrap(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		int result = boardService.insertScrap(commandMap.getMap());
		
		return result;
	}
	
	//스크랩 취소하기
	@RequestMapping(value="/board/deleteScrap.do")
	@ResponseBody
	public int deleteScrap(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		int result = boardService.deleteScrap(commandMap.getMap());
		
		return result;		
	}
	
	//댓글 추천하기
	@RequestMapping(value="/board/recommandComment.do", method = RequestMethod.POST)
	@ResponseBody
	public int recommandComment(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		int result = boardService.updateRecommandComment(commandMap.getMap());
		
		return result;
	
	}
	
	
}
