package egovframework.example.notice.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("noticeMapper")
public interface NoticeMapper {

	List<EgovMap> AllNoticeList(Map<String, Object> map);

	void insertNotice(Map<String, Object> noticeBoard);

	void insertNoticeImage(Map<String, Object> dtlmap);

	List<EgovMap> selectNoticeList();

	EgovMap selectNotice(int ncode);

	List<EgovMap> noticeImgList(int ncode);

	void addViews(int ncode);

	void delNoticeImg(int ncode);
	void delNotice(int ncode);

	void updateNotice(Map<String, Object> resMap);
	void updateNoticeImage(Map<String, Object> dtlmap);
	void delectNoticeImage(Map<String, Object> dtlmap);

}
