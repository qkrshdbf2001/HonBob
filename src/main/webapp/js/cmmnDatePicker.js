/**
 * 데이트피커 커스텀 JS 
 */
var CmmnDatePicker = (function() {
	
	/**
	 * 데이트 피커 설정
	 */
	var _setDatePicker = function(nowDateYn) {
//	 	$("[data-date]").numeric({
//		 maxPreDecimalPlaces : 8
//	});

		// index: 0, 1
		$(".cal-wrap").each(function(index) {
			
			var $inputVar = $(this).children("input");
			
			// 오늘날짜 셋팅
			if (nowDateYn !== "N") {
				$inputVar.datepicker("setDate", "today");
			}
			
			//최대 8자리
			$inputVar.attr("maxlength", "8");
					
			//숫자만 입력
			$inputVar.on("keyup", function() {
				Picker.setInputOnlyNumber(this);
			});
			
			$("[data-date]").on("change", function() {

				var getV 		= $(this).data("date") === "start" ? "end" 	: "start",			
					setV 		= $(this).data("date") === "start" ? "start" 	: "end",
					setDate 	= getV === "start" ? "setStartDate" : "setEndDate",
					dateVal 	= this.value,
					$target = getV === "start" ? $(this).parent().prev().children("input") : $(this).parent().next().children("input");
					
				// datepicker 날짜형식 체크				
				if (!Picker.validationDate(Valid.isNumeric(this.value), index)) {
					this.value = "";
					
					this.focus();
					
					return;
				}
					
				$("[data-date=" + getV + "]").on("change", function() {
					
					$("[data-date=" + setV + "]").datepicker(setDate, this.value);
				});
						
				if (getV === "start") {
					
					if(new Date(Picker.setDateFormat($target.val())) > new Date(Picker.setDateFormat(dateVal))) {
						
						$target.val(dateVal);
					}		
				} else {
					
					if(new Date(Picker.setDateFormat($target.val())) < new Date(Picker.setDateFormat(dateVal))) {
						
						$target.val(dateVal);
					}
				}
			});
		});
		
		$("[data-date]").on("blur", function() {
			
			this.value = Picker.setDateFormat(this.value);
		});
		
// 	$("[data-date='start']").on("change", function () {
		
// 		$("[data-date='end']").datepicker("setStartDate", this.value);
// 	});
	
// 	$("[data-date='end']").on("change", function() {
		
// 		$("[data-date='start']").datepicker("setEndDate", this.value);
// 	});

	}
	
	return {
		setDatePicker : _setDatePicker
	}
}());