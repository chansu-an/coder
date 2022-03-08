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

import coders.common.service.CommonProjectService;

@Controller
public class CommonProjectController {
	@Resource(name="commonProjectService")
	private CommonProjectService commonProjectService;

	@RequestMapping(value="/common/downloadProjectFile.do")
	public void downloadProjectFile(HttpServletRequest request,HttpServletResponse response)throws Exception{
		Map<String,Object>map1 = new HashMap<String,Object>();
		map1.put("PBF_NO", request.getParameter("PBF_NO"));
		
		Map<String,Object>map = commonProjectService.selectProjectFileInfo(map1);
		String pbs_name = (String)map.get("PBS_NAME"); 
		String pbo_name =(String)map.get("PBO_NAME");
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File("C:\\coders\\CS Han\\file"+pbs_name));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition","attachment; fileName=\""+URLEncoder.encode(pbo_name,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding","binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

}
