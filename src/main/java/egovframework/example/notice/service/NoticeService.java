package egovframework.example.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.rte.psl.dataaccess.util.EgovMap;


public interface NoticeService {

	List<EgovMap> AllNoticeList(Map<String, Object> map) throws Exception;

	void saveAdNotice(Map<String, Object> resMap, MultipartFile[] file, MultipartHttpServletRequest muti) throws Exception;

	List<EgovMap> selectNoticeList() throws Exception;

	EgovMap selectNotice(int ncode) throws Exception;

	List<EgovMap> noticeImgList(int ncode) throws Exception;

	void addViews(int ncode) throws Exception;

	void delectNotice(int ncode) throws Exception;

}
