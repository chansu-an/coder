package coders.common.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("commonTeamDAO")
public class CommonTeamDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String,Object>selectTeamFileInfo(Map<String,Object>map)throws Exception{
		return(Map<String,Object>)selectOne("team.selectTeamFileInfo",map);
	}
}
