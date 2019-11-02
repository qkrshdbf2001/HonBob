package egovframework.example.member.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.member.Member;
import egovframework.example.member.service.MemberService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Resource(name="memberMapper")
	private MemberMapper memberMapper;
	
	@Override
	public List<EgovMap> selectMemberList() {
		return memberMapper.selectMemberList();
	}

	@Override
	public EgovMap selectMember(String userid) {
		return memberMapper.selectMember(userid);
	}

	@Override
	public void insertMember(Member member) {
		memberMapper.insertMember(member);
	}

	@Override
	public void insertUzip(Member member) {
		memberMapper.insertUzip(member);
	}

	@Override
	public EgovMap memberCheck(HashMap<String, Object> resMap) {
		return memberMapper.memberCheck(resMap);
	}

	@Override
	public List<EgovMap> AllMemberList(Map<String, Object> map) {
		return memberMapper.AllMemberList(map);
	}

	@Override
	public EgovMap memberInfo(String uid) {
		
		return memberMapper.selectMemberCode(uid);
	}

	@Override
	public EgovMap addressInfo(String ucode) {
		return memberMapper.addressInfo(ucode);
	}

	@Override
	public EgovMap selectEamil(Map<String, Object> resMap) {
		return memberMapper.selectEamil(resMap);
	}

}
