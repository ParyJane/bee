package com.fourmeeting.bee.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fourmeeting.bee.member.model.vo.Member;

@Repository("memberDAO")
public class MemberDAO {
	public Member selectLoginMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		
		System.out.println(m.getMemberPw());
		Member member = sqlSession.selectOne("member.selectLoginMember", m);
		System.out.println(member.getMemberPw());
		
		return member;
	}
	
	public Member selectLoginMemberNo(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		
		Member member = sqlSession.selectOne("member.selectLoginMemberNo", m);
		
		System.out.println(member.getMemberNo());
		
		return member;
	}

	public int insertMemberSignUp(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("member.insertMemberSignUp", m);

		return result;
	}

	public Member selectMemberIdCheck(SqlSessionTemplate sqlSession, String memberId) {
		// TODO Auto-generated method stub
		Member member = sqlSession.selectOne("member.selectMemberIdCheck", memberId);

		return member;
	}
	
	public Member selectMemberEmailCheck(SqlSessionTemplate sqlSession, String memberEmail) {
		// TODO Auto-generated method stub
		Member member = sqlSession.selectOne("member.selectMemberEmailCheck", memberEmail);

		return member;
	}
	
	public Member selectMemberPhoneCheck(SqlSessionTemplate sqlSession, String receiver) {
		// TODO Auto-generated method stub
		Member member = sqlSession.selectOne("member.selectMemberPhoneCheck", receiver);

		return member;
	}
	
	public Member selectMemberFindId(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		Member member = sqlSession.selectOne("member.selectMemberFindId", m);

		return member;
	}
	
	public Member selectMemberFindPw(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		Member member = sqlSession.selectOne("member.selectMemberFindPw", m);

		return member;
	}

	public int updateMemberFindPw(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("member.updateMemberFindPw", m);

		return result;
	}
	
	
	
	
		//마이페이지-------------------------------------------------------
		//프로필 수정
		public int updateMemberProfile(SqlSessionTemplate sqlSession, Member m) {

			int result = sqlSession.update("member.updateMemberProfile", m);
			
			return result;
		}
		
		
		//내 정보 수정(생일)
		public int memberBirthModify(SqlSessionTemplate sqlSession, Member m) {
			
			int result = sqlSession.update("member.memberBirthModify", m);
			
			return result;
		}
		
		//내 정보 수정(성별)
		public int memberGenderModify(SqlSessionTemplate sqlSession, Member m) {
			
			int result = sqlSession.update("member.memberGenderModify", m);
			
			System.out.println("결과값////"+result);
			
			return result;
		}
		
		
		//핸드폰번호 중복 확인
		public Member myPhoneCheck(SqlSessionTemplate sqlSession, String memberPhone) {
			
			Member m = sqlSession.selectOne("member.myPhoneCheck", memberPhone);
			
			return m;
		}
		
		//핸드폰번호 변경
		public int memberPhoneModify(SqlSessionTemplate sqlSession, Member m) {

			int result = sqlSession.update("member.memberPhoneModify", m);
			
			return result;
		}
		
		
		//내 정보 수정(이메일)
		public int memberEmailModify(SqlSessionTemplate sqlSession, Member m) {
			
			int result = sqlSession.update("member.memberEmailModify", m);
			
			System.out.println("결과값////"+result);
			
			return result;
		}
		
		//회원탈퇴(비밀번호 확인)
		public Member memberPwCheck(SqlSessionTemplate sqlSession, Member m) {
			
			Member member = sqlSession.selectOne("member.memberPwCheck", m);
			
			return member;
		}
		
		
		
		//회원정보수정(비밀번호수정)
		public int memberPwModify(SqlSessionTemplate sqlSession, Member m) {

			int result = sqlSession.update("member.memberPwModify", m);		
			
			return result;
		}
		
		//회원탈퇴
		public int memberDelYN(SqlSessionTemplate sqlSession, int memberNo) {

			int result = sqlSession.update("member.memberDelYN", memberNo);
			
			return result;
		}
		
		

	
	
	
}
