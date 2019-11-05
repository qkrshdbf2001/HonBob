package egovframework.example.question.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface QuestionService {

	List<EgovMap> AllQuestionList() throws Exception;

	void insertQuestion(Map<String, Object> resMap) throws Exception;

}
