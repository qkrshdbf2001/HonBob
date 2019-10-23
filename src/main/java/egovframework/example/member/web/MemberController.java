package egovframework.example.member.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.member.Member;
import egovframework.example.member.service.MemberService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class MemberController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	//로그인 관련
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String login() {
		
		return "member/login.login";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String login(@RequestParam String userid,
						@RequestParam String pwd,
						ModelMap model, HttpSession session) {
		
		String msg ="";
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("userid", userid);
		resMap.put("pwd", pwd);
		
		EgovMap selectMember = memberService.memberCheck(resMap);
		
		if (selectMember == null) {
			msg = "비밀번호가 틀렸습니다.";
		} else {
			System.out.println(selectMember);
			session.setAttribute("ucode", selectMember.get("ucode"));
			session.setAttribute("loginName", selectMember.get("uname"));
			session.setAttribute("ccode", selectMember.get("ccode"));
			return "main/main.main";
		}
		
		model.addAttribute("msg", msg);

		return "member/login.login";
	}
	
	//logout
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main/main.main";
	}
	
	//회원가입 관련
	@RequestMapping(value="sign.do", method=RequestMethod.GET)
	public String sign() {
		
		return "member/sign_one.login";
	}
	
	@RequestMapping(value="sign1.do", method=RequestMethod.GET)
	public String sign1() {
		
		return "member/sign_two.login";
	}
	
	@RequestMapping(value="sign1.do", method=RequestMethod.POST)
	public String sign1(Member member, HttpSession session) throws ParseException {
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-mm-dd");
		System.out.println(member);
		System.out.println(member.getBirthDayString());
		member.setBirthDay(dateformat.parse(member.getBirthDayString()));
		
		//맴버 정보 등록
		memberService.insertMember(member);
		
		//해당유저 번호 따오기
		EgovMap selectUid = memberService.selectMember(member.getUserid());
		member.setUcode((int) selectUid.get("ucode"));

		//맴버 주소 등록
		memberService.insertUzip(member);
		
		session.setAttribute("loginName", selectUid.get("uname"));
		session.setAttribute("ccode", selectUid.get("ccode"));
		session.setAttribute("ucode", selectUid.get("ucode"));
		
		if (member.getUserid() == null || member.getPwd() == null || member.getName() == null 
				|| member.getSex() == null || member.getYear() == 0 || member.getMonth() == 0 
				|| member.getDay() == 0 || member.getEmail() == null || member.getZipNo() == null 
				|| member.getRoadAddrPart1() == null || member.getAddrDetail() == null) {
			return "cmmn/error";
		}
		
		return "member/sign_success.login";
		
	}
	
	//아이디중복체크
	@RequestMapping(value="loginCheck.do")
	@ResponseBody
	public String idCheck(@RequestParam String userid) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		int check = 1;
		
		try {
			EgovMap member = memberService.selectMember(userid);
			
			if(member == null) {
				check = 0;
			}	
		} catch (Exception e) {
			System.out.println(e);
		}
		
		resMap.put("check", check);
		
		return JsonUtil.MapToJson(resMap);
	}
	
	//맴버 정보
	@RequestMapping(value="memberInfo.do")
	public String memberInfo(HttpSession session, Model model) {
		
		if (session.getAttribute("ucode") == null) {
			String msg = "로그인을 먼저 진행해주세요.";
			model.addAttribute("msg", msg);
			return "member/login.login";
		}
		System.out.println(session.getAttribute("ucode").toString());
		EgovMap memberInfo = memberService.memberInfo(session.getAttribute("ucode").toString());
		System.out.println(memberInfo);
		
		model.addAttribute("memberInfo", memberInfo);
		return "info/memberInfo.info";
	}
	
	//주소 정보
	@RequestMapping(value="addressInfo.do")
	public String addressInfo(HttpSession session, Model model) {
		
		if (session.getAttribute("ucode") == null) {
			String msg = "로그인을 먼저 진행해주세요.";
			model.addAttribute("msg", msg);
			return "member/login.login";
		}
		
		EgovMap addressInfo = memberService.addressInfo(session.getAttribute("ucode").toString());
		System.out.println(addressInfo);
		model.addAttribute("addressInfo", addressInfo);
		return "info/addressInfo.info";
	}
	
}
