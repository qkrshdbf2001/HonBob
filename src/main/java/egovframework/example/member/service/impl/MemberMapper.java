package egovframework.example.member.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.example.member.Member;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("memberMapper")
public interface MemberMapper {

	 List<EgovMap> selectMemberList();

	EgovMap selectMember(String userid);

	void insertMember(Member member);

	void insertUzip(Member member);

	EgovMap memberCheck(HashMap<String, Object> resMap);

	List<EgovMap> AllMemberList(Map<String, Object> map);

	EgovMap selectMemberCode(String ucode);

	EgovMap addressInfo(String ucode);
}
 
