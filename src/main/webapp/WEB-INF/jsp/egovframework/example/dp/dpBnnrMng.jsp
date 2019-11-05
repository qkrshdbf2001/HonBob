<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>

<!-- 
 * =====================================================//
 * 파 일 명  : dpBnnrMng.jsp
 * 성 명 	 : 마케팅 관리 > 메인전시관리
 * =====================================================//
-->
<script>
	/*-------------------------------
	 * 화면 공통 필드
	 *-------------------------------*/
	var field = {
		gridId : "#jqGrid"		
	}
	
	/*-------------------------------
	 * 화면 init
	 *-------------------------------*/
	var initC = {
			
		// 그리드 초기화
		initGrid : initGridFn
	}
	
	/*-------------------------------
	 * 화면 이벤트
	 *-------------------------------*/
	 var eventC = {
				
		// 검색
		search : goSearch
	}
	
	$(function() {
		
		// 그리드 초기화
		initC.initGrid.call(field);
		
	});
	
	function initGridFn() {
		var that = this;	
	
		$(this.gridId).jqGrid({
			url : "<c:url value='/dpBnnrList.do'/>",
			colModel : [
				{label : "번호",			name : "bnnrMngNo",	witdh : 60,		align : "center", hidden : true},
				{label : "제목",			name : "subj",		witdh : 260,	align : "left"},
				{label : "배너유형",		name : "bnnrTp",	witdh : 130,	align : "center"},
				{label : "전시기간",		name : "dpGigan",	witdh : 260,	align : "center"},
				{label : "진행상태",		name : "status",	witdh : 90,		align : "center"},
				{label : "전시여부",		name : "dpYn",		witdh : 90,		align : "center"},
				{label : "배경이미지여부",	name : "bgYn",		witdh : 120,	align : "center"},
				{label : "등록자",		name : "regr",		witdh : 90,		align : "center"},
				{label : "등록일",		name : "regDt",		witdh : 90,		align : "center"},		
			],
			caption		: "배너관리",
			pager		: "#jqGridPager",
			onCellSelect : function(rowid, icol, cellVal, e) {
				var $frmTg = $("#bnnrFrm");
				
				$("#srchBnnrMngNo").val($(that.gridId).getCell(rowid, "bnnrMngNo"));
				$("#srchPage").val($(that.gridId).getGridParam("page"));
									
				$frmTg.attr("action", "<c:url value='/bnnrDtl.do'/>");
				
				$frmTg.submit();
			}
		});
		
		var gridOpt = {	
			datatype	: "local"
		}
		
		$(this.gridId).jqGrid(CmmnJqgrid.drowGrid(gridOpt));
	}
	
	function goSearch() {
		var that = this;
		
		$(this.gridId).setGridParam({
			
			datatype		: "json",
			mtype			: "POST",
			postData		: {param : JSON.stringify(Cmmn.formToObj("bnnrFrm"))},
			
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
		
		<h2 class="tit">메인 전시 관리</h2>

		<div class="table-wrap type2 mgt-20">
			<legend>배너 관리</legend>
			<form id="bnnrFrm">
				<input type="hidden" id="srchBnnrMngNo" name="srchBnnrMngNo"/>
				<input type="hidden" id="srchPage"		name="srchPage" />
				<table cellspacing="0" border="1" class="tbl-type type1">
					<caption>메인 전시 관리</caption>	
					<colgroup>
						<col style="width:13%;"/>
						<col style="width:37%;"/>
						<col style="width:13%;"/>
						<col style="width:37%;"/>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">키워드검색</th>
							<td scope="row" colspan="3">
								<select id="srchTp" name="srchTp" class="selectric" title="제목 선택박스">
									<option value="A" <c:if test="${openParam.srchTp eq 'A'}">selected</c:if>>전체</option>
									<option value="S" <c:if test="${openParam.srchTp eq 'S'}">selected</c:if>>제목</option>
									<option value="R" <c:if test="${openParam.srchTp eq 'R'}">selected</c:if>>등록자</option>
								</select>
								<input type="text" name="subj" class="ui-ipt" style="width:calc(100% - 244px)" maxlength="50" value="<c:out value='${openParam.srchSubj}'/>" />
							</td>
						</tr>
						<tr>
							<th scope="row">일자검색</th>
							<td scope="row">
								<div class="cal-wrap">
									<input type="text" name="dpStrtDt" class="ui-ipt" data-date="start" value="<c:out value='${openParam.srchDpStrtDt}'/>" />
									<button type="button" class="btn-cal"><span class="ico-cal-01"></span></button>
								</div>
								<div class="cal-wrap">
									<input type="text" name="dpEndDt" class="ui-ipt" data-date="end" value="<c:out value='${openParam.srchDpEndDt}'/>" />
									<button type="button" class="btn-cal"><span class="ico-cal-01"></span></button>
								</div>
							</td>
							<th scope="row">전시여부</th>
							<td scope="row">
								<select id="srchDpYn" name="srchDpYn" class="selectric" title="전시여부 선택박스">
									<option value=""  <c:if test="${openParam.srchDpYn eq ''}">selected</c:if>>전체</option>
									<option value="Y" <c:if test="${openParam.srchDpYn eq 'Y'}">selected</c:if>>예</option>
									<option value="N" <c:if test="${openParam.srchDpYn eq 'N'}">selected</c:if>>아니오</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">노출 위치</th>
							<td colspan="3">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			</div>
			<div class="btn-wrap mgt-20">
				<div class="right txt-right">
					<ul>
						<li><button type="button" class="btn-box-04" onclick="eventC.search.call(field)">검색</button></li>
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
