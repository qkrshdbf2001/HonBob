package egovframework.example.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.example.member.Member;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MemberService {

	List<EgovMap> selectMemberList();

	EgovMap selectMember(String userid);

	void insertMember(Member member);

	void insertUzip(Member member);

	EgovMap memberCheck(HashMap<String, Object> resMap);

	List<EgovMap> AllMemberList(Map<String, Object> map);

	EgovMap memberInfo(String uid);

	EgovMap addressInfo(String ucode);

}
