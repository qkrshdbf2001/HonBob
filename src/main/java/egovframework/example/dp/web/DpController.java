package egovframework.example.dp.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.dp.service.DpService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class DpController {
	
	@Resource(name = "dpService")
	private DpService dpService;
	
	@RequestMapping(value = "/dpBnnrMng.do")
	public String bnnrMng() {
		return "dp/dpBnnrMng.admin";
	}
	
	@RequestMapping(value = "/dpBnnrList.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String dpBnnrList(@RequestParam Map<String, Object> map) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		System.out.println(map);
		try {
			List<EgovMap> bnList = dpService.selectBnServiceList(map);
			resMap.put("rows",		bnList);
			resMap.put("page",		map.get("page"));
			resMap.put("total",		bnList.get(0).get("totalPage"));
			resMap.put("records",	bnList.get(0).get("totalCnt"));
		} catch (Exception e) {
			//나중에
		}
		
		return JsonUtil.MapToJson(resMap);
	}
	
	@RequestMapping("/dpBnnrReg.do")
	public String dpBnnrReg() {
		return "dp/dpBnnrReg.admin";
	}
	
	@RequestMapping(value = "/saveBnnrData.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String saveBnnrData(@RequestParam Map<String, Object> map) {
		String result = "";
		System.out.println(map);
		try {
			result = dpService.saveBnnrData(map);
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return result;
	}
	
	@RequestMapping("/bnnrDtl.do")
	public String selectBnnrDtl(@RequestParam Map<String, Object> map,
			ModelMap model) {
		EgovMap bnMngInfo = new EgovMap();
		
		try {
			bnMngInfo = dpService.selectBnMngServiceInfo(map);
		} catch (Exception e) {
			
		}
		System.out.println(bnMngInfo);
		model.addAttribute("bnMngInfo", bnMngInfo);
		
		return "dp/dpBnnrReg.admin";
	}
	
	@RequestMapping(value = "/bnnrDtlList.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String selectBnnrDtlList(@RequestParam Map<String, Object> map) {
		List<EgovMap> bnnrDtlList = new ArrayList<>();
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		try {
			bnnrDtlList = dpService.selectBnnrDtlServiceList(map);
		} catch (Exception e) {
			
		}
		
		resMap.put("rows", bnnrDtlList);
		
		return JsonUtil.MapToJson(resMap);
	}
}
