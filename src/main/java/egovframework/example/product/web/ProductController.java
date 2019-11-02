package egovframework.example.product.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.product.service.ProductService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class ProductController {
	
	@Resource(name = "productService")
	private ProductService productService;
	
	@RequestMapping(value="productList.do")
	public String productList (@RequestParam(required=false, defaultValue="1") int pageName,
								Model model) {
		
		List<EgovMap> productSelect = productService.selectProductList(pageName);
		List<EgovMap> productimg = productService.selectImgList();
		
		System.out.println(productSelect);
		System.out.println(productimg);
		
		model.addAttribute("productimg", productimg);
		model.addAttribute("productSelect", productSelect);
		model.addAttribute("pageName", pageName);
		
		return "product/productList.product";
	}
	
	@RequestMapping(value="productDetail.do")
	public String productDetail (@RequestParam(required=false, defaultValue="1") int pageName,
								 @RequestParam(required=false, defaultValue="1") int pcode,
								 Model model) {
		
		EgovMap product = productService.selectProduct(pcode);
		
		if (product == null) {
			return "redirect:main.do";
		}
		
		List<EgovMap> imgList = productService.selectProductImg(pcode);
		List<EgovMap> review = productService.selectReview(pcode);
		
		System.out.println(review);
		
		model.addAttribute("imgList", imgList);
		model.addAttribute("product", product);
		model.addAttribute("pageName", pageName);
		model.addAttribute("review", review);
		
		if (!review.isEmpty()) {
			model.addAttribute("avge", review.get(0).get("avge"));
			model.addAttribute("cnt", review.get(0).get("cnt"));
		} 
		
		return "product/productDetail.product";
	}
	
	@RequestMapping(value="productPay.do")
	public String productPay (@RequestParam(required=false, defaultValue="1") int pcode,
							  @RequestParam(required=false, defaultValue="1") int count,
							  @RequestParam(required=false, defaultValue="1") String img,
							  Model model, HttpSession session) {
		
		if (session.getAttribute("ucode") == null) {
			String msg = "로그인을 먼저 진행해주세요.";
			model.addAttribute("msg", msg);
			return "member/login.login";
		}
		
		int total;
		int price;
		
		EgovMap product = productService.selectProduct(pcode);
		price = (int) product.get("price");
		
		total = price*count;
		
		model.addAttribute("product", product);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("img", img);
		
		return "product/productPay.product";
	}
	
	@RequestMapping(value="orderInfo.do")
	public String orderInfo (Model model, HttpSession session) {
		
		if (session.getAttribute("ucode") == null) {
			String msg = "로그인을 먼저 진행해주세요.";
			model.addAttribute("msg", msg);
			return "member/login.login";
		}
		String ucode = session.getAttribute("ucode").toString();
		List<EgovMap> orderList = productService.selectMyoderList(ucode);
		
		System.out.println(orderList);
		
		model.addAttribute("orderList", orderList);
		return "info/orderInfo.product";
	}
	
	@RequestMapping(value="orderdelete.do")
	public void orderdelete (@RequestParam int id,
							 Model model, HttpSession session) {
		
		productService.delectOrder(id);
	}
}
