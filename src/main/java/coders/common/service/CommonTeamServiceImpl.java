package coders.common.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import coders.common.dao.CommonTeamDAO;

@Service("commonTeamService")
public class CommonTeamServiceImpl implements CommonTeamService{

	@Resource(name="commonTeamDAO")
		private CommonTeamDAO commonTeamDAO;
	
	@Override
	public Map<String,Object>selectTeamFileInfo(Map<String,Object>map)throws Exception{
		return commonTeamDAO.selectTeamFileInfo(map);
	}
}
