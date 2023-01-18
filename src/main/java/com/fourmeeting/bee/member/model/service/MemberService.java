package com.fourmeeting.bee.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fourmeeting.bee.member.model.dao.MemberDAO;
import com.fourmeeting.bee.member.model.vo.Member;

@Service("memberService")
public class MemberService {
	
	@Autowired
	@Qualifier(value="memberDAO")
	private MemberDAO mDAO;
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	public Member selectLoginMember(Member m) {
		
		
		System.out.println(m.getMemberPw());
		Member member = mDAO.selectLoginMember(sqlSession, m);
		
		return member;
	}
	
	public Member selectLoginMemberNo(Member m) {
		
		Member member = mDAO.selectLoginMemberNo(sqlSession, m);
		
		return member;
	}

	public int insertMemberSignUp(Member m) {
		int result = mDAO.insertMemberSignUp(sqlSession, m);
		
		return result;
	}

	public Member selectMemberIdCheck(String memberId) {
		
		Member member = mDAO.selectMemberIdCheck(sqlSession, memberId);
		
		return member;
	}
	
	public Member selectMemberEmailCheck(String memberEmail) {
		
		Member member = mDAO.selectMemberEmailCheck(sqlSession, memberEmail);
		
		return member;
	}
	
	public Member selectMemberPhoneCheck(String receiver) {
		
		Member member = mDAO.selectMemberPhoneCheck(sqlSession, receiver);
		
		return member;
	}
	
	public Member selectMemberFindId(Member m) {
		
		Member member = mDAO.selectMemberFindId(sqlSession, m);
		
		return member;
	}
	
	public Member selectMemberFindPw(Member m) {
		
		Member member = mDAO.selectMemberFindPw(sqlSession, m);
		
		return member;
	}

	public int updateMemberFindPw(Member m) {
		// TODO Auto-generated method stub
		int result = mDAO.updateMemberFindPw(sqlSession, m);
		
		return result;
	}
	
	
	
	
	
	//마이페이지-------------------------------------------------------
	//프로필 수정
	public int updateMemberProfile(Member m) {
		
		int result = mDAO.updateMemberProfile(sqlSession, m);
		
		return result;
	}
	
	
	//내 정보 수정(생일)
	public int memberBirthModify(Member m) {
		
		int result = mDAO.memberBirthModify(sqlSession, m);
		
		return result;
	}
	
	//내 정보 수정(성별)
	public int memberGenderModify(Member m) {
		
		int result = mDAO.memberGenderModify(sqlSession, m);
		
		System.out.println("서비스////"+result);
		
		return result;
	}
	
	//핸드폰번호 중복 확인
	public Member myPhoneCheck(String memberPhone) {
		
		Member m = mDAO.myPhoneCheck(sqlSession, memberPhone);
		
		return m;
	}
	
	//핸드폰번호 변경
	public int memberPhoneModify(Member m) {

		int result = mDAO.memberPhoneModify(sqlSession, m);
		
		return result;
	}
	
	//내 정보 수정(이메일)
	public int memberEmailModify(Member m) {
		
		int result = mDAO.memberEmailModify(sqlSession, m);
		
		System.out.println("서비스////"+result);
		
		return result;
	}
	
	
	//회원탈퇴(비밀번호 확인)
	public Member memberPwCheck(Member m) {
		
		Member member = mDAO.memberPwCheck(sqlSession, m);
		
		return member;
	}
	
	
	//회원정보수정(비밀번호수정)
	public int memberPwModify(Member m) {

		int result = mDAO.memberPwModify(sqlSession,m);
		
		return result;
	}
	
	//회원탈퇴
	public int memberDelYN(int memberNo) {

		int result = mDAO.memberDelYN(sqlSession, memberNo);
		
		return result;
	}
	
	
	
	
}
