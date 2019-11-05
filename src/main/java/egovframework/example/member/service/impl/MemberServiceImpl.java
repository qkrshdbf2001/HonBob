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
	public List<EgovMap> selectMemberList() throws Exception {
		return memberMapper.selectMemberList();
	}

	@Override
	public EgovMap selectMember(String userid) throws Exception {
		return memberMapper.selectMember(userid);
	}

	@Override
	public void insertMember(Member member) throws Exception{
		memberMapper.insertMember(member);
	}

	@Override
	public void insertUzip(Member member) throws Exception {
		memberMapper.insertUzip(member);
	}

	@Override
	public EgovMap memberCheck(HashMap<String, Object> resMap) throws Exception {
		return memberMapper.memberCheck(resMap);
	}

	@Override
	public List<EgovMap> AllMemberList(Map<String, Object> map) throws Exception {
		return memberMapper.AllMemberList(map);
	}

	@Override
	public EgovMap memberInfo(String uid) throws Exception {
		
		return memberMapper.selectMemberCode(uid);
	}

	@Override
	public EgovMap addressInfo(String ucode) throws Exception {
		return memberMapper.addressInfo(ucode);
	}

	@Override
	public EgovMap selectEamil(Map<String, Object> resMap) throws Exception {
		return memberMapper.selectEamil(resMap);
	}

}
