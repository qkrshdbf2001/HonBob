<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$("#jqGrid").jqGrid({
			url 	 : "<c:url value='/adNoticeList.do'/>",
			datatype : "json",
			colModel : [
				{label : "공지코드",		name : "ncode",		width : 60, 	align : "ncode", hidden : true},
				{label : "회원이름",		name : "uid",		width : 60, 	align : "center"},
				{label : "공지제목",		name : "ntitle",	width : 60,		align : "center"},
				{label : "등록날짜",		name : "nregdate",	width : 100,	align : "center"},
				{label : "공지조회수",		name : "views",  	width : 150,	align : "center"}
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
				var ncode = $("#jqGrid").getCell(rowid, "ncode");
				
				location.href = "<c:url value='/adNoticeDtl.do?ncode=' />" + ncode;
			}
		});
	});
	
	function pageMoveFn() {
		location.href = "<c:out value='adNoticeReg.do' />";
	}
</script>
    
<div class="container-fluid">
    <div class="container">
  		<h2 class="tit">공지사항 관리</h2>
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