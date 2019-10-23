package egovframework.example.dp.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibatis.sqlmap.engine.mapping.result.ResultMap;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.dp.service.DpService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("dpService")
public class DpServiceImpl implements DpService{
	
	@Resource(name = "dpMapper")
	private DpMapper dpMapper;
	
	@Override
	public List<EgovMap> selectBnServiceList(Map<String, Object> map) {
		return dpMapper.selectBnServiceList(map);
	}
	
	@Override
	public String saveBnnrData(Map<String, Object> map) throws Exception {
		EgovMap resultMap = new EgovMap();
		
		Map<String, Object> bnnrMngData = JsonUtil.JsonToMap((String)map.get("bnnrMngData"));
		
		if (bnnrMngData != null) {	
			if ("insert".equals((String)bnnrMngData.get("editType"))) {
				dpMapper.insertBnnrMng(bnnrMngData);
			}
			else if ("update".equals((String)bnnrMngData.get("editType"))) {
				dpMapper.updateBnnrMng(bnnrMngData);
			}
		}
		
		System.out.println("bnnrMngData 저장 : " + bnnrMngData);
		
		List<Map<String, Object>> gridRowDataList = JsonUtil.JsonToList((String)map.get("gridRowData"));
		for (Map<String, Object> gridRowData : gridRowDataList) {
			
			if ("insert".equals((String)gridRowData.get("editType"))) {
				gridRowData.put("bnnrMngNo", bnnrMngData.get("bnnrMngNo"));
				dpMapper.insertBnnrDtl(gridRowData);
			}
			else if ("update".equals((String)gridRowData.get("editType"))) {
				dpMapper.updateBnnrDtl(gridRowData);
			} 
			else if ("delete".equals((String)gridRowData.get("editType"))) {
				dpMapper.deleteBnnrDtl(gridRowData);
			}
			
			System.out.println("gridRowData 저장 : " + gridRowData);
		}
		
		resultMap.put("result", "success");
		
		return JsonUtil.EgovMapToJson(resultMap);
	}


	@Override
	public EgovMap selectBnMngServiceInfo(Map<String, Object> map) {
		return dpMapper.selectBnMngServiceInfo(map);
	}


	@Override
	public List<EgovMap> selectBnnrDtlServiceList(Map<String, Object> map) {
		return dpMapper.selectBnnrDtlServiceList(map);
	}

}
