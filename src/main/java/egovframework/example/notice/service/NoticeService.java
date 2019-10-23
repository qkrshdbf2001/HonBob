package egovframework.example.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.rte.psl.dataaccess.util.EgovMap;


public interface NoticeService {

	List<EgovMap> AllNoticeList(Map<String, Object> map);

	void saveAdNotice(Map<String, Object> resMap, MultipartFile[] file, MultipartHttpServletRequest muti);

	List<EgovMap> selectNoticeList();

	EgovMap selectNotice(int ncode);

	List<EgovMap> noticeImgList(int ncode);

	void addViews(int ncode);

	void delectNotice(int ncode);

}
