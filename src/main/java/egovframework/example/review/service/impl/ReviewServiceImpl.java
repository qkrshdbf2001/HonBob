package egovframework.example.review.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.cmmn.FileUpload;
import egovframework.example.review.service.ReviewService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	@Resource(name="reviewMapper")
	private ReviewMapper reviewMapper;

	@Autowired
	private FileUpload fileupload;
	
	@Override
	public EgovMap selectOrderName(Map<String, Object> resMap) {
		return reviewMapper.selectOrderName(resMap);
	}

	@Override
	public void addReviewData(Map<String, Object> resMap, MultipartFile[] file, MultipartHttpServletRequest muti) {
		String[] fileName= fileupload.fileUpload(file, muti);
		resMap.put("fileName", fileName[0]);
		reviewMapper.insertAddReview(resMap);
	}
}
