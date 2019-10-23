var Valid = (function() {
	
	/**
	 * 숫자 체크
	 */
	var _isNumeric = function(val) {
		return val.replace(/[^0-9]/gi, "");
	}
	
	return {
		isNumeric : _isNumeric
	}
}());