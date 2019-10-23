package egovframework.example.board;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("about.do")
	public String about() {
		return "board/about.board";
	}
	
	@RequestMapping("agree.do")
	public String agree() {
		return "board/agree.board";
	}
	
	@RequestMapping("agree1.do")
	public String agree1() {
		return "board/agree1.board";
	}
	
	@RequestMapping("basketInfo.do")
	public String basketInfo(HttpSession session, Model model) {
		
		if (session.getAttribute("ucode") == null) {
			String msg = "로그인을 먼저 진행해주세요.";
			model.addAttribute("msg", msg);
			return "member/login.login";
		}
		
		return "info/basketInfo.board";
	}
}
