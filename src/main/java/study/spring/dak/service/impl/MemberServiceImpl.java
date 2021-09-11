package study.spring.dak.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.model.Member;
import study.spring.dak.model.OneOnOne;
import study.spring.dak.service.MemberService;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Member loginCheck(Member input) throws Exception {
		
		Member result = null;
		
		try {
			result = sqlSession.selectOne("MemberMapper.loginCheck", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("일치하는 회원 정보가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("회원 정보 조회에 실패했습니다.");
		}
		
		return result;
	}

	
	@Override
	public String getMemberId(Member input) throws Exception {

		String result = null;
		
		try {
			result = sqlSession.selectOne("MemberMapper.findId", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("일치하는 회원 정보가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("회원 정보 조회에 실패했습니다.");
		}
		
		return result;
	}


	@Override
	public int updatePassword(Member input) throws Exception {
		
		int result = 0;
		
		try {
			result = sqlSession.update("MemberMapper.updatePassword", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("일치하는 회원 정보가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("비밀번호 변경에 실패했습니다.");
		}
		
		return result;
	}


	
	// 회원정보 조회 
	@Override
	public Member getMember(Member input) throws Exception {
		Member result = null;

        try {
            result = sqlSession.selectOne("MemberMapper.selectItem", input);

            if (result == null) {
                throw new NullPointerException("result=null");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 회원이 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("회원조회에 실패했습니다.");
        }

        return result;
	}

	
	// 아이디 중복 검사
	@Override
	public int idCheck(Member input) throws Exception {
		
		int result = sqlSession.selectOne("MemberMapper.idCheck", input);
		
		return result;
	}

	// 닉네임 중복 검사
	@Override
	public int nickCheck(Member input) {

		int result = sqlSession.selectOne("MemberMapper.nickCheck", input);
		
		return result;
	}
	
	// 이메일 중복 검사
	@Override
	public int emailCheck(Member input) {

		int result = sqlSession.selectOne("MemberMapper.emailCheck", input);
		
		return result;
	}

	@Override
	public int doJoin(Member input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("MemberMapper.doJoin", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
            throw new Exception("조회된 회원이 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("회원가입에 실패했습니다.");
		}
		
		return result;
	}


	@Override
	public int editMember(Member input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("MemberMapper.editMember", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
            throw new Exception("조회된 회원이 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("회원정보 수정에 실패했습니다.");
		}
		
		return result;
	}


	@Override
	public int doOut(Member input) throws Exception {
		int result = 0;
		List<OneOnOne> outputO = null; 
		OneOnOne inputO = new OneOnOne();
		inputO.setMemno(input.getMemno());
		
		try {
			outputO =sqlSession.selectList("OneOnOneMapper.selectList", inputO);
			
			for(OneOnOne item : outputO ) {
				sqlSession.delete("OneOnOneMapper.deleteOutMemberOneononeComment", item);
			}
			
			sqlSession.delete("AddressMapper.deleteOutMemberAddress", input);
			sqlSession.delete("CouponMapper.deleteOutMemberCoupon", input);
			sqlSession.delete("WishMapper.deleteOutMemberWish", input);
			sqlSession.delete("OneOnOneMapper.deleteOutMemberOneonone", input);
			sqlSession.update("ReviewMapper.updateOutMemberReview", input);
			sqlSession.update("OrderMapper.updateOutMemberOrder", input);
			result = sqlSession.delete("MemberMapper.deleteMember", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
            throw new Exception("조회된 회원이 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("회원정보 삭제에 실패했습니다.");
		}
		
		return result;
	}

	// 로그인 유지 처리 메서드
	@Override
	public void keepLogin(String memId, String sessionId, Date sessionLimit) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("memId", memId);
		paramMap.put("sessionId", sessionId);
		paramMap.put("sessionLimit", sessionLimit);
		
		try {
			int result = sqlSession.update("MemberMapper.keepLogin", paramMap);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
            throw new Exception("자동 로그인 업데이트를 위한 회원정보 조회에 실패했습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("자동 로그인 정보 저장에 실패했습니다.");
		}
		
	}

	
	// 세션키 검증 메서드
	@Override
	public Member checkUserWithSessionKey(String value) throws Exception {
		
		return sqlSession.selectOne("MemberMapper.checkUserWithSessionKey", value);
	}


	
}
