package egovframework.example.cmmn;

import java.util.List;
import java.util.Map;

public class StringUtil {
	
	/**
	 *  Object type 변수가 비어있는지 체크
	 *  
	 *  @param obj
	 *  @return Boolean : true / false
	 */
	public static Boolean empty(Object obj) {
		
		if (obj instanceof String) return obj == null || "".equals(obj.toString().trim());
		else if (obj instanceof Map) return obj == null || ((Map<?, ?>) obj).isEmpty();
		else if (obj instanceof List) return obj == null || ((List<?>) obj).isEmpty();
		else return obj == null;
	}
	
	/**
	 *  Object type 변수가 비어있지 않은지 체크
	 *  
	 *  @param obj
	 *  @return Boolean : true / false
	 */
	public static Boolean notEmpty(Object obj) {
		return !empty(obj);
	}
	
	/** 
	 * 문자열이 null이면 대체문자출력 
	 */
	public static String nvl(String str, String defaultStr) {
//		String strVal = "";
//		
//		if (str == null || str.isEmpty() || str == "null") {
//			strVal = defaultStr;
//		} else {
//			strVal = str;
//		}
		return (str == null || str.isEmpty() || str == "null") ? defaultStr : str;
	}
}
