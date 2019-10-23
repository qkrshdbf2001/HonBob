package egovframework.example.dp.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface DpService {

	List<EgovMap> selectBnServiceList(Map<String, Object> map);

	String saveBnnrData(Map<String, Object> map) throws Exception;

	EgovMap selectBnMngServiceInfo(Map<String, Object> map);

	List<EgovMap> selectBnnrDtlServiceList(Map<String, Object> map);

}
