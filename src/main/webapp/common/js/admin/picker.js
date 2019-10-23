
var Picker = (function() {
	
	var _setDateFormat = function(date) {
		return date.replace(new RegExp("(\\d{4})(\\d{2})(\\d{2})"), "$1-$2-$3")
	}
	
	/**
	 * 숫자만 입력
	 */
	var _setInputOnlyNumber = function(obj) {
		$(obj).val($(obj).val().replace(/[^0-9]/gi, ""));
	}
	
	/**
	 * 날짜 유효성 체크
	 */
	var _validationDate = function(date, index) {
		var date_pattern = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/;
	
		//if (!date_pattern.test(date) && index === 1) {	// index 0은 새로고침 시, 실행되기 때문에 제외
		if (!date_pattern.test(date) && index === 0) {
			alert("날짜형식이 아닙니다.");
			
			return false;
		}
		
		return true;
	}
	
	return {	// [모듈화 방식]
		setDateFormat : _setDateFormat,
		setInputOnlyNumber : _setInputOnlyNumber,
		validationDate : _validationDate
	}
}());	// 즉시실행함수 : 함수를 실행한 결과(리턴이 없으면, undefined)