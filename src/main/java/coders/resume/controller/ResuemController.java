package coders.resume.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.io.FileUtils;


import coders.resume.service.ResumeService;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.File;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import coders.common.common.CommandMap;
import coders.common.util.ReFileutils;

@Controller
public class ResuemController {
	
	@Resource(name = "ResumeService")
	private ResumeService resumeService;
	@Resource(name = "ReFileutils")
	private ReFileutils fileutils;
	
	//이력서 상세보기
	@RequestMapping(value ="/Resume/Detail.do")
	public ModelAndView selectResumeDetail(CommandMap commandMap,HttpSession session)throws Exception{
		ModelAndView mav = new ModelAndView();
		Map<String, Object> cmap = commandMap.getMap();
		Map<String, Object> map = resumeService.selectResumeDetail(cmap);
		
		Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
		if(smap!=null) {
		//저장된 이력서가 없으면 이력서 작성으로
		if(map==null) {
			int ch1 = Integer.parseInt(cmap.get("USER_NO").toString());
			int ch2 = Integer.parseInt(smap.get("USER_NO").toString());
			if(ch1 == ch2) {
				mav.addObject("msg", "작성된 이력서가 없습니다");
				mav.addObject("url", "../Resume/InsertResume.do");
				mav.setViewName("/mypage/redirect");
			return mav;}else {
				mav.addObject("msg", "작성된 이력서가 없습니다");
				mav.addObject("url", "../board/mainList.do");
				mav.setViewName("/mypage/redirect");
				return mav;
			}
		}}
		
		mav.addObject("CHECK", "N");
		if(smap!=null) {
			if(map.get("USER_NO").equals(smap.get("USER_NO"))) {
				mav.addObject("CHECK", "Y");
			}
		}
		mav.addObject("map", map);
		mav.setViewName("/Resume/resumedetail");
		return mav;
	}
	//이력서 작성
	@RequestMapping(value = "/Resume/InsertResume.do",method = RequestMethod.GET)
	public String insertResumeForm()throws Exception{
		return "/Resume/insertResumeForm";
	}
	
	@RequestMapping(value = "/Resume/InsertResume.do",method = RequestMethod.POST)
	public ModelAndView insertResume(CommandMap commandMap,HttpSession session,HttpServletRequest request)throws Exception{
		ModelAndView mav = new ModelAndView();

		Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
		if(smap==null) {
			mav.setViewName("/");
			return mav;
		}
		commandMap.put("USER_NO", smap.get("USER_NO"));
		fileutils.parseInsertFileInfo(commandMap.getMap(), request);
		resumeService.insertResume(commandMap.getMap());
		mav.setViewName("redirect:/main/Mypage.do?USER_NO="+smap.get("USER_NO"));
		return mav;
		
	}
	//이력서 수정
	@RequestMapping(value = "/Resume/UpdateResume.do", method = RequestMethod.GET)
	public ModelAndView updateResumeForm(HttpSession session)throws Exception{
		ModelAndView mav = new ModelAndView();
		Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
		Map<String, Object> map = resumeService.selectResumeDetail(smap);
		mav.addObject("map", map);
		mav.setViewName("/Resume/updateResumeForm");
		return mav;
		
	}
	//이력서 수정
		@RequestMapping(value = "/Resume/UpdateResume.do", method = RequestMethod.POST)
		public ModelAndView updateResume(CommandMap commandMap,HttpSession session,HttpServletRequest request)throws Exception{
			ModelAndView mav = new ModelAndView();
			Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
			commandMap.put("USER_NO", smap.get("USER_NO"));
			System.out.println(commandMap.getMap());
			fileutils.parseInsertFileInfo(commandMap.getMap(), request);
			resumeService.updateResume(commandMap.getMap());
			mav.setViewName("redirect:/main/Mypage.do?USER_NO="+smap.get("USER_NO"));
			return mav;
			
			
			
		}
	
	//이력서 삭제
		@RequestMapping(value ="/Resume/DeleteResume.do")
		public ModelAndView DeleteResume(HttpSession session)throws Exception{
			ModelAndView mav =new ModelAndView();
			Map<String, Object> smap = (Map<String, Object>)session.getAttribute("session");
			resumeService.deleteResume(smap);
			mav.setViewName("redirect:/main/Mypage.do?USER_NO="+smap.get("USER_NO"));
			return mav;
		}
		
		@RequestMapping(value = "/Resume/Filedowload.do")
		public void dowloadFile(CommandMap commandMap,HttpServletResponse response,HttpServletRequest request)throws Exception{
			String FileName = String.valueOf(commandMap.getMap().get("FILES")) ;
			System.out.println(commandMap.getMap());
			String path = request.getSession().getServletContext().getRealPath("/")+"\\file\\resume\\"+commandMap.getMap().get("USER_NO")+"\\";
			byte fileByte[] = FileUtils.readFileToByteArray(new File(path+commandMap.getMap().get("FILES")));
			
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length); 
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(FileName,"UTF-8")+"\";"); 
			response.setHeader("Content-Transfer-Encoding", "binary"); 
			response.getOutputStream().write(fileByte); 
			response.getOutputStream().flush(); 
			response.getOutputStream().close();

		
		}

}
