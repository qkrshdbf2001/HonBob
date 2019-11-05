package egovframework.example.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import egovframework.example.member.Member;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MemberService {

	List<EgovMap> selectMemberList() throws Exception;

	EgovMap selectMember(String userid) throws Exception;

	void insertMember(Member member) throws Exception;

	void insertUzip(Member member) throws Exception;

	EgovMap memberCheck(HashMap<String, Object> resMap) throws Exception;

	List<EgovMap> AllMemberList(Map<String, Object> map) throws Exception;

	EgovMap memberInfo(String uid) throws Exception;

	EgovMap addressInfo(String ucode) throws Exception;

	EgovMap selectEamil(Map<String, Object> resMap) throws Exception;

}
