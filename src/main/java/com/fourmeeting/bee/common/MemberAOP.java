package com.fourmeeting.bee.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fourmeeting.bee.member.model.vo.Member;

@Service
@Aspect
public class MemberAOP {
	@Autowired
	@Qualifier("Sha256Util")
	private Sha256Util enc;

	@Pointcut("execution(* com.fourmeeting.bee.member.model.service.*Service.selectLoginMember(..))")
	public void loginPointcut() {
	}
	
	@Pointcut("execution(* com.fourmeeting.bee.member.model.service.*Service.updateMemberFindPw(..))")
	public void findPwPointcut() {
	}
	
	@Pointcut("execution(* com.fourmeeting.bee.member.model.service.*Service.memberPwModify(..))")
	public void updatePointcut() {
	}

	@Pointcut("execution(* com.fourmeeting.bee.member.model.service.*Service.insertMemberSignUp(..))")
	public void signUpPointcut() {
	}
	
	@Pointcut("execution(* com.fourmeeting.bee.member.model.service.*Service.memberPwCheck(..))")
	public void dropPwCheckPointcut() {
	}
	
	@Before("loginPointcut()")
	public void loginPwdEncryption(JoinPoint jp) throws Exception {

		this.signUpPwdEncryption(jp);
		return;
	}
	
	@Before("findPwPointcut()")
	public void findPwdEncryption(JoinPoint jp) throws Exception {

		this.signUpPwdEncryption(jp);
		return;
	}
	
	@Before("updatePointcut()")
	public void updatePwdEncryption(JoinPoint jp) throws Exception {
		
		this.signUpPwdEncryption(jp);
		return;
	}
	
	@Before("dropPwCheckPointcut()")
	public void dropPwCheckEncryption(JoinPoint jp) throws Exception {
		
		this.signUpPwdEncryption(jp);
		return;
	}
	
	@Before("signUpPointcut()")
	public void signUpPwdEncryption(JoinPoint jp) throws Exception {
		String userPw = ((Member) jp.getArgs()[0]).getMemberPw();
		String userId = ((Member) jp.getArgs()[0]).getMemberId();

		String encryUserPw = enc.encryData(userPw, userId);
		((Member) jp.getArgs()[0]).setMemberPw(encryUserPw);

		return;
	}
	
//	// after-returning
//		@AfterReturning(pointcut = "loginPointcut()", returning = "obj")
//		public void loginResultLog(JoinPoint jp, Object obj) {
//			// instanceof는 obj객체가 Member 타입과 일치한다면 이라는 의미
//			if (obj instanceof Member) {
//				System.out
//						.println("[MemberAOP]" + ((Member) obj).getMemberId() + "/" + ((Member) obj).getMemberPw() + " 로그인 성공");
//			} else {
//				Member m = (Member) jp.getArgs()[0];
//				System.out.println("[MemberAOP]" + m.getMemberId() + "/" + m.getMemberPw() + " 로그인 실패");
//			}
//		}
}
