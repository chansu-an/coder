package coders.common.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("commonProjectDAO")
public class CommonProjectDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String,Object>selectProjectFileInfo(Map<String,Object>map)throws Exception{
		return(Map<String,Object>)selectOne("project.selectProjectFileInfo",map);
	}
}
