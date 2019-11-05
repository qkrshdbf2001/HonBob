package egovframework.example.member.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.member.Member;
import egovframework.example.member.service.MemberService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class AdMemberController {
	
	public AdMemberController() {
		
	}
		
	@Resource(name="memberService")
	private MemberService memberService;
	
	//어드민 조회페이지
	@RequestMapping("adMemberMng.do")
	public String adMemberMng() {
		
		return "member/adMemberMng.admin";
	}
	
	//어드민 리스트8
	@RequestMapping(value="adMemberList.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String adMemberList(@RequestParam Map<String, Object> map) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		try {
			List<EgovMap> AllMemberList = memberService.AllMemberList(map);
			resMap.put("rows",AllMemberList);
			resMap.put("page",		map.get("page"));
			resMap.put("total",		AllMemberList.get(0).get("totalPage"));
			resMap.put("records",	AllMemberList.get(0).get("totalCnt"));
			System.out.println(AllMemberList);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return JsonUtil.MapToJson(resMap);
	}
	
	@RequestMapping("adMemberReg.do")
	public String adMemberReg() {
		
		return "member/adMemberReg.admin";
	}
	
	@RequestMapping("adMemberData.do")
	public String adMemberData(Member member, HttpSession session) throws Exception {
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-mm-dd");
		member.setBirthDay(dateformat.parse(member.getBirthDayString()));
		
		//맴버 정보 등록
		memberService.insertMember(member);
		
		//해당유저 번호 따오기
		EgovMap selectUid = memberService.selectMember(member.getUserid());
		member.setUcode((int) selectUid.get("ucode"));

		//맴버 주소 등록
		memberService.insertUzip(member);
		
		return "member/adMemberMng.admin";
	}
	
	@RequestMapping("adMemberDtl.do")
	public String MemberDtl(@RequestParam String ucode, Model model) throws Exception {
		EgovMap memberInfo = memberService.memberInfo(ucode);
		System.out.println(memberInfo);
		model.addAttribute("memberInfo", memberInfo);
		return "member/adMemberReg.admin";
	}
	
}
