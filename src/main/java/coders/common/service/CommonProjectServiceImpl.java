package coders.common.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import coders.common.dao.CommonProjectDAO;

@Service("commonProjectService")
public class CommonProjectServiceImpl implements CommonProjectService{

	@Resource(name="commonProjectDAO")
		private CommonProjectDAO commonProjectDAO;
	
	@Override
	public Map<String,Object>selectProjectFileInfo(Map<String,Object>map)throws Exception{
		return commonProjectDAO.selectProjectFileInfo(map);
	}
}
