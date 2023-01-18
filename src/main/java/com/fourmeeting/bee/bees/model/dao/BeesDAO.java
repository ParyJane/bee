package com.fourmeeting.bee.bees.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fourmeeting.bee.PagingVO;
import com.fourmeeting.bee.bees.model.vo.Bees;
import com.fourmeeting.bee.bees.model.vo.BeesAdmin;
import com.fourmeeting.bee.bees.model.vo.BeesAdminSearch;
import com.fourmeeting.bee.bees.model.vo.Setting;
import com.fourmeeting.bee.beesuser.model.vo.BeesUserList;

@Repository("beesDAO")
public class BeesDAO {

	public int insertBee(SqlSessionTemplate sqlSession, Bees bee) {
		int beeResult = sqlSession.insert("bees.insertBee", bee);		
		return beeResult;
	}

	public int insertSetting(SqlSessionTemplate sqlSession, Bees bee) {
		int beeSetting = sqlSession.insert("bees.insertSetting", bee);		
		return beeSetting;
	}
	
	public int insertHostBeeUser(SqlSessionTemplate sqlSession, Bees bee) {
		int beehostResult = sqlSession.insert("bees.insertHostBeeUser", bee);		
		return beehostResult;
	}

	public Bees selectBeeSetting(SqlSessionTemplate sqlSession, Bees bee) {
		Bees beeResult = sqlSession.selectOne("bees.selectBeeSetting", bee);
		return beeResult;
	}

	public int updateBeeSettingCover(SqlSessionTemplate sqlSession, Bees bee) {
		int beeResult = sqlSession.update("bees.updateBeeSettingCover", bee);		
		return beeResult;
	}

	public int updateBeeSettingType(SqlSessionTemplate sqlSession, Bees bee) {
		int beeResult = sqlSession.update("bees.updateBeeSettingType", bee);		
		return beeResult;
	}

	public int updateBeeSettingIntro(SqlSessionTemplate sqlSession, Bees bee) {
		int beeResult = sqlSession.update("bees.updateBeeSettingIntro", bee);		
		return beeResult;
	}

	public int updateBeeSettingMaxMember(SqlSessionTemplate sqlSession, Bees bee) {
		int beeResult = sqlSession.update("bees.updateBeeSettingMaxMember", bee);		
		return beeResult;
	}

	public int updateBeeSettingJoinStandard(SqlSessionTemplate sqlSession, Bees bee) {
		int beeResult = sqlSession.update("bees.updateBeeSettingJoinStandard", bee);		
		return beeResult;
	}

	public ArrayList<BeesUserList> selectBeesUser(SqlSessionTemplate sqlSession, int beesNO) {
		List list = sqlSession.selectList("bees.selectBeesUser", beesNO);		
		return (ArrayList<BeesUserList>)list;
	}

	public ArrayList<BeesUserList> selectBeesManager(SqlSessionTemplate sqlSession, int beesNO) {
		List list = sqlSession.selectList("bees.selectBeesManager", beesNO);		
		return (ArrayList<BeesUserList>)list;

	}

	public ArrayList<BeesUserList> selectBeesOnlyUser(SqlSessionTemplate sqlSession, int beesNO) {
		List list = sqlSession.selectList("bees.selectBeesOnlyUser", beesNO);		
		return (ArrayList<BeesUserList>)list;
	}

	public ArrayList<BeesUserList> selectBeesBlock(SqlSessionTemplate sqlSession, int beesNO) {
		List list = sqlSession.selectList("bees.selectBeesBlock", beesNO);		
		return (ArrayList<BeesUserList>)list;
	}

	public Setting selectBeeMemberPermission(SqlSessionTemplate sqlSession, Setting setting) {
		Setting settingResult = sqlSession.selectOne("bees.selectBeeMemberPermission", setting);
		return settingResult;
	}

