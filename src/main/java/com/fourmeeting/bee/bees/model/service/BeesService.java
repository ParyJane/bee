package com.fourmeeting.bee.bees.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fourmeeting.bee.PagingVO;
import com.fourmeeting.bee.bees.model.dao.BeesDAO;
import com.fourmeeting.bee.bees.model.vo.Bees;
import com.fourmeeting.bee.bees.model.vo.BeesAdmin;
import com.fourmeeting.bee.bees.model.vo.BeesAdminSearch;
import com.fourmeeting.bee.bees.model.vo.Setting;
import com.fourmeeting.bee.beesuser.model.vo.BeesUserList;

@Service("beesService")
public class BeesService {
	
	@Autowired
	@Qualifier(value="beesDAO")
	private BeesDAO bDAO;
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public int insertBee(Bees bee) {
		int beeResult = bDAO.insertBee(sqlSession, bee);
		System.out.println(bee.getBeesName()+"/"+bee.getBeesCover()+"/"+bee.getBeesCategory()+"/"+bee.getBeesHost()+"/"+
				bee.getBeesPublicYN());
		return beeResult;
	}

	public int insertSetting(Bees bee) {
		int beeSetting = bDAO.insertSetting(sqlSession, bee);
		return beeSetting;
	}
	
	public int insertHostBeeUser(Bees bee) {
		int beehostResult = bDAO.insertHostBeeUser(sqlSession, bee);
		return beehostResult;
	}

	public Bees selectBeeSetting(Bees bee) {
		Bees beeResult = bDAO.selectBeeSetting(sqlSession, bee);
		return beeResult;
	}

	public int updateBeeSettingCover(Bees bee) {
		int beeResult = bDAO.updateBeeSettingCover(sqlSession, bee);
		return beeResult;
	}

	public int updateBeeSettingType(Bees bee) {
		int beeResult = bDAO.updateBeeSettingType(sqlSession, bee);
		return beeResult;
	}

	public int updateBeeSettingIntro(Bees bee) {
		int beeResult = bDAO.updateBeeSettingIntro(sqlSession, bee);
		return beeResult;
	}

	public int updateBeeSettingMaxMember(Bees bee) {
		int beeResult = bDAO.updateBeeSettingMaxMember(sqlSession, bee);
		return beeResult;
	}

	public int updateBeeSettingJoinStandard(Bees bee) {
		int beeResult = bDAO.updateBeeSettingJoinStandard(sqlSession, bee);
		return beeResult;
	}

	public ArrayList<BeesUserList> selectBeesUser(int beesNO) {
		ArrayList<BeesUserList> list = bDAO.selectBeesUser(sqlSession, beesNO);
		return list;

	}
	
	public ArrayList<BeesUserList> selectBeesManager(int beesNO) {
		ArrayList<BeesUserList> list = bDAO.selectBeesManager(sqlSession, beesNO);
		return list;
	}

	public ArrayList<BeesUserList> selectBeesOnlyUser(int beesNO) {
		ArrayList<BeesUserList> list = bDAO.selectBeesOnlyUser(sqlSession, beesNO);
		return list;
	}

	public ArrayList<BeesUserList> selectBeesBlock(int beesNO) {
		ArrayList<BeesUserList> list = bDAO.selectBeesBlock(sqlSession, beesNO);
		return list;
	}

	public Setting selectBeeMemberPermission(Setting setting) {
		Setting settingResult = bDAO.selectBeeMemberPermission(sqlSession, setting);
		return settingResult;
	}

	public int updateBeeOneWithdraw(BeesUserList beeUser) {
		int beeUserResult = bDAO.updateBeeOneWithdraw(sqlSession, beeUser);
		return beeUserResult;
	}

	public int updateBeeOneDelete(Bees bee) {
		int beeResult = bDAO.updateBeeOneDelete(sqlSession, bee);
		return beeResult;
	}

	public int updateBeeMemberPermissionSet(Setting setting) {
		int settingResult = bDAO.updateBeeMemberPermissionSet(sqlSession, setting);
		return settingResult;
	}

	public int updateManagerToUser(BeesUserList beeUser) {
		int beeUserResult = bDAO.updateManagerToUser(sqlSession, beeUser);
		return beeUserResult;
	}

	public int updateMemberWithdraw(BeesUserList beeUser) {
		int beeUserResult = bDAO.updateMemberWithdraw(sqlSession, beeUser);
		return beeUserResult;
	}

	public int subMemberWithdrawBlockSet(BeesUserList beeUser) {
		int beeUserResult = bDAO.subMemberWithdrawBlockSet(sqlSession, beeUser);
		return beeUserResult;
	}

	public int subMemberBlockDeleteSet(BeesUserList beeUser) {
		int beeUserResult = bDAO.subMemberBlockDeleteSet(sqlSession, beeUser);
		return beeUserResult;
	}

	public int updatesubJoinManagerSet(BeesUserList beeUser) {
		int beeUserResult = bDAO.updatesubJoinManagerSet(sqlSession, beeUser);
		return beeUserResult;
	}

	
	
	
	
	public Bees beesSelectOne(int beesNo) {
		// TODO Auto-generated method stub
		Bees bees = bDAO.beesSelectOne(sqlSession,beesNo);
		return bees;
	}

	public Setting selectBeesSetting(int beesNo) {
		// TODO Auto-generated method stub
		Setting setting = bDAO.selectBeesSetting(sqlSession,beesNo);
		return setting;
	}

	
	
	
	
	
		//정평주(관리자)--------------------------------------------------------------------------
		//모임관리
		public ArrayList<BeesAdmin> selectBeesAdminList(PagingVO pv) {
			
			ArrayList<BeesAdmin> list = bDAO.selectBeesAdminList(sqlSession, pv);
			
			return list;
			
		}
		
		//페이징처리(bees전체 개수)
		public int countBeesAdmin() {

			int totalPage = bDAO.countBeesAdmin(sqlSession);
			
			return totalPage;
		}


		//모임관리(bees 삭제)
		public int beesDelete(int beesNo) {
			
			int result = bDAO.beesDelete(sqlSession, beesNo);
			
			return result;
			
		}

		//모임관리(bees 삭제)
		public int beesRollback(int beesNo) {
			
			int result = bDAO.beesRollback(sqlSession, beesNo);
			
			return result;
		}

		
		//모임관리(bees 검색)
		public ArrayList<BeesAdmin> adminBeesSearch(BeesAdminSearch bas) {
			
			ArrayList<BeesAdmin> list = bDAO.adminBeesSearch(sqlSession, bas);
			
			return list;
		}

	
	

}
