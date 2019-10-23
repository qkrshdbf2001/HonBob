package egovframework.example.cmmn;

import java.util.HashMap;
import java.util.Map;

/**
 *  
 *  페이징 관련 util
 * 
 *  
 */
public class PagingUtil {
	
	/**
	 *  페이징 관련 키 셋팅
	 *  
	 *  @param	Map<String, Object> paramMap
	 *  @return	Map<String, Object> tempMap
	 */
	public static Map<String, Object> getPageCmmn(Map<String, Object> paramMap) {
		Map<String, Object> tempMap = new HashMap<String, Object>();
		
		tempMap = JsonUtil.JsonToMap((String) paramMap.get("param"));
		
		tempMap.put("rows", 	StringUtil.nvl(paramMap.get("rows").toString(),"10"));
		tempMap.put("page",  	StringUtil.nvl(paramMap.get("page").toString(), "1"));
		tempMap.put("orderCol", StringUtil.nvl(paramMap.get("sidx").toString(), ""));
		tempMap.put("sortType", StringUtil.nvl(paramMap.get("sord").toString(), ""));
		
		return tempMap;
	}
}
