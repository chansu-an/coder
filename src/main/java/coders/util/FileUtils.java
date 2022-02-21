package coders.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.io.File;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {

	private static final String filePath = "C:\\coders\\CS Han\\file"; // 공통경로 수정해야함

public List<Map<String,Object>>parseInsertFileInfo(Map<String,Object>map,HttpServletRequest request)throws Exception{
	
	MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	Iterator<String>iterator = multipartHttpServletRequest.getFileNames();
	
	MultipartFile multipartFile = null;
	
	String pbo_Name = null;
	String pbo_NameExtension = null;
	String pbs_Name = null;
	
	
	List<Map<String,Object>>list = new ArrayList<Map<String,Object>>();
	Map<String,Object> listMap = null;
	
	String project_No = (String)map.get("PROJECT_NO");
	
	File file = new File(filePath);
	if(file.exists()==false) {
		file.mkdirs();
	}
	while(iterator.hasNext()) {
		multipartFile = multipartHttpServletRequest.getFile(iterator.next());
		if(multipartFile.isEmpty()==false) {
			pbo_Name = multipartFile.getOriginalFilename();
			pbo_NameExtension  = pbo_Name.substring(pbo_Name.lastIndexOf("."));
				pbs_Name = CommonUtils.getRamdomString()+pbo_NameExtension;
				
				file = new File(filePath + pbs_Name);
				multipartFile.transferTo(file);
				
				listMap = new HashMap<String,Object>();
				listMap.put("PROJECT_NO",project_No);
				listMap.put("PBO_NAME", pbo_Name);
				listMap.put("PBF_SIZE", multipartFile.getSize());
				listMap.put("PBS_NAME",pbs_Name);
				list.add(listMap);
		} 
		
	}
	return list;
}
public List<Map<String, Object>>parseUpdateFileInfo(Map<String, Object> map, HttpServletRequest request) throws Exception{
	MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	
	MultipartFile multipartFile = null;
	String pbo_Name = null;
	String pbo_NameExtension = null;
	String pbs_Name = null;
	
	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
    Map<String, Object> listMap = null; 
    
    String  project_No = (String)map.get("PROJECT_NO");
    String requestName = null;
    String pbf_no = null;
    
    
    while(iterator.hasNext()) {
		multipartFile = multipartHttpServletRequest.getFile(iterator.next());
		if(multipartFile.isEmpty()==false) {
			pbo_Name = multipartFile.getOriginalFilename();
			
			pbo_NameExtension  = pbo_Name.substring(pbo_Name.lastIndexOf("."));
				pbs_Name = CommonUtils.getRamdomString()+pbo_NameExtension;
    		
				
    		multipartFile.transferTo(new File(filePath + pbs_Name));
    		
    		listMap = new HashMap<String,Object>();
    		listMap.put("IS_NEW","Y");
			listMap.put("PROJECT_NO", project_No);
			listMap.put("PBO_NAME", pbo_Name);
			listMap.put("PBF_SIZE", multipartFile.getSize());
			listMap.put("PBS_NAME",pbs_Name);
			list.add(listMap);
			
    	}
    	else{
    		System.out.println(1);
    		requestName = multipartFile.getName();
        	pbf_no = " PBF_NO_ "+requestName.substring(requestName.indexOf("_")+1);
        	if(map.containsKey(pbf_no) == true && map.get(pbf_no) != null){
        		System.out.println(1);
        		listMap = new HashMap<String,Object>();
        		listMap.put("IS_NEW", "N");
        		listMap.put("FILE_PBF_NO", map.get(pbf_no));
        		list.add(listMap);
        	}
    	}
    }
	return list;
}




}
