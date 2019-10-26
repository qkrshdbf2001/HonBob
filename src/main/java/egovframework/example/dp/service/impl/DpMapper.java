package egovframework.example.dp.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("dpMapper")
public interface DpMapper {

	List<EgovMap> selectBnServiceList(Map<String, Object> map);

	void insertBnnrMng(Map<String, Object> bnnrMngData);

	void insertBnnrDtl(Map<String, Object> value);

	EgovMap selectBnMngServiceInfo(Map<String, Object> map);

	List<EgovMap> selectBnnrDtlServiceList(Map<String, Object> map);

	void updateBnnrMng(Map<String, Object> bnnrMngData);

	void updateBnnrDtl(Map<String, Object> value);

	void deleteBnnrDtl(Map<String, Object> value);

	void insertGridRowData(Map<String, Object> value);

	void updateGridRowData(Map<String, Object> value);

}
