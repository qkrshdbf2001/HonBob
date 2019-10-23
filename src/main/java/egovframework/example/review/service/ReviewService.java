package egovframework.example.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface ReviewService {

	EgovMap selectOrderName(Map<String, Object> resMap);

	void addReviewData(Map<String, Object> resMap, MultipartFile[] file, MultipartHttpServletRequest muti);

}
