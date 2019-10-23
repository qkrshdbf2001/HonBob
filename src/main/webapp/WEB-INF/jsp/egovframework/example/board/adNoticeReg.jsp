<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>
<script>
	function delnotice(data) {
		location.href = "<c:url value='/adNoticeDel.do?ncode='/>" + data;
	}

	function saveFn() {
		
		if ($("#subj").val() == "") {
			alert("제목을 입력해주세요");
			false;
		}
		
		$("#noticeData").submit();
	}
	
</script>

<div class="container-fluid">
    <div class="container">
		<h2 class="tit">공지사항 등록</h2>
		<div class="table-wrap type2 mgt-20">
			<form action="adNoticeData.do" id=noticeData method="post" enctype="multipart/form-data">
				<table cellspacing="0" border="1" class="tbl-type type1">
			       	<caption>공지사항 등록</caption>
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
			                   	<input type="text" id="subj" name="subj" class="ui-ipt form-control" style="width:100%" maxlength="50" value="<c:out value='${notice. ntitle}'/>">
			               	</td>
			           	</tr>
			           	<tr>
			               	<th scope="row">내용</th>
			               	<td scope="row" colspan="3">
				               <textarea style="width:100%" id="textarea" name="textarea" class="form-control"><c:out value="${notice. ncontent}"/></textarea>
	               			</td>
			           	</tr>
			           	<tr>
							<th scope="row">이미지</th>
			               	<td scope="row" colspan="3">
			               		<input type="file" id="file1" name="file1" accept=".gif, .jpg, .png"><br>
			               		본문 : <c:out value='${imgList[0]. nimage}'/>
			               	</td>
			           	</tr>
			           	<tr>
							<th scope="row">이미지</th>
			               	<td scope="row" colspan="3">
			               		<input type="file" id="file2" name="file2" accept=".gif, .jpg, .png"><br>
			               		본문 : <c:out value='${imgList[1]. nimage}'/>
			               	</td>
			           	</tr>
			           	<tr>
							<th scope="row">이미지</th>
			               	<td scope="row" colspan="3">
			               		<input type="file" id="file3" name="file3" accept=".gif, .jpg, .png"><br>
			               		본문 : <c:out value='${imgList[2]. nimage}'/>
			               	</td>
			           	</tr>
			           	<tr>
							<th scope="row">이미지</th>
			               	<td scope="row" colspan="3">
			               		<input type="file" id="file4" name="file4"  accept=".gif, .jpg, .png"><br>
			               		본문 : <c:out value='${imgList[3]. nimage}'/>
			               	</td>
			           	</tr>	
			       	</tbody>
			   	</table>
			   	</form>
		</div>
		
		<div class="pd-table mgt-20">
		  	<div class="btn-wrap-mgt-10">
		  		<div class="right txt-right">
			  		<ul>
			      		<li><button type="button" class="btn-box-16" onclick="delnotice(${notice.ncode})">삭제</button></li>
			    	</ul>
		  		</div>
			</div>
			<table id="dpBnnrDtl"></table>
		</div>
		
		<div class="btn-wrap mgt-20">
		  	<div class="center">
		    	<ul>
		      		<li><button type="button" class="btn-box-06" onclick="saveFn()">등록</button></li>
		      		<li><button type="button" class="btn-box-07">취소</button></li>
		    	</ul>
		  	</div>
		</div>
	</div>
</div>