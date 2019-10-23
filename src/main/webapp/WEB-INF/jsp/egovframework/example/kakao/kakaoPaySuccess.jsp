<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$("#product").click(function() {
			location.href = "<c:url value='/productList.do'/>";
		});
	});
</script>
    
<div class="page-content">
        <div class="holder mt-0">
            <div class="container">
                <ul class="breadcrumbs">
                    <li><a href="index.html">Home</a></li>
                    <li><span>회원가입</span></li>
                </ul>
            </div>
        </div>
        <div class="holder mt-0">
            <div class="container">
                <div class="row justify-content-center">
	                <div class="col-sm-8 col-md-6">
	                    <h2 class="text-center">결제가 완료되었습니다.</h2>
	                </div>
                </div>
                <br>
                <div class="row justify-content-center">
	                <div class="col-sm-8 col-md-2">
	                    <button id="product" class="btn">더 보러가기</button>
	                </div>
                </div>
            </div>
        </div>
    </div>
    