package egovframework.example.question.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.question.service.QuestionService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("questionService")
public class QuestionImpl implements QuestionService{

	@Resource(name="questionMapper")
	private QuestionMapper questionMapper;
	
	@Override
	public List<EgovMap> AllQuestionList() {
		return questionMapper.AllQuestionList();
	}

	@Override
	public void insertQuestion(Map<String, Object> resMap) {
		questionMapper.insertQuestion(resMap);
	}
	
}