	public int updateBeeOneWithdraw(SqlSessionTemplate sqlSession, BeesUserList beeUser) {
		int beeUserResult = sqlSession.update("bees.updateBeeOneWithdraw", beeUser);		
		return beeUserResult;
	}

	public int updateBeeOneDelete(SqlSessionTemplate sqlSession, Bees bee) {
		int beeResult = sqlSession.update("bees.updateBeeOneDelete", bee);		
		return beeResult;
	}

	public int updateBeeMemberPermissionSet(SqlSessionTemplate sqlSession, Setting setting) {
		int settingResult = sqlSession.update("bees.updateBeeMemberPermissionSet", setting);		
		return settingResult;
	}

	public int updateManagerToUser(SqlSessionTemplate sqlSession, BeesUserList beeUser) {
		int beeUserResult = sqlSession.update("bees.updateManagerToUser", beeUser);		
		return beeUserResult;
	}

	public int updateMemberWithdraw(SqlSessionTemplate sqlSession, BeesUserList beeUser) {
		int beeUserResult = sqlSession.update("bees.updateMemberWithdraw", beeUser);		
		return beeUserResult;
	}

	public int subMemberWithdrawBlockSet(SqlSessionTemplate sqlSession, BeesUserList beeUser) {
		int beeUserResult = sqlSession.update("bees.subMemberWithdrawBlockSet", beeUser);		
		return beeUserResult;
	}

	public int subMemberBlockDeleteSet(SqlSessionTemplate sqlSession, BeesUserList beeUser) {
		int beeUserResult = sqlSession.update("bees.subMemberBlockDeleteSet", beeUser);		
		return beeUserResult;
	}

	public int updatesubJoinManagerSet(SqlSessionTemplate sqlSession, BeesUserList beeUser) {
		int beeUserResult = sqlSession.update("bees.updatesubJoinManagerSet", beeUser);		
		return beeUserResult;
	}

	
	
	
	
	public Bees beesSelectOne(SqlSessionTemplate sqlSession, int beesNo) {
		// TODO Auto-generated method stub
		
		Bees bees = sqlSession.selectOne("bees.beesSelectOne",beesNo);
		return bees;
	}

	public Setting selectBeesSetting(SqlSessionTemplate sqlSession, int beesNo) {
		// TODO Auto-generated method stub
		Setting setting = sqlSession.selectOne("setting.beesSetting",beesNo);
		return setting;
	}
	
	
	
	
	
	
	//정평주(관리자)--------------------------------------------------------------------------
		//모임관리
		public ArrayList<BeesAdmin> selectBeesAdminList(SqlSessionTemplate sqlSession, PagingVO pv) {
			
			List list = sqlSession.selectList("beesAdmin.selectBeesAdminList", pv);
			
			return (ArrayList<BeesAdmin>)list;
			
		}
		
		
		//페이징처리(bees전체 개수)
		public int countBeesAdmin(SqlSessionTemplate sqlSession) {
			
			PagingVO pv = sqlSession.selectOne("beesAdmin.countBeesAdmin");
			
			int totalPage = pv.getTotalPage();
			System.out.println(totalPage);
			
			return totalPage;
		}
		
		
		//모임관리(bees 삭제)
		public int beesDelete(SqlSessionTemplate sqlSession, int beesNo) {
			
			int result = sqlSession.update("beesAdmin.beesDelete",beesNo);
			return result;
			
		}

		//모임관리(bees 삭제)
		public int beesRollback(SqlSessionTemplate sqlSession, int beesNo) {

			int result = sqlSession.update("beesAdmin.beesRollback",beesNo);
			return result;
			
		}

		
		//모임관리(bees 검색)
		public ArrayList<BeesAdmin> adminBeesSearch(SqlSessionTemplate sqlSession, BeesAdminSearch bas) {
			
			List list = sqlSession.selectList("beesAdmin.adminBeesSearch",bas);
			
			return (ArrayList<BeesAdmin>)list;
			
		}
	
	

}
