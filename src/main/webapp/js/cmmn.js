/**
 * 공통 JS
 */
var Cmmn = (function() {
	
	/**
	 *  form 의 input text, input radio, textarea, selectbox 의 값을 obj로 만들어준다.
	 *  @parameter obj로 만들 타겟 Id ( form, div, span .. 가능)
	 */
	var _formToObj = function(frmId) {
		var dataObj = {},
			chkObj	= {};
		
		$("#" + frmId).find("input:text, input:hidden, select, textarea, input:radio, input:checkbox").each(function(i, v) {
			
			var val 	= "",
				$v		= $(v),
				name	= $v.attr("name"),
				type	= $v.attr("type");
			
			if (typeof name !== "undefined") {
				
				if (type === "radio") {
					val = $("input[name='" + name + "']:checked").val();
					
				} else if (type === "checkbox") {					
					
					if (typeof chkObj[name] === "undefined") {
						chkObj[name] = [];
					}
					
					if ($v.prop("checked")) {
						chkObj[name].push($v.val());
					}
					
					val = chkObj[name];
				} else {
					val = $v.val();
				}
				
				dataObj[name] = val;
			}
		});
		
		return dataObj;
	}
	
	return {
		formToObj	: _formToObj
	}
}());