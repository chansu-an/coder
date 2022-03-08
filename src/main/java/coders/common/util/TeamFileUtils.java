package coders.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import coders.util.CommonUtils;

@Component("teamfileUtils")
public class TeamFileUtils {

	private static final String filePath = "C:\\coders\\CS Han\\file"; // 공통경로 수정해야함

	public List<Map<String, Object>> parseInsertFileInfo(Map<String, Object> map, HttpServletRequest request)
			throws Exception {

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;

		String pof_Name = null;
		String pof_NameExtension = null;
		String psf_Name = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		String pd_board_No = (String) map.get("PD_BOARD_NO");

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				pof_Name = multipartFile.getOriginalFilename();
				pof_NameExtension = pof_Name.substring(pof_Name.lastIndexOf("."));
				psf_Name = CommonUtils.getRamdomString() + pof_NameExtension;

				file = new File(filePath + psf_Name);
				multipartFile.transferTo(file);

				listMap = new HashMap<String, Object>();
				listMap.put("PD_BOARD_NO", pd_board_No);
				listMap.put("POF_NAME", pof_Name);
				listMap.put("PF_SIZE", multipartFile.getSize());
				listMap.put("PSF_NAME", psf_Name);
				list.add(listMap);
			}

		}
		return list;
	}

	public List<Map<String, Object>> parseUpdateFileInfo(Map<String, Object> map, HttpServletRequest request)
			throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String pof_Name = null;
		String pof_NameExtension = null;
		String psf_Name = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		String pd_board_No = (String) map.get("PD_BOARD_NO");
		String requestName = null;
		String pf_no = null;

		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				pof_Name = multipartFile.getOriginalFilename();

				pof_NameExtension = pof_Name.substring(pof_Name.lastIndexOf("."));
				psf_Name = CommonUtils.getRamdomString() + pof_NameExtension;

				multipartFile.transferTo(new File(filePath + psf_Name));

				listMap = new HashMap<String, Object>();
				listMap.put("IS_NEW", "Y");
				listMap.put("PD_BOARD_NO", pd_board_No);
				listMap.put("POF_NAME", pof_Name);
				listMap.put("PF_SIZE", multipartFile.getSize());
				listMap.put("PSF_NAME", psf_Name);
				list.add(listMap);

			} else {

				requestName = multipartFile.getName();
				pf_no = "PF_NO_" + requestName.substring(requestName.indexOf("_") + 1);
				if (map.containsKey(pf_no) == true && map.get(pf_no) != null) {
					

					listMap = new HashMap<String, Object>();
					listMap.put("IS_NEW", "N");
					listMap.put("FILE_PF_NO", map.get(pf_no));
					list.add(listMap);
				}
			}
		}
		return list;
	}

}
