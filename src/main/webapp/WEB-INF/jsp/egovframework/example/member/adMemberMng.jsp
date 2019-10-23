<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$("#jqGrid").jqGrid({
			url 	 : "<c:url value='/adMemberList.do'/>",
			datatype : "json",
			colModel : [
				{label : "회원코드",		name : "ucode",		width : 60, 	align : "center", hidden : true},
				{label : "등급코드",		name : "ccode",		width : 60, 	align : "center"},
				{label : "이름",			name : "uname",		width : 60,		align : "center"},
				{label : "아이디",		name : "uid",		width : 100,	align : "center"},
				{label : "생년월일",		name : "birthdate", width : 150,	align : "center"},
				{label : "성별",			name : "sex", 		width : 40, 	align : "center"},
				{label : "이메일", 		name : "email",		width : 150,	align : "center"}
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
				var ucode = $("#jqGrid").getCell(rowid, "ucode");
				alert(ucode);
				
				location.href = "<c:url value='/adMemberDtl.do?ucode=' />" + ucode;
			}
		});
	});
	
	function pageMoveFn() {
		location.href = "<c:out value='adMemberReg.do' />";
	}
	
</script>
    
<div class="container-fluid">
    <div class="container">
  		<h2 class="tit">회원관리</h2>
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