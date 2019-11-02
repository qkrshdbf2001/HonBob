<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$("#jqGrid").jqGrid({
			url 	 : "<c:url value='/adProductList.do'/>",
			datatype : "json",
			colModel : [
				{label : "상품코드",		name : "pcode",		width : 60, 	align : "center", hidden : true},
				{label : "상품명",		name : "pname",		width : 60, 	align : "left"},
				{label : "재고",			name : "stock",		width : 60,		align : "center"},
				{label : "가격",			name : "price", 	width : 150,	align : "center"},
				{label : "리뷰",			name : "countnum", 	width : 60, 	align : "center"},
				{label : "평점",			name : "avgnum", 	width : 60, 	align : "center"}
			],
			height 		: "480",
			autowidth	: true,
			rownumbers	: true,
			caption		: "상품관리",
			pager		: "#jqGridPager",
			rowNum		: 10,
			rowList		: [10, 20, 30],
			viewrecords	: true,
			
			onCellSelect	: function(rowid, icol, cellVal, e) {
				var pcode = $("#jqGrid").getCell(rowid, "pcode");
				
				location.href = "<c:url value='/adProductDtl.do?pcode=' />" + pcode;
			}
		});
	});
	
	function pageMoveFn() {
		location.href = "<c:out value='adProductReg.do' />";
	}
</script>
    
<div class="container-fluid">
    <div class="container">
  		<h2 class="tit">상품 관리</h2>
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