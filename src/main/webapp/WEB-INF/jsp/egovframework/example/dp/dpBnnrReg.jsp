<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>

<!-- 
	* =========================================
	* 파일명  	: dpBnnrMng.jsp
	* 설명	: 마케팅 관리 > 메인전시관리
	* =========================================
-->

<script>

	/*---------------------------------------------------------
	 * 화면 이벤트
	 *-----------------------------------------------------------*/ 
	var eventC = {
			
		// 이동
		pageMove : function() {
			var $frmTg = $("#bnnrRegFrm");
			
			$frmTg.attr("action", "<c:url value='/dpBnnrMngInit.do'/>");
			
			$frmTg.submit();
		}
	}

	$(function() {
	   
	   $(".cal-wrap").each(function(index) {
	      
	      var $inputVar = $(this).children("input");
	
	      "<c:if test='${bnMngInfo eq null}'>"
	         $inputVar.datepicker("setDate", "today");
	      "</c:if>"
	
	      $inputVar.attr("maxlength", "8");
	            
	      $inputVar.on("keyup", function() {
	         Picker.setInputOnlyNumber(this);
	      });
	      
	      $("[data-date]").on("change", function() {
	
	         var getV       = $(this).data("date") === "start" ? "end"    : "start",         
	            setV       = $(this).data("date") === "start" ? "start"    : "end",
	            setDate    = getV === "start" ? "setStartDate" : "setEndDate",
	            dateVal    = this.value,
	            $target = getV === "start" ? $(this).parent().prev().children("input") : $(this).parent().next().children("input");
	            
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
	   
	   $("#dpBnnrDtl").jqGrid({
	      
			url         : "<c:url value='/bnnrDtlList.do'/>",
			colModel : [
				{label : "배너관리번호",	name : "bnnrMngNo",		witdh : 150,	align : "left",	hidden : true},	
				{label : "배너상세번호",	name : "dtlSeq",		witdh : 150,	align : "left",	hidden : true}, 
				{label : "배너내용",		name : "bnnrText",		width : 150,	align : "left"},
				{label : "배너이미지",		name : "imgAttcFile",	width : 200,	align : "left"},
				{label : "URL",			name : "cnntUrl",		width : 130,	align : "center"},
				{label : "노출순서",		name : "sortSeq",		width : 50,		align : "center"},
				{label : "구분",			name : "btn",			width : 50,		align : "center", formatter : gubnnBtn}
		  	],
			autowidth   : true,
			cellEdit   	: true,
			cellsubmit  : "clientArray",    
			datatype   	: "local",
			multiselect : true,
			
			onCellSelect   : function(rowid, colIndex) {         
			   var $dpBnnrDtl   = $("#dpBnnrDtl"),
			      colModelArr   = $dpBnnrDtl.getGridParam("colModel");        
			   
			   for (var i = 0; i < colModelArr.length; i++) {
			                     
			      $dpBnnrDtl.setColProp(colModelArr[i].name, colModelArr[i].name === "btn" ? {editable : false} : {editable : true});
			   }
	         
	         if (rowid !== "") {
	            $dpBnnrDtl.editCell(rowid, colIndex, true);
	         }         
	      }
	   });
	   
	   "<c:if test='${bnMngInfo ne null}'>"
	      $("#dpBnnrDtl").setGridParam({
	         
	         datatype      : "json",
	         postData      : {"bnnrMngNo" : "<c:out value='${param.bnnrMngNo}'/>"},
	         loadComplete   : function(data) {
	            console.log("data : ", data);
	         }
	      }).trigger("reloadGrid");
	   "</c:if>"
	});
	
	function addRowFn() {
	   var $dpBnnrDtl   = $("#dpBnnrDtl"),
	      addData    = {},
	      idsArr      = $dpBnnrDtl.jqGrid("getDataIDs"),                      
	      totalRecord = idsArr.length === 0 ? 0 : Math.max.apply(null, idsArr),   
	      colModelArr   = $dpBnnrDtl.getGridParam("colModel"),                 
	      i         = 0,                                            
	      length      = colModelArr.length;
	
	   for (; i < length; i++) {
	               
	      addData[colModelArr[i].name] = "";
	   }   
	
	   $dpBnnrDtl.addRowData(totalRecord + 1, addData);                    
	}
	
	function gubnnBtn(cv, op, ro) {
	   return typeof ro.bnnrMngNo === "number" ? "" : "<a href='#' onclick='delRowFn(" + op.rowId + ")'>행삭제</a>";
	}
	
	function delRowFn(rowId) {
	
	   $("#dpBnnrDtl").delRowData(rowId);
	}
	
	function validChkFn() {
	   
	   if ($("[name='subj']").val() === "") {
	      alert("제목을 입력해주세요");
	      
	      return false;
	   } 
	   
	   if ($("[name=dpStrtDt]").val() === "" || $("[name=dpEndDt]").val() === "") {
	      alert("전시기간이 비었습니다.");
	      
	      return false;
	   }
	   
	   if ($("[name=dpYn]:checked").length === 0) {
	      alert("공개여부를 체크해주세요");
	      
	      return false;
	   }
	   
	   return true;
	}
	
	function gridValidChkFn() {
	   var $dpBnnrDtl      = $("#dpBnnrDtl"),
	      dataList      = $dpBnnrDtl.getRowData(),
	      colModelArr      = $dpBnnrDtl.getGridParam("colModel"),
	      idsArr         = $dpBnnrDtl.jqGrid("getDataIDs"),
	      length         = colModelArr.length - 1,
	      emptyChk      = 0,
	      numChk         = 0,
	      editedChk      = 0;
	   
	   dataList.forEach(function(e) {
	      
	      for (var j = 3; j < length; j++) {
	        var cellData = e[colModelArr[j]["name"]];
	        emptyChk = cellData === "" ? ++emptyChk : emptyChk;
				         
	         if (colModelArr[j]["name"] === "sortSeq" && !Valid.isNumeric(cellData)) {
	        	 emptyChk++;
	         }
	      }   
	   });
	   
	   if (emptyChk > 0) {
	      alert("빈값이 존재합니다.");
	      
	      return false;
	   }
	      
	   if (numChk > 0) {
	      alert("노출순서는 숫자만 입력이 가능합니다.");
	      
	      return false;
	   }
	   
	   idsArr.forEach(function(e) {
	      if ($("#" + e).hasClass("edited")) {
	         editedChk++;
	      }
	   });
	   
	   if (editedChk === 0) {
	      alert("변경 된 줄이 없습니다.");
	   }
	   
	   return true;
	}
	
	function saveFn() {
	   $("#dpBnnrDtl").editCell(0, 0, false);
	   
	   if (!validChkFn()) {
	      return;
	   }
	   
	   if (!gridValidChkFn()) {
	      return;
	   }
	   
	   var bnnrMngData = {
	         
	         "subj"      : $("[name='subj']").val(),
	         "dpStrtDt"  : $("[name='dpStrtDt']").val(),
	         "dpEndDt"   : $("[name='dpEndDt']").val(),
	         "dpYn"      : $("[name='dpYn']").val(),
	         "bnnrMngNo" : "<c:out value='${param.bnnrMngNo}'/>" || ""
	   }
	   
	   var gridRowData = getSaveData();
	
	   $.ajax({
	
	       url : "<c:url value='/saveBnnrData.do'/>",    
	
	       data : {
	          "bnnrMngData" : JSON.stringify(bnnrMngData),
	          "gridRowData" : JSON.stringify(gridRowData)
	       },
	
	       type : "POST",   
	
	       success : function(d) {
	    	   
	          if(d.result === "success") {
	             alert("저장에 성공하였습니다");
	             
	             location.href = "<c:url value='/dpBnnrMng.do'/>";
	          }
	       }
	   });
	}
	
	function getSaveData() {
		var $dpBnnrDtl 	= $("#dpBnnrDtl"),
			idsArr		= $dpBnnrDtl.jqGrid("getDataIDs");
			jsonArr		= [];
		
		idsArr.forEach(function(e) {
			
			if ($("#" + e).hasClass("edited")) {
				var jsonObj = $dpBnnrDtl.getRowData(e);
				alert(jsonObj.bnnrMngNo === "");
				jsonObj.editType = jsonObj.bnnrMngNo === "" ?
						"insert" : "update";
				
				console.log(jsonObj.editType);
				
				jsonArr[jsonArr.length] = jsonObj;
			}
		});
		
		return jsonArr;
	}
	
	function removeRowFn() {
		var $dpBnnrDtl		= $("#dpBnnrDtl"),
			checkDataArr	= $dpBnnrDtl.getGridParam("selarrrow"),
			jsonArray		= [],
			emptyChk		= 0;
		
		if (checkDataArr.length === 0) {
			alert("삭제 할 데이터를 선택하여 주십시오.");
			
			return;
		}
		
		checkDataArr.forEach(function(e, i) {
			var jsonObj		= {},
				bnnrMngNo	= $dpBnnrDtl.getCell(e, "bnnrMngNo");
			
			jsonObj.bnnrMngNo	= bnnrMngNo;
			jsonObj.dtlSeq		= $dpBnnrDtl.getCell(e, "dtlSeq");
			jsonObj.editType	= "delete";
			
			jsonArray[i] = jsonObj;
			
			if (bnnrMngNo === "") {
				emptyChk++;
			}
		});
		
		if (emptyChk) {
			 alert("신규로우는 삭제가 불가능합니다.")
			
			 return;
		}
		
		$.ajax({
			
			url 	: "<c:url value='/saveBnnrData.do' />",
			type	: "POST",
			data	: {
				"gridRowData" : JSON.stringify(jsonArray)	
			},
			
			success : function(d) {
				
				if (d.result == "success") {
					alert("삭제에 성공하였습니다.");
					
					$dpBnnrDtl.trigger("reloadGrid");
				}
			}
		});
	}
</script>


<div class="container-fluid">
    <div class="container">
		<div style="position:relative;margin-top:20px;">
		    <div class="page-nav-wrap" style="top: 10px;right: 0;">
		        <span class="ico-home-01"></span>
		        <span class="ico-arr-right-02"></span>
		        <a href="#">메뉴 1</a>
		        <span class="ico-arr-right-02"></span>
		        <a href="#">메뉴 2</a>
		        <span class="ico-arr-right-02"></span>
		        <a href="#">메뉴 3</a>
		    </div>
		</div>
		
		<h2 class="tit">배너 등록</h2>
		<form id="bnnrRegFrm" method="post">
			<input type="hidden" name="srchBnnrMngNo"	value="<c:out value='${openParam.srchBnnrMngNo}'/>" />
			<input type="hidden" name="srchTp"			value="<c:out value='${openParam.srchTp}'/>" />
			<input type="hidden" name="srchSubj"		value="<c:out value='${openParam.subj}'/>" />
			<input type="hidden" name="srchDpStrtDt"	value="<c:out value='${openParam.dpStrtDt}'/>" />
			<input type="hidden" name="srchDpEndDt"		value="<c:out value='${openParam.dpEndDt}'/>" />
			<input type="hidden" name="srchDpYn"		value="<c:out value='${openParam.srchDpYn}'/>" />
			<input type="hidden" name="srchPage" 		value="<c:out value='${openParam.srchPage}'/>" />
		</form>
		
		<div class="table-wrap type2 mgt-20">
			<legend>배너 등록</legend>
			<table cellspacing="0" border="1" class="tbl-type type1">
		       	<caption>배너 등록</caption>
		       	<colgroup>
		           	<col style="width:13%;"/>
		           	<col style="width:37%;"/>
		           	<col style="width:13%;"/>
		           	<col style="width:37%;"/>
		       	</colgroup>
		       	<tbody>
		           	<tr>
		               	<th scope="row">제목</th>
		               	<td scope="row" colspan="3">
		                   	<input type="text" name="subj" class="ui-ipt" style="width:100%" maxlength="50" value="<c:out value='${bnMngInfo.subj }'/>">
		               	</td>
		           	</tr>
		           	<tr>
		               	<th scope="row">전시 기간</th>
		               	<td scope="row" colspan="3">
			               	<div class="cal-wrap">
			               		<!-- 
								<input type="text" name="dpStrtDt" class="ui-ipt" data-date="start" readonly>
		                   		 -->
		                   		<input type="text" name="dpStrtDt" class="ui-ipt" data-date="start" value="<c:out value='${bnMngInfo.dpStrtDt }'/>">
		                   		<button type="button" class="btn-cal"><span class="ico-cal-01"></span></button>
			                </div>
			                <div class="cal-wrap">
			                	<!-- 
								<input type="text" name="dpEndDt" class="ui-ipt" data-date="end" readonly>
								 -->
								<input type="text" name="dpEndDt" class="ui-ipt" data-date="end" value="<c:out value='${bnMngInfo.dpEndDt }'/>">
								<button type="button" class="btn-cal"><span class="ico-cal-01"></span></button>
							</div>
						</td>
		           	</tr>
		           	<tr>
						<th scope="row">공개 여부</th>
		               	<td scope="row" colspan="3">
		               		<ul class="ui-radio">
		                    	<li>
		                        	<input type="radio" id="rdo1" name="dpYn" value="Y" <c:if test="${bnMngInfo.dpYn eq 'Y' }"> checked="checked" </c:if>>
		                        	<label for="rdo1"><span>Y</span></label>
		                      	</li>
		                      	<li>
		                           	<input type="radio" id="rdo2" name="dpYn" value="N" <c:if test="${bnMngInfo.dpYn eq 'N' }"> checked="checked" </c:if>>
		                           	<label for="rdo2"><span>N</span></label>
		                      	</li>
		                   	</ul>
		               	</td>
		           	</tr>
		       	</tbody>
		   	</table>
		</div>
		
		<div class="pd-table mgt-20">
		  	<div class="btn-wrap-mgt-10">
		  		<div class="right txt-right">
			  		<ul style="display: -webkit-inline-box;">
			  			<li><button type="button" class="btn-box-17" onclick="removeRowFn()">삭제</button></li>
			      		<li style="margin-left: 10;"><button type="button" class="btn-box-16" onclick="addRowFn()">추가</button></li>
			    	</ul>
		  		</div>
			</div>
			<table id="dpBnnrDtl"></table>
		</div>
		
		<div class="pd-table mgt-20">
			<table id="dpBnnrDtl"></table>
		</div>
		
		<div class="btn-wrap mgt-20">
		  	<div class="center">
		    	<ul>
		      		<li><button type="button" class="btn-box-06" onclick="saveFn()">등록</button></li>
		      		<li><button type="button" class="btn-box-07" onclick="eventC.pageMove()">취소</button></li>
		    	</ul>
		  	</div>
		</div>
	</div>
</div>