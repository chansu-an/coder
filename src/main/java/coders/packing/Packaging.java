package coders.packing;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("Packaging")
public class Packaging {
	public Map<String, Object> Packag(Map<String, Object> map,int pagenum,int max,int count){
		
		int start = (pagenum-1)*max+1;
		int end = start-1+max;
		if(end>count) {
			end = count;
		}
		int maxpag =  (count/max==0)?(count/max):(count/max)+1;
		int pag = (pagenum%10 == 0)?(pagenum/10):(pagenum/10)+1;
		int startpag = (pag-1)*10+1;
		int endpage = startpag+9;
		if(endpage>maxpag) {
			endpage = maxpag;
		}
		map.put("START", start);
		map.put("END", end);
		map.put("startpag", startpag);
		map.put("endpage", endpage);
		map.put("maxpag", maxpag);
		System.out.println(map);
		return map;
	}

}
