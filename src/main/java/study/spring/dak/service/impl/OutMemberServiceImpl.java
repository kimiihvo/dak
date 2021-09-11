package study.spring.dak.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.model.OutMember;
import study.spring.dak.service.OutMemberService;

@Slf4j
@Controller
public class OutMemberServiceImpl implements OutMemberService {

	@Autowired
	SqlSession sqlSession;
		
	@Override
	public int addOutMember(OutMember input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("OutMemberMapper.insertItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
            throw new Exception("조회된 탈퇴 회원이 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("탈퇴회원 등록에 실패했습니다.");
		}
		
		return result;
	}

}
