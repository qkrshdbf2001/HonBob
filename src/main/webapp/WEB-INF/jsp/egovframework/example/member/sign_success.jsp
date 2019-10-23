<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	location.href = "<c:url value='/main.do'/>";

	function maingo() {
		location.href = "<c:url value='/main.do'/>";
	}
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
	                    <h2 class="text-center">가입이 완료되었습니다.</h2>
	                </div>
                </div>
                <br>
                <div class="row justify-content-center">
	                <div class="col-sm-8 col-md-2">
	                    <button id="main" class="btn">홈으로 이동하기</button>
	                </div>
                </div>
            </div>
        </div>
    </div>
