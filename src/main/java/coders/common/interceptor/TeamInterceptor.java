package coders.common.interceptor;

import java.io.PrintWriter;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import coders.application.service.ApplicationService;

public class TeamInterceptor implements HandlerInterceptor{

	@Resource(name="applicationService")
	private ApplicationService applicationService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		
			HttpSession session = request.getSession();
			Map<String, Object> map = (Map<String, Object>)session.getAttribute("session");
		if(map==null) {	PrintWriter printwriter = response.getWriter();	
			printwriter.print("<script>alert('로그인후 이용해주시기 바랍니다'); location.href='../board/mainList.do'</script>");		
			printwriter.flush();
			printwriter.close();
		return false;}else {
			map.put("PROJECT_NO", request.getParameter("PROJECT_NO"));
			Map<String, Object> chmap = applicationService.checkapp(map);
			if(chmap!=null) {
			return true;}else {PrintWriter printwriter = response.getWriter();
				printwriter.print("<script>alert('프로젝트 리더가 참가 허용을 하지 않았습니다'); location.href='../board/mainList.do'</script>");
				printwriter.flush();
				printwriter.close();
				return false;
			}
		}
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
