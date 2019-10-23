package egovframework.example.question.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("questionMapper")
public interface QuestionMapper {

	List<EgovMap> AllQuestionList();

	void insertQuestion(Map<String, Object> resMap);

}
