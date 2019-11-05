package egovframework.example.notice.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("noticeMapper")
public interface NoticeMapper {

	List<EgovMap> AllNoticeList(Map<String, Object> map) throws Exception;

	void insertNotice(Map<String, Object> noticeBoard) throws Exception;

	void insertNoticeImage(Map<String, Object> dtlmap) throws Exception;

	List<EgovMap> selectNoticeList() throws Exception;

	EgovMap selectNotice(int ncode) throws Exception;

	List<EgovMap> noticeImgList(int ncode) throws Exception;

	void addViews(int ncode) throws Exception;

	void delNoticeImg(int ncode) throws Exception;
	void delNotice(int ncode) throws Exception;

	void updateNotice(Map<String, Object> resMap) throws Exception;
	void updateNoticeImage(Map<String, Object> dtlmap) throws Exception;
	void delectNoticeImage(Map<String, Object> dtlmap) throws Exception;

}
