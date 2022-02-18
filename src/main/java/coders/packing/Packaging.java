package coders.packing;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("Packaging")
public class Packaging {
	public Map<String, Object> Packag(Map<String, Object> map,int pagenum,int max,int count){
		
		int start = (pagenum-1)*max+1;
		int end = start-1+max;
		if(end>count) {
			end = count - (pagenum-1)*max;
		}
		int maxpag =  count/max;
		int pag = (pagenum%2 == 0)?(pagenum/2):(pagenum/2)+1;
		int startpag = (pag-1)*2+1;
		int endpage = startpag+1;
		if(endpage>maxpag) {
			endpage = maxpag;
		}
		map.put("START", start);
		map.put("END", end);
		map.put("startpag", startpag);
		map.put("endpage", endpage);
		map.put("maxpag", maxpag);
		return map;
	}

}
