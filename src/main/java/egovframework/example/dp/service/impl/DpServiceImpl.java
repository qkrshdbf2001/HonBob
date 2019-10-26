package egovframework.example.dp.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.cmmn.PagingUtil;
import egovframework.example.dp.service.DpService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("dpService")
public class DpServiceImpl implements DpService {
	
	@Resource(name="dpMapper")
	private DpMapper dpMapper;
	
	@Override
	public List<EgovMap> selectBnServiceList(Map<String, Object> map) throws Exception {
		
		return dpMapper.selectBnServiceList(map);
	}

	@Override
	public String saveBnnrData(Map<String, Object> map) throws Exception {
		EgovMap resultMap = new EgovMap();
		
		Map<String, Object> bnnrMngData = JsonUtil.JsonToMap((String) map.get("bnnrMngData"));
		
		List<Map<String, Object>> gridRowData = JsonUtil.JsonToList((String) map.get("gridRowData"));
		
		if (bnnrMngData != null) {	
			System.out.println((String) bnnrMngData.get("editType"));
			if ("insert".equals((String) bnnrMngData.get("editType"))) {	
				System.out.println("dd");
				dpMapper.insertBnnrMng(bnnrMngData);
				
			} else if ("update".equals((String) bnnrMngData.get("editType"))) {	
				
				dpMapper.updateBnnrMng(bnnrMngData);
			}
		}
		
		for (Map<String, Object> value : gridRowData) {
			
			if ("insert".equals((String) value.get("editType"))) {
				System.out.println(bnnrMngData.get("bnnrMngNo"));
				value.put("bnnrMngNo", bnnrMngData.get("bnnrMngNo"));
				dpMapper.insertGridRowData(value);
				
			} else if ("update".equals((String) value.get("editType"))) {
				
				dpMapper.updateGridRowData(value);
				
			} else if ("delete".equals((String) value.get("editType"))) {
				
				dpMapper.deleteBnnrDtl(value);
			}
		}
					
		resultMap.put("result", "success");

		return JsonUtil.EgovMapToJson(resultMap);
	}

	@Override
	public EgovMap selectBnMngServiceInfo(Map<String, Object> map) throws Exception {
		return dpMapper.selectBnMngServiceInfo(map);
	}

	@Override
	public List<EgovMap> selectBnnrDtlServiceList(Map<String, Object> map) throws Exception {
		return dpMapper.selectBnnrDtlServiceList(map);
	}

}
