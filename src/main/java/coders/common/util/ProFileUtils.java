package coders.common.util;

import java.io.File;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("ProfileUtils")
public class ProFileUtils {
	
	public Map<String,Object> parseInsertFileInfo(Map<String, Object> map, HttpServletRequest request)throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile =null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storeFileName = null;
		String filePath = request.getSession().getServletContext().getRealPath("/")+"\\img\\profile\\";
		filePath =filePath+map.get("USER_NO")+"\\";
		File file = new File(filePath);
		
		if(file.exists()==false) {
			file.mkdirs();
		}
		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() ==false) {
				originalFileName = multipartFile.getOriginalFilename();//원본이름
				originalFileExtension=originalFileName.substring(originalFileName.lastIndexOf("."));
				storeFileName = CommonUtils.getRandomString()+originalFileExtension;
				file = new File(filePath+storeFileName);
				multipartFile.transferTo(file);//이부분에서 파일 업로드 됨
				
				map.put("PROFILE", storeFileName);
			}
			
		}
		return map;
		
	}

}
