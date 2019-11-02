package egovframework.example.product.web;

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
import egovframework.example.product.service.ProductService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class AdProductController {

	@Resource(name="productService")
	private ProductService productService;
	
	@RequestMapping("adProductMng.do")
	public String productMng() {
		return "product/adProductMng.admin";
	}
	
	@RequestMapping(name = "adProductList.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String adProductList(@RequestParam Map<String, Object> map) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		try {
			List<EgovMap> allProductList = productService.allProductList(map);
			resMap.put("rows",allProductList);
			resMap.put("page",		map.get("page"));
			resMap.put("total",		allProductList.get(0).get("totalPage"));
			resMap.put("records",	allProductList.get(0).get("totalCnt"));
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return JsonUtil.MapToJson(resMap);
	}
	
	@RequestMapping("adProductReg.do")
	public String adProductReg() {
		return "product/adProductReg.admin";
	}
	
	@RequestMapping("adProductData.do")
	public String adProductData(@RequestParam(required=false) String pcode,
								@RequestParam(required=false) String editType,
								@RequestParam(required=false) String pname, 
							    @RequestParam(required=false) int stock,
							    @RequestParam(required=false) int price,
							    @RequestParam(required=false) String title, 
							    @RequestParam(required=false) String content, 
							    @RequestParam(required=false) int groups,
							    @RequestParam(required=false) MultipartFile file1,
							    @RequestParam(required=false) MultipartFile file2,
							    @RequestParam(required=false) MultipartFile file3,
							    @RequestParam(required=false) MultipartFile file4,
							    MultipartHttpServletRequest muti) {
		
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("pname", pname);
		resMap.put("stock", stock);
		resMap.put("price", price);
		resMap.put("title", title);
		resMap.put("groups", groups);
		resMap.put("pcontent", content);
		resMap.put("editType", editType);

		if (editType.equals("update")) {
			resMap.put("pcode", pcode);
		}
		
		MultipartFile[] file = {file1, file2, file3, file4};
		System.out.println(resMap);
		try {
			productService.saveAdProduct(resMap, file, muti);
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		
		return "redirect:adProductMng.do";
	}
	
	@RequestMapping("adProductDtl.do")
	public String adProductDtl(@RequestParam int pcode, Model model) {
		EgovMap product = productService.selectProduct(pcode);
		List<EgovMap> imgList = productService.selectProductImg(pcode);
		
		System.out.println(product);
		System.out.println(imgList);
		
		model.addAttribute("product", product);
		model.addAttribute("imgList", imgList);
		return "product/adProductReg.admin";
	}
	
	@RequestMapping("adProductDel.do")
	public String adProductDel(@RequestParam int pcode, Model model, HttpSession session) {
		int ccode = (int) session.getAttribute("ccode");
		
		if (ccode == 1) {
			return "redirect:adProductMng.do";
		}
		
		
		productService.delectProduct(pcode);
		
		return "redirect:adProductMng.do";
	}
}
