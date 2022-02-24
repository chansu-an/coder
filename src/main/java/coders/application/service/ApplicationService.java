package coders.application.service;

import java.util.List;
import java.util.Map;

public interface ApplicationService {

	List<Map<String, Object>> selectApplicationList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectMemberList(Map<String, Object> map)throws Exception;
}
