package egovframework.example.notice.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.notice.service.NoticeService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class NoticeController {
	
	@Resource(name = "noticeService")
	private NoticeService noticeService;
	
	@RequestMapping("noticeList.do")
	public String noticeList() {
		return "board/notice_list.notice";
	}
	
	@RequestMapping("notice.do")
	public String notice(Model model) {
		
		List<EgovMap> noticeList = noticeService.selectNoticeList();
		System.out.println(noticeList);
		model.addAttribute("noticeList", noticeList);
		return "board/notice.board";
	}
	
	@RequestMapping("noticeDetail.do")
	public String noticeDetail(Model model, @RequestParam(required=false, defaultValue="-1") int ncode) {
		
		if(ncode == -1) return "redirect:notice.do";
		
		noticeService.addViews(ncode);
		EgovMap notice = noticeService.selectNotice(ncode);
		List<EgovMap> imgList = noticeService.noticeImgList(ncode);
		
		System.out.println(imgList);
		
		model.addAttribute("notice", notice);
		model.addAttribute("imgList", imgList);
		return "board/noticeView.board";
	}
}
