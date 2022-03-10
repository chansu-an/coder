package coders.common.interceptor;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import coders.project.service.ProjectService;
import coders.team.service.TeamService;

public class Delinterceptor implements HandlerInterceptor {

	@Resource(name = "projectService")
	private ProjectService projectService;
	@Resource(name = "teamService")
	private TeamService teamService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String PROJECT_BOARD_NO = request.getParameter("PD_BOARD_NO");
		String PROJECT_NO = request.getParameter("PROJECT_NO");
		Map<String, Object> smap = (Map<String, Object>) request.getSession().getAttribute("session");
		Map<String, Object> map = new HashMap<String, Object>();
		if (smap == null) {
			PrintWriter printwriter = response.getWriter();
			printwriter.print("<script>alert('로그인후 이용해 주시기 바랍니다'); location.href='../board/mainList.do'</script>");
			printwriter.flush();
			printwriter.close();
			return false;
		} else {
			smap.put("PROJECT_NO", PROJECT_NO);
			smap.put("PROJECT_BOARD_NO", PROJECT_BOARD_NO);
			if (PROJECT_NO != null) {

				if (PROJECT_BOARD_NO != null) {
					map = teamService.selectTeamDetail(smap);
					int ch1 = Integer.parseInt(map.get("USER_NO").toString());
					int ch2 = Integer.parseInt(smap.get("USER_NO").toString());		
					if(ch1 == ch2) {
						return true;
					}
				} else {
					map = (Map<String, Object>)projectService.selectProjectDetail(smap).get("map");
					int ch1 = Integer.parseInt(map.get("USER_NO").toString());
					int ch2 = Integer.parseInt(smap.get("USER_NO").toString());	
					
					if(ch1 == ch2) {
						return true;
					}
				}
			}
		}
		PrintWriter printwriter = response.getWriter();
		printwriter.print("<script>alert('작성자만 삭제가 가능합니다'); location.href='../board/mainList.do'</script>");
		printwriter.flush();
		printwriter.close();
		return false;
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
