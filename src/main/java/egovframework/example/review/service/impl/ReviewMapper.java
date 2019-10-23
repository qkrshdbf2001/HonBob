package egovframework.example.review.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("reviewMapper")
public interface ReviewMapper {

	EgovMap selectOrderName(Map<String, Object> resMap);

	void insertAddReview(Map<String, Object> resMap);

}
