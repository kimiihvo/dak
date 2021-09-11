package study.spring.dak.service;

import java.util.Date;

import study.spring.dak.model.Member;

public interface MemberService {
	
	public Member getMember(Member input) throws Exception;
	
	public Member loginCheck(Member input) throws Exception;
	
	public int idCheck(Member input) throws Exception;
	
	public int nickCheck(Member input);
	
	public int emailCheck(Member input);
	
	public String getMemberId(Member input) throws Exception;
	
	public int updatePassword(Member input) throws Exception;
	
	public int doJoin(Member input) throws Exception;
	
	public int editMember(Member input) throws Exception;
	
	public int doOut(Member input) throws Exception;
	
	public void keepLogin(String memId, String sessionId, Date sessionLimit) throws Exception;
	
	public Member checkUserWithSessionKey(String value) throws Exception;

}
