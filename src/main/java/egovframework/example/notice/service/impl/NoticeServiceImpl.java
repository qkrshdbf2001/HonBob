package egovframework.example.notice.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.cmmn.FileUpload;
import egovframework.example.notice.service.NoticeService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Resource(name="noticeMapper")
	private NoticeMapper NoticeMapper;
	
	@Autowired
	private FileUpload fileupload;
	
	@Override
	public List<EgovMap> AllNoticeList(Map<String, Object> map) throws Exception {
		return NoticeMapper.AllNoticeList(map);
	}

	@Override
	public void saveAdNotice(Map<String, Object> resMap, MultipartFile[] file, MultipartHttpServletRequest muti) throws Exception {
		String[] fileName= fileupload.fileUpload(file, muti);
		Map<String, Object> dtlmap = new HashMap<String, Object>();
		
		//삽입시 실행됨.
		if (resMap.get("editType").equals("insert")) {
			NoticeMapper.insertNotice(resMap);
			
			for (int i=0; i< fileName.length; i++) {
				dtlmap.clear();
				dtlmap.put("ncode", resMap.get("ncode"));
				dtlmap.put("fileName", fileName[i]);
				
				NoticeMapper.insertNoticeImage(dtlmap);
			}
			
		//수정시 실행
		} else if (resMap.get("editType").equals("update")) {
			NoticeMapper.updateNotice(resMap);
			
			for (int i=0; i< fileName.length; i++) {
				dtlmap.clear();
				dtlmap.put("fileName", fileName[i]);
				dtlmap.put("ncode", resMap.get("ncode"));
				
				NoticeMapper.updateNoticeImage(dtlmap);
			}
			
			resMap.put("fileCount", fileName.length);
			NoticeMapper.delectNoticeImage(resMap);
		}
		
	}

	@Override
	public List<EgovMap> selectNoticeList() throws Exception {
		return NoticeMapper.selectNoticeList();
	}

	@Override
	public EgovMap selectNotice(int ncode) throws Exception {
		return NoticeMapper.selectNotice(ncode);
	}

	@Override
	public List<EgovMap> noticeImgList(int ncode) throws Exception {
		return NoticeMapper.noticeImgList(ncode);
	}

	@Override
	public void addViews(int ncode) throws Exception {
		NoticeMapper.addViews(ncode);
	}

	@Override
	public void delectNotice(int ncode) throws Exception {
		NoticeMapper.delNotice(ncode);
	}

}
