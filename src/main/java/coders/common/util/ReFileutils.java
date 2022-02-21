package coders.common.util;

import java.io.File;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("ReFileutils")
public class ReFileutils {
	public Map<String,Object> parseInsertFileInfo(Map<String, Object> map, HttpServletRequest request)throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		System.out.println(iterator.hasNext());
		MultipartFile multipartFile =null;
		String originalFileName = null;
		String filePath = request.getSession().getServletContext().getRealPath("/")+"\\file\\resume\\";
		filePath = filePath+map.get("USER_NO")+"\\";
		File file = new File(filePath);
		if(file.exists()==false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {	
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
				originalFileName = multipartFile.getOriginalFilename();//원본이름
				if(!originalFileName.equals("")) {
					System.out.println(originalFileName);
				file = new File(filePath+originalFileName);
				multipartFile.transferTo(file);//이부분에서 파일 업로드 됨
				map.put("FILES", originalFileName);
				}else {
					map.put("FILES", map.get("FILES"));
				}
			
		}
		
			
		
		return map;
		
	}

}
