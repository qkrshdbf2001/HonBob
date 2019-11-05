package egovframework.example.member.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.example.member.Member;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("memberMapper")
public interface MemberMapper {

	 List<EgovMap> selectMemberList() throws Exception;

	EgovMap selectMember(String userid) throws Exception;

	void insertMember(Member member) throws Exception;

	void insertUzip(Member member) throws Exception;

	EgovMap memberCheck(HashMap<String, Object> resMap) throws Exception;

	List<EgovMap> AllMemberList(Map<String, Object> map) throws Exception;

	EgovMap selectMemberCode(String ucode) throws Exception;

	EgovMap addressInfo(String ucode) throws Exception;

	void getKey(Map<String, Object> resMap) throws Exception;

	EgovMap selectKey(Map<String, Object> resMap) throws Exception;

	void changePwd(Map<String, Object> resMap) throws Exception;

	EgovMap selectEamil(Map<String, Object> resMap) throws Exception;

}
 
