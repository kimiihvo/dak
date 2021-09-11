package study.spring.dak.service;

import java.util.List;
import study.spring.dak.model.OneOnOne;

public interface OneOnOneService {
	
	
	/** 1:1 문의 서비스*/
	public List<OneOnOne> getOneOnOneList(OneOnOne input) throws Exception;
	public int getOneOnOneCount(OneOnOne input) throws Exception;
	public int addOneOnOne(OneOnOne input) throws Exception;  
}
