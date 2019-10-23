<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>
<script>
	$(function() {
		$("#jqGrid").jqGrid({
			
			url 	 : "<c:url value='/dpBnnrList.do'/>",
			dataType : "local",
			colModel : [
				{label : "번호",			name : "bnnrMngNo",	width : 60, 	align : "center"},
				{label : "제목",			name : "subj",			width : 130, 	align : "left"},
				{label : "배너유형",		name : "bnnrTp",		width : 130,	align : "center"},
				{label : "전시기간",		name : "dpGigan", 		width : 150,	align : "center"},
				{label : "진행상태",		name : "status", 		width : 90, 	align : "center"},
				{label : "전시여부", 		name : "dpYn",			width : 90,		align : "center"},
				{label : "배경이미지여부",	name : "bgYn",			width : 95,	align : "center"},
				{label : "등록자",		name : "regr",			witdh : 90, 	align : "center"},
				{label : "등록일",		name : "regDt",		width : 90,		align : "center"}
			],
			height 			: "480",
			autowidth		: true,
			rownumbers		: true,
			caption			: "배너관리",
			pager			: "#jqGridPager",
			rowNum			: 10,
			rowList			: [10, 20, 30],
			viewrecords		: true,
			
			onCellSelect	: function(rowid, icol, cellVal, e) {
				var bnnrMngNo = $("#jqGrid").getCell(rowid, "bnnrMngNo");
				
				location.href = "<c:url value='/bnnrDtl.do?bnnrMngNo=' />" + bnnrMngNo;
			}
		});
	});
	
	function goSearch() {
		$("#jqGrid").setGridParam({
			
			datatype		: "json",
			
			loadComplete	: function(data) {
				console.log("data : ", data);
			}
		}).trigger("reloadGrid");
	}
	
	function pageMoveFn() {
		location.href = "<c:url value='dpBnnrReg.do'/>";
	}
	
</script>

<div class="container-fluid">
    <div class="container">
		<h2 class="tit">배너 관리</h2>
		<div class="btn-wrap mgt-20">
			<div class="right txt-right">
				<ul>
					<li><button type="button" class="btn-box-04" onclick="goSearch()">검색</button></li>
				</ul>
			</div>
		</div>
		<table id="jqGrid"></table>
		<div id="jqGridPager"></div>
		<div class="btn-wrap mgt-20">
			<div class="right txt-right">
				<ul>
					<li><button type="button" class="btn-box-06" onclick="pageMoveFn()">등록</button></li>
				</ul>
			</div>
		</div>
     </div>
</div>
