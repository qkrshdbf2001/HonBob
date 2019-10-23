package egovframework.example.notice.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.notice.service.NoticeService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class AdNoticeController {
	
	@Resource(name = "noticeService")
	private NoticeService noticeService;
	
	@RequestMapping("adNotice.do")
	public String adNotice() {
		
		return "board/adNoticeMng.admin";
	}
	
	@RequestMapping("adNoticeReg.do")
	public String adNoticeReg() {
		
		return "board/adNoticeReg.admin";
	}
	
	@RequestMapping("adNoticeData.do")
	public String adNoticeData(@RequestParam String subj, 
							   @RequestParam(defaultValue="false") String textarea,
							   @RequestParam(defaultValue="false") MultipartFile file1,
							   @RequestParam(defaultValue="false") MultipartFile file2,
							   @RequestParam(defaultValue="false") MultipartFile file3,
							   @RequestParam(defaultValue="false") MultipartFile file4,
							   MultipartHttpServletRequest muti, HttpSession session) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		System.out.println(session.getAttribute("ucode"));
		resMap.put("ucode", session.getAttribute("ucode"));
		resMap.put("subj", subj);
		resMap.put("textarea", textarea);
		
		MultipartFile[] file = {file1, file2, file3, file4};
		
		try {
			noticeService.saveAdNotice(resMap, file, muti);
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return "board/adNoticeMng.admin";
	}
	
	@RequestMapping(value="adNoticeList.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String adNoticeList(@RequestParam Map<String, Object> map) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		try {
			List<EgovMap> AllNoticeList = noticeService.AllNoticeList(map);
			resMap.put("rows",AllNoticeList);
			resMap.put("page",		map.get("page"));
			resMap.put("total",		AllNoticeList.get(0).get("totalPage"));
			resMap.put("records",	AllNoticeList.get(0).get("totalCnt"));
			System.out.println(AllNoticeList);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return JsonUtil.MapToJson(resMap);
	}
	
	@RequestMapping("adNoticeDtl.do")
	public String adNoticeDtl(@RequestParam int ncode, Model model) {
		System.out.println(ncode);
		
		EgovMap notice = noticeService.selectNotice(ncode);
		List<EgovMap> imgList = noticeService.noticeImgList(ncode);
		
		System.out.println(notice);
		System.out.println(imgList);
		
		model.addAttribute("notice", notice);
		model.addAttribute("imgList", imgList);
		
		return "board/adNoticeReg.admin";
	}
	
	@RequestMapping("adNoticeDel.do")
	public String adNoticeDel(@RequestParam int ncode, Model model, HttpSession session) {
		int ccode = (int) session.getAttribute("ccode");
		
		System.out.println(ccode);
		
		if (ccode == 1) {
			return "redirect:adProductMng.do";
		}
		
		
		noticeService.delectNotice(ncode);
		
		return "redirect:adNotice.do";
	}
}
