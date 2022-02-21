package coders.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Component("boardFileUtils")
public class BoardFileUtils {
	
	private static final String filePath = "D:\\dev\\file\\";
	
	public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{
		Enumeration params = request.getParameterNames();
		while(params.hasMoreElements()) {
		  String name = (String) params.nextElement();
		  System.out.println(name + " : " + request.getParameter(name) + "     "); 
		}
		
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    	
    	MultipartFile multipartFile = null;
    	String originalFileName = null;
    	String originalFileExtension = null;
    	String storedFileName = null;
    	
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null; 
        
        String BOARD_NO = (String)map.get("BOARD_NO");
        
        File file = new File(filePath);
        if(file.exists() == false){
        	file.mkdirs();
        }
        
        while(iterator.hasNext()){
        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
        	if(multipartFile.isEmpty() == false){
        		originalFileName = multipartFile.getOriginalFilename();
        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        		storedFileName = CommonUtils.getRandomString() + originalFileExtension;
        		
        		file = new File(filePath + storedFileName);
        		multipartFile.transferTo(file);
        		
        		listMap = new HashMap<String,Object>();
        		listMap.put("BOARD_NO", BOARD_NO);
        		listMap.put("ORIGINAL_FILE_NAME", originalFileName);
        		listMap.put("STORED_FILE_NAME", storedFileName);
        		listMap.put("FILE_SIZE", multipartFile.getSize());
        		list.add(listMap);
        	}
        }
		return list;
	}
	
	public List<Map<String, Object>> parseUpdateFileInfo(Map<String, Object> map, HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

    	MultipartFile multipartFile = null;
    	String originalFileName = null;
    	String originalFileExtension = null;
    	String storedFileName = null;
    	System.out.println("파일유틸 map : " + map);
    	
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;        
        
        String BOARD_NO = String.valueOf(map.get("BOARD_NO"));
        String requestName = null;
        String idx = null;
        
        while(iterator.hasNext()){        	
        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
        	requestName = multipartFile.getName();
        	idx = "FILE_NO_"+requestName.substring(requestName.indexOf("_")+1);
        	if(multipartFile.isEmpty() == false){//새로 추가한 첨부파일이 있을경우
        		originalFileName = multipartFile.getOriginalFilename();
        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        		storedFileName = CommonUtils.getRandomString() + originalFileExtension;
        		System.out.println("map.get(idx) : " + map.get(idx));
        		multipartFile.transferTo(new File(filePath + storedFileName));
        		listMap = new HashMap<String,Object>();
        		if(map.get(idx) == null) {//신규파일(파일추가)
        			listMap.put("IS_NEW", "I");
        			listMap.put("BOARD_NO", BOARD_NO);
        		}else {//기존파일 수정
        			listMap.put("IS_NEW", "Y");        			
        			listMap.put("FILE_NO", map.get(idx));
        		}
        		listMap.put("ORIGINAL_FILE_NAME", originalFileName);
        		listMap.put("STORED_FILE_NAME", storedFileName);
        		listMap.put("FILE_SIZE", multipartFile.getSize());
        		list.add(listMap);
        	}
        	else{//새로 첨부한 파일이 없을때 -> 삭제버튼 클릭시
        		listMap = new HashMap<String,Object>();
        		for(Entry<String, Object> elem : map.entrySet()){
                	if(elem.getKey().contains("delete")) {//같은키에 값 저장하는 로직
                		Map<String, Object> listmap = new HashMap<String,Object>();
                		listmap.put("DELETE_NO" , elem.getValue());
                		list.add(listmap);
                	}
                }
        		list.add(listMap);
        	}
        }
		return list;
	}
}
