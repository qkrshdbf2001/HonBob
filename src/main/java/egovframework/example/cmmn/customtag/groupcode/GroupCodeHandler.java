package egovframework.example.cmmn.customtag.groupcode;

import java.rmi.AlreadyBoundException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import egovframework.example.cmmn.customtag.groupcode.service.GroupCodeVO;

/**
 * 
 * GroupCode 관리를 위한  Handler Class
 *
 */
public class GroupCodeHandler {
	
	private volatile static GroupCodeHandler instance;
	
	private List<GroupCodeVO> groupCodeList;
	
	private GroupCodeHandler(SqlSession sqlSession) throws Exception {
		
		this.groupCodeList = sqlSession.selectList("selectCodeList", null);
	}
	
	public static GroupCodeHandler instance() {
		
		if(instance == null) {
			throw new NullPointerException("instance is null. \n");
		}
		
		return instance;
	}
	
	public static synchronized void createInstance(SqlSession sqlSession) throws Exception {
		
		if (instance == null) {
			instance = new GroupCodeHandler(sqlSession);
		} else {
			throw new AlreadyBoundException("instance already exists.");
		}
	}
			
	public GroupCodeVO getCode(GroupCodeVO groupCodeVO) {
		GroupCodeVO groupCode = new GroupCodeVO();

		for (GroupCodeVO codeVo : this.groupCodeList) {

			if (groupCodeVO.getCmCdGrp().equals(codeVo.getCmCdGrp()) && groupCodeVO.getCmCd().equals(codeVo.getCmCd())) {
	
				if (groupCodeVO.getUseYn() == null || codeVo.getUseYn().equals(groupCodeVO.getUseYn())) {
					groupCode = codeVo;
	
					break;
				}
			}
		}

		return groupCode;
	}

	public List<GroupCodeVO> getCodeList(GroupCodeVO groupCodeVO) {
		List<GroupCodeVO> groupCodeList = new ArrayList<GroupCodeVO>();

		if (groupCodeVO == null) {
			return groupCodeList;
		}

		for (GroupCodeVO codeVo : this.groupCodeList) {
			GroupCodeVO groupCode = new GroupCodeVO();
	
			if (groupCodeVO.getCmCdGrp().equals(codeVo.getCmCdGrp())) {
		
				if (groupCodeVO.getUseYn() == null || codeVo.getUseYn().equals(groupCodeVO.getUseYn())) {
					groupCode = codeVo;
				
					groupCodeList.add(groupCode);
				}
			}
		}

		return groupCodeList;
	}

}
