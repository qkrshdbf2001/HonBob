<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$("#jqGrid").jqGrid({
			url 	 : "<c:url value='/adQuestionList.do'/>",
			datatype : "json",
			colModel : [
				{label : "회원코드",	name : "ucode",		width : 60, 	align : "center", hidden : true},
				{label : "이름",		name : "ccode",		width : 60, 	align : "center"},
				{label : "제목",		name : "uname",		width : 200,		align : "center"},
				{label : "등록날짜",	name : "uid",		width : 90,	align : "center"},
				{label : "답변여부",	name : "birthdate", width : 100,	align : "center"},
			],
			height		: "480",
			autowidth	: true,
			rownumbers	: true,
			caption		: "배너관리",
			pager		: "#jqGridPager",
			rowNum		: 10,
			rowList		: [10, 20, 30],
			viewrecords	: true,
			
			onCellSelect	: function(rowid, icol, cellVal, e) {
				var bnnrMngNo = $("#jqGrid").getCell(rowid, "bnnrMngNo");
				alert(bnnrMngNo);
				
				location.href = "";
			}
		});
	});
	
</script>
    
<div class="container-fluid">
    <div class="container">
  		<h2 class="tit">회원관리</h2>
		<table id="jqGrid"></table>
		<div id="jqGridPager"></div>
  	</div>
</div>