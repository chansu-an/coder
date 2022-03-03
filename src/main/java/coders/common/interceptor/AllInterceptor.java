package coders.common.interceptor;


import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import coders.board.service.BoardService;
import coders.member.service.MainService;
import coders.mypage.service.MypageService;
import coders.project.service.ProjectService;
import coders.team.service.TeamService;

public class AllInterceptor implements HandlerInterceptor{
	
	@Resource(name="boardService")
	private BoardService boardService;
	@Resource(name = "mypageService")
	private MypageService mypageService;
	@Resource(name = "projectService")
	private ProjectService projectService;
	@Resource(name = "teamService")
	private TeamService teamService;
	@Resource(name="mainService")
	private MainService mainService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
		if(smap!=null) {
			int bcount =mainService.countAlarm(smap);
			int pcount =mainService.countProjectAlarm(smap);
			session.setAttribute("Arlimecount", pcount + bcount);
		}
		response.setContentType("text/html; charset=UTF-8");
		
		String USER_NO = request.getParameter("USER_NO");
		String PROJECT_NO = request.getParameter("PROJECT_NO");
		String BOARD_NO = request.getParameter("BOARD_NO");
		String PROJECT_BOARD_NO = request.getParameter("PD_BOARD_NO");
		Map<String, Object> map = new HashMap<String, Object>();
		if(USER_NO!=null) {
			map.put("USER_NO", USER_NO);
					map = mypageService.selectMypageDetail(map);
					if(map!=null) {
						return true;
					}else {PrintWriter printwriter = response.getWriter();
						printwriter.print("<script>alert('존재하지 않는 페이지 입니다'); location.href='../board/mainList.do'</script>");
						printwriter.flush();
						printwriter.close();
						return false;
					}
					
		}
		if(PROJECT_NO!=null) {
			map.put("PROJECT_NO", PROJECT_NO);
					map = projectService.selectProjectDetail(map);
					
					if(map.get("map")!=null) {
						if(PROJECT_BOARD_NO!=null) {
							map.put("PD_BOARD_NO", PROJECT_BOARD_NO);
									map = teamService.selectTeamDetail(map);
									if(map.get("map")!=null) {
										return true;
									}else {PrintWriter printwriter = response.getWriter();
										printwriter.print("<script>alert('존재하지 않는 페이지 입니다'); location.href='../board/mainList.do'</script>");
										printwriter.flush();
										printwriter.close();
										return false;
									}
									
						}
						return true;
					}else {PrintWriter printwriter = response.getWriter();
					printwriter.print("<script>alert('존재하지 않는 페이지 입니다'); location.href='../board/mainList.do'</script>");
					printwriter.flush();
					printwriter.close();
						return false;
					}
					
		}
		if(BOARD_NO!=null) {
			map.put("BOARD_NO", BOARD_NO);
					map = boardService.selectBoardDetail(map);
					if(map!=null) {
						return true;
					}else {PrintWriter printwriter = response.getWriter();
					printwriter.print("<script>alert('존재하지 않는 페이지 입니다'); location.href='../board/mainList.do'</script>");
					printwriter.flush();
					printwriter.close();
						return false;
					}
				
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	

}
