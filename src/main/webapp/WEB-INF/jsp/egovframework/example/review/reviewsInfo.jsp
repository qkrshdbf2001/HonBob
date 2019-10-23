<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function() {
		$("#rscore").change(function(){
			var rangeValue = document.getElementById("range_val");
			rangeValue.innerHTML = "<h2>"+this.value+"</h2>";
		}) 
	});

	function checkForm() {
		
		$("#reviewPost").submit();
	}
	
	function goback1() {
		location.href = "<c:url value='/main.do'/>";
	}
</script>

<div class="page-content">
        <div class="holder mt-0">
            <div class="container">
                <ul class="breadcrumbs">
                    <li><a href="index.html">Home</a></li>
                    <li><span>Create account</span></li>
                </ul>
            </div>
        </div>
        <div class="holder mt-0">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-sm-8 col-md-6">
                        <h2 class="text-center">리뷰등록</h2>
                        <div class="form-wrapper">
                            <form id="reviewPost" name="reviewPost" action="reviewData.do" method="post" enctype="multipart/form-data" onsubmit="return checkForm();">
                            	<input type="hidden" id="rcode" name="rcode" value=${param.id}>
                            	<input type="hidden" id="pcode" name="pcode" value="${orderName.pcode}">
                                <div class="form-group"><strong>상품명</strong><br>${orderName.pname}</div>
                                <div class="form-group"><strong>내용</strong><input type="text" class="form-control" id="rcommend" name="rcommend"></div> 
                                <div class="form-group"><strong>평가</strong>
                                <div id="range_val"><h2>3</h2></div>
                                <div class="d-flex justify-content-center my-4">
                                	<input type="range" class="form-control" min="0" max="5" step="1" id="rscore" name="rscore" value="3"></div>
                                </div>
                                <div class="form-group"><strong>이미지</strong><input type="file" class="form-control" id="rimage" name="rimage"></div> 
                                <div class="text-center"><button type="submit" class="btn">확인</button> <button type="button" class="btn" onclick="goback1()">취소</button></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>