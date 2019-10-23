package egovframework.example.question.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.question.service.QuestionService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class QuestionController {
	
	@Resource(name="questionService")
	private QuestionService questionService;
	
	@RequestMapping("suppot.do") 
	public String suppot() {
		return "question/support.board";
	}
	
	@RequestMapping("question.do") 
	public String question(Model model) {
		List<EgovMap> questionList = questionService.AllQuestionList();
		System.out.println(questionList);
		model.addAttribute("questionList", questionList);
		
		return "question/question.board";
	}
	
	@RequestMapping(value="questionInsert.do", method=RequestMethod.GET) 
	public String questionInsert(Model model, HttpSession session) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		if (session.getAttribute("ucode") == null) {
			System.out.println(session.getAttribute("ucode"));
			String msg = "로그인을 먼저 진행해주세요.";
			model.addAttribute("msg", msg);
			return "member/login.login";
		}

		return "question/questionInsert.board";
	}
	
	@RequestMapping(value="questionInsert.do", method=RequestMethod.POST) 
	public String saveQuestion(@RequestParam String title, @RequestParam String content,
								 Model model, HttpSession session) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		if (session.getAttribute("ucode") == null) {
			System.out.println(session.getAttribute("ucode"));
			String msg = "로그인을 먼저 진행해주세요.";
			model.addAttribute("msg", msg);
			return "member/login.login";
		}
		
		resMap.put("title", title);
		resMap.put("content", content);
		resMap.put("uname", session.getAttribute("loginName"));

		questionService.insertQuestion(resMap);
		
		return "question/questionInsert.board";
	}
	
	
}
