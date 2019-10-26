/**
 * jqgrid 관련 공통 JS
 */
var CmmnJqgrid = (function() {
	
	var _defalutOpt = {
		datatype		: "local",
		height			: "auto",
		autowidth		: true,
		rownumbers		: true,
		rowNum			: 10,
		rowList			: [10, 20, 30],
		viewrecords		: true
	};
	
	var _drowGrid = function(obj) {
		var hapOpt = $.extend(_defalutOpt, obj);
		
		return hapOpt;
	}
	
	return { 
		defalutOpt 	: _defalutOpt,
		drowGrid	: _drowGrid
	}
}());


