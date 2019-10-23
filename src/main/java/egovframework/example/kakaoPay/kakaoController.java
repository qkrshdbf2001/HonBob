package egovframework.example.kakaoPay;

import java.net.URI;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.product.service.ProductService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class kakaoController {
	
	@Resource(name="productService")
	private ProductService productService;
	
	private static final String HOST = "https://kapi.kakao.com";
	private static EgovMap productInfo = new EgovMap();
	private static Map<String, Object> kakao;
	private static int count1;
	private static int ocode;
    
	@RequestMapping("kakaoPay.do")
	public String kakaoPay(@RequestParam String payName,
						   @RequestParam String phone,
						   @RequestParam String zipNo,
						   @RequestParam String roadAddrPart1,
						   @RequestParam String addrDetail,
						   @RequestParam String pname,
						   @RequestParam int pcode,
						   @RequestParam int count,
						   HttpSession session) {
		
		RestTemplate restTemplate = new RestTemplate();
		productInfo = productService.selectProduct(pcode);
		String kcode = productInfo.get("pcode").toString();
		String kname = productInfo.get("pname").toString();
		int priceInt =  Integer.parseInt(productInfo.get("price").toString());
		count1 = count;
		int total = count1*priceInt;
		String ucode = session.getAttribute("ucode").toString();
		
		try{
			
			
			System.out.println(productInfo);
			System.out.println(ucode);
			
			Map<String, Object> resMap = new HashMap<String, Object>();
			resMap.put("payName", payName);
			resMap.put("phone", phone);
			resMap.put("zipNo", zipNo);
			resMap.put("ucode", ucode);
			resMap.put("roadAddrPart1", roadAddrPart1);
			resMap.put("addrDetail", addrDetail);
			resMap.put("pcode", kcode);
			resMap.put("count", count);
			
			System.out.println(resMap);
			
			//주문등록
			ocode = productService.addOrder(resMap);
		} catch(Exception e) {
			System.out.println(e);
		}
		 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "fe0ed5d9b7d752cd1d78878154ea40e6");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", kcode);
        params.add("partner_user_id", ucode);
        params.add("item_name", kname);
        params.add("quantity", Integer.toString(count));
        params.add("total_amount", Integer.toString(total));
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost:8080/honbop/kakaoPaySuccess.do");
        params.add("cancel_url", "http://localhost:8080/honbop/kakaoPayCancel.do");
        params.add("fail_url", "http://localhost:8080/honbop/kakaoPaySuccessFail.do");
 
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        System.out.println(body);
        try {
        	
            String kakaoString = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, String.class);
            
            kakao = JsonUtil.JsonToMap(kakaoString);
            
            return "redirect: " + kakao.get("next_redirect_pc_url").toString();
        } catch(Exception e) {
        	System.out.println(e);
        }
		
        return "main/main.main";
	}
	
	@RequestMapping("kakaoPaySuccess.do")
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token,
								  HttpSession session,
								  Model model) {
			
		try {
			
			String ucode = session.getAttribute("ucode").toString();
			System.out.println(pg_token);
			String kcode = productInfo.get("pcode").toString();
			String kname = productInfo.get("pname").toString();
			int priceInt =  Integer.parseInt(productInfo.get("price").toString());
			int total = count1*priceInt;
			
			RestTemplate restTemplate = new RestTemplate();
			
			HttpHeaders headers = new HttpHeaders();
			headers.add("Authorization", "KakaoAK " + "fe0ed5d9b7d752cd1d78878154ea40e6");
	        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
	        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	 
	        // 서버로 요청할 Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        params.add("cid", "TC0ONETIME");
	        params.add("tid", (String) kakao.get("tid"));
	        params.add("partner_order_id", kcode);
	        params.add("partner_user_id", ucode);
	        params.add("pg_token", pg_token);
	        params.add("total_amount", Integer.toString(total));
			
	        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
			
            String kakaoString = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, String.class);
            
            System.out.println("kakaoString : " + kakaoString);
            kakao = JsonUtil.JsonToMap(kakaoString);
            
            //주문 완료 체크
            productService.addProductCheck(ocode);	
            
            model.addAttribute("kakao", kakao);
            
            return "kakao/kakaoPaySuccess.board";
        
        } catch (Exception e) {
            System.out.println(e);
        } 
        
		return "main/main.main";
	}
	
	@RequestMapping("kakaoPayCancel.do")
	public String kakaoPayCancel() {
		System.out.println("취소");
		return "kakao/kakaoPayCancel.board";
	}
	
	@RequestMapping("kakaoPaySuccessFail.do")
	public String kakaoPaySuccessFail() {
		System.out.println("성공실패");
		return "kakao/kakaoPaySuccessFail.board";
	}
	
}
