<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<script>
	function delproduct(data) {
		location.href = "<c:url value='/adProductDel.do?pcode='/>" + data;
	}

	$(function() {
		$("#stock").numeric();
		$("#price").numeric();
	});
	
	function saveFn() {
		
		if ($("#pname").val() == "") {
			alert("상품명을 입력해주세요");
			return;
		}
		
		if ($("#stock").val() == "") {
			alert("개수을 입력해주세요");
			return;
		}
		
		if ($("#price").val() == "") {
			alert("가격을 입력해주세요");
			return;
		}
		
		if ($("#title").val() == "") {
			alert("제목을 입력해주세요");
			return;
		}
		
		if ($("#content").val() == "") {
			alert("내용을 입력해주세요");
			return;
		}
		
		$("#productData").submit();
	}
</script>
  
<div class="container-fluid">
    <div class="container">
    	<h2 class="tit">상품 등록</h2>
		<div class="table-wrap type2 mgt-20">
			<form action="adProductData.do" id="productData" method="post" enctype="multipart/form-data">
				<table cellspacing="0" border="1" class="tbl-type type1">
			       	<caption>상품 등록</caption>
			       	<colgroup>
			           	<col style="width:13%;"/>
			           	<col style="width:37%;"/>
			           	<col style="width:13%;"/>
			           	<col style="width:37%;"/>
			       	</colgroup>
			       	<tbody>
			       		<tr>
			               	<th scope="row">상품명</th>
			               	<td scope="row" colspan="3">
			                   	<input type="text" id="pname" name="pname" class="ui-ipt form-control" style="width:100%" maxlength="50" >
			               	</td>
			           	</tr>
			           	<tr>
			               	<th scope="row">개수</th>
			               	<td scope="row" colspan="3">
			                   	<input type="text" id="stock" name="stock" class="ui-ipt form-control" style="width:100%" maxlength="50" >
			               	</td>
			           	</tr>
			           	<tr>
			               	<th scope="row">가격</th>
			               	<td scope="row" colspan="3">
			                   	<input type="text" id="price" name="price" class="ui-ipt form-control" style="width:100%" maxlength="50" >
			               	</td>
			           	</tr>
			           	<tr>
			               	<th scope="row">제목</th>
			               	<td scope="row" colspan="3">
			                   	<input type="text" id="title" name="title" class="ui-ipt form-control" style="width:100%" maxlength="50" >
			               	</td>
			           	</tr>
			           	<tr>
			               	<th scope="row">내용</th>
			               	<td scope="row" colspan="3">
				               <textarea style="width:100%" id="content" name="content" class="form-control"></textarea>
	               			</td>
			           	</tr>
			           		<tr>
							<th scope="row">종류</th>
			               	<td scope="row" colspan="3">
			               		 <select class="custom-select form-control" style="width:20%;" id="groups" name="groups">
	                                <option value="1">한식</option>
                                    <option value="2">분식</option>
                                    <option value="3">돈까스</option>
                                    <option value="4">회</option>
                                    <option value="5">일식</option>
                                    <option value="6">치킨</option>
                                    <option value="7">피자</option>
                                    <option value="8">중국집</option>
                                    <option value="9">족발</option>
                                    <option value="10">보쌈</option>
                                    <option value="11">야식</option>
                                    <option value="12">찜</option>
                                    <option value="13">탕</option>
                                    <option value="14">도시락</option>
                                    <option value="15">카페</option>
                                    <option value="16">디저트</option>
                                    <option value="17">패스트푸드</option>
	                           </select>
			               	</td>
			           	</tr>
			           	<tr>
							<th scope="row" rowspan="2">메인 이미지</th>
			               	<td scope="row" colspan="3">
			               		<input type="file" id="file1" name="file1" accept=".gif, .jpg, .png">
			               	</td>
			           	</tr>
			           	<tr>
			               	<td scope="row" colspan="3">
			               		<input type="file" id="file2" name="file2" accept=".gif, .jpg, .png">
			               	</td>
			           	</tr>
			           	<tr>
							<th scope="row" rowspan="2">상세 이미지</th>
			               	<td scope="row" colspan="3">
			               		<input type="file" id="file3" name="file3" accept=".gif, .jpg, .png">
			               	</td>
			           	</tr>
			           	<tr>
			               	<td scope="row" colspan="3">
			               		<input type="file" id="file4" name="file4"  accept=".gif, .jpg, .png">
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
			      		<li><button type="button" class="btn-box-16" onclick="delproduct(${product.pcode})">삭제</button></li>
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