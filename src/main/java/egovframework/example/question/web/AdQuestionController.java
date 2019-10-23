package egovframework.example.question.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.question.service.QuestionService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class AdQuestionController {

	@Resource(name="questionService")
	private QuestionService questionService;
	
	@RequestMapping("adQuestion.do")
	public String adQuestionMng() {
		
		return "question/adQuestionMng.admin";
	}
	
	@RequestMapping(value="adQuestionList.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String adQuestionList() {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		try {
			List<EgovMap> AllQuestionList = questionService.AllQuestionList();
			resMap.put("rows",AllQuestionList);
			System.out.println(AllQuestionList);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return JsonUtil.MapToJson(resMap);
	}
}
