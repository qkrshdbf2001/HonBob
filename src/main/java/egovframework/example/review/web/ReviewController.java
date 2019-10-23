package egovframework.example.review.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.product.service.ProductService;
import egovframework.example.review.service.ReviewService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class ReviewController {
	
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	@RequestMapping(value="reviewInsert.do", method=RequestMethod.GET)
	public String reviewInsert(@RequestParam int id,
							   Model model, HttpSession session) {
		
		if (session.getAttribute("ucode") == null) {
			String msg = "로그인을 먼저 진행해주세요.";
			model.addAttribute("msg", msg);
			return "member/login.login";
		}
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("ocode",id);
		resMap.put("ucode",session.getAttribute("ucode").toString());

		EgovMap orderName = reviewService.selectOrderName(resMap);
		System.out.println(orderName);
		
		if (orderName == null) {
			return "main/main.main";
		}
		
		model.addAttribute("orderName", orderName);
		return "review/reviewsInfo.board";
	}
	
	@RequestMapping(value="reviewData.do", method = RequestMethod.POST)
	public String reviewInsertData(@RequestParam(required=false) int rcode,
								   @RequestParam(required=false) String rcommend,
								   @RequestParam(required=false) int rscore,
								   @RequestParam(required=false) MultipartFile rimage,
								   @RequestParam(required=false) int pcode,
								   MultipartHttpServletRequest muti, Model model, HttpSession session) {
		
		if (session.getAttribute("ucode") == null) {
			String msg = "로그인을 먼저 진행해주세요.";
			model.addAttribute("msg", msg);
			return "member/login.login";
		}
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("rcode",rcode);
		resMap.put("rcommend",rcommend);
		resMap.put("pcode",pcode);
		resMap.put("rscore",rscore);
		resMap.put("ucode",session.getAttribute("ucode").toString());
		
		if (rimage == null) {
			MultipartFile[] file = {};
			reviewService.addReviewData(resMap, file, muti);
		} else {
			MultipartFile[] file = {rimage};
			reviewService.addReviewData(resMap, file, muti);
		}
		
		return "redirect:orderInfo.do";
	}
}
