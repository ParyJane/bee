package com.fourmeeting.bee.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fourmeeting.bee.admin.model.vo.Criteria;
import com.fourmeeting.bee.notice.model.dao.NoticeDAO;
import com.fourmeeting.bee.notice.model.vo.Notice;

@Service("noticeService")
public class NoticeService {

	@Autowired
	@Qualifier(value="noticeDAO")
	private NoticeDAO nDAO;
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public int noticeInsert(Notice n) {       // 글 1개 등록
		System.out.println("noticeInsert 서비스");
		int result = nDAO.noticeInsert(sqlSession, n);
		return result;
	}

	public ArrayList<Notice> noticeSelectAll(Criteria cri) {          //글 전체 조회
		System.out.println("noticeSelectAll() 서비스");
		ArrayList<Notice> list= nDAO.noticeSelectAll(sqlSession,cri);
		return list;
	}


	public int deleteBtnChange(char btnVal, int boardNum) {
		System.out.println("deleteBtnChange 서비스");
		int result = nDAO.deleteBtnChange(sqlSession, btnVal, boardNum);
		return result;
	}
	public Notice modifyChange(int num) {
		System.out.println("modifyChange Service");
		Notice n = nDAO.modifyChange(sqlSession, num);
		System.out.println("modifyChange Service2");
		return n;
	}

	public int modifyUpdate(Notice n) {
		int result = nDAO.modifyUpdate(n, sqlSession);
		return result;
	}

	public int getTotal(Criteria cri) {
		
			int total = nDAO.getTotal(cri, sqlSession);
			return total;
		


	}
	

	public ArrayList<Notice> searchBtn(Criteria cri) {
		ArrayList<Notice> list = nDAO.searchBtn(cri, sqlSession);
		return list;
		
	}
	
		//사용자 -------------------------------------------------------
		//마이페이지 공지사항 리스트
		public ArrayList<Notice> myNoticeList() {
			
			ArrayList<Notice> list = nDAO.myNoticeList(sqlSession);
			
			return list;
			
		}
	
	
}
