
function selectBirthDay() {
	var date = 	new Date(); 
	var year = 	date.getFullYear(); 
	var i	=	0;
	
	var $selectYear = $("#year");
	var $selectday = $("#day");
	var $monthSelect = $("#month");
	var day 	= ( new Date( year, 1, 0) ).getDate();
	
	
	$selectday.html("");
	for(i = 1; i <= day; i++) {
		var adDday = "<option value =" + i + ">" + i +"</option>";
		$selectday.append(adDday);
	}

	for(i=0; i < 120; i++) {
		var oppYear = year - i;
		var addYear = "<option value =" + oppYear + ">" + oppYear +"</option>";
		$selectYear.append(addYear);
	}
	
	//선택된 년월의 일수
	$monthSelect.change(function() {
		var selectYear 	= $selectYear.val();
		var monthSelect = $monthSelect.val();
		var lastDay 	= ( new Date( selectYear, monthSelect, 0) ).getDate();
		$selectday.html("");
		for(i = 1; i <= lastDay; i++) {
			var adDday = "<option value =" + i + ">" + i +"</option>";
			$selectday.append(adDday);
		}
	});
}
	
	
	