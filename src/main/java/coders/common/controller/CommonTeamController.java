package coders.common.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import coders.common.service.CommonTeamService;
import coders.common.util.TeamFileUtils;

@Controller
public class CommonTeamController {
	@Resource(name="commonTeamService")
	private CommonTeamService commonTeamService;

	@RequestMapping(value="/common/downloadTeamFile.do")
	public void downloadProjectFile(HttpServletRequest request,HttpServletResponse response)throws Exception{
		Map<String,Object>map1 = new HashMap<String,Object>();
		map1.put("PF_NO", request.getParameter("PF_NO"));
		//System.out.println(map1);
		Map<String,Object>map = commonTeamService.selectTeamFileInfo(map1);
		String psf_name = (String)map.get("PSF_NAME"); 
		String pof_name =(String)map.get("POF_NAME");
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File("C:\\coders\\CS Han\\file"+psf_name));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition","attachment; fileName=\""+URLEncoder.encode(pof_name,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding","binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

}
