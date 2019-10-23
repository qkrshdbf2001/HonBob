<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<script>
	<c:if test="${not empty msg}">
		alert("${msg}");
	</c:if>
	
	function checkForm() {
		var $userid   = $("#userid"),
			$pwd 	 = $("#pwd");
		
		if ($userid.val().length == 0) {
			alert("아이디를 입력해주세요.");
			$userid.focus();
			return false;
		}
		
		if ($pwd.val().length == 0) {
			alert("비밀번호를 입력해주세요.");
			$pwd.focus();
			return false;
		} 
		
		return true;
	}
	
</script>

<div class="page-content">
        <div class="holder mt-0">
            <div class="container">
                <ul class="breadcrumbs">
                    <li><a href="main.do">HOME</a></li>
                    <li><span>로그인</span></li>
                </ul>
            </div>
        </div>
        <div class="holder mt-0">
            <div class="container">
                <div class="row justify-content-around">
                    <div class="col-sm-6 col-md-4">
                        <div id="loginForm">
                            <h2 class="text-center">로그인</h2>
                            <div class="form-wrapper">
                                <p>이미 계정을 가지고 있다면, 로그인 해주세요</p>
                                <form action="login.do" method="POST" onsubmit="return checkForm();">
                                    <div class="form-group"><input type="text" class="form-control" placeholder="Your Name" id="userid" name="userid"></div>
                                    <div class="form-group"><input type="password" class="form-control" placeholder="Password" id="pwd" name="pwd"></div>
                                    <p class="text-uppercase"><a href="#" class="js-toggle-forms">비밀번호 찾기</a></p>
                                    <div class="clearfix"><input id="checkbox1" name="checkbox1" type="checkbox" checked="checked"> <label for="checkbox1">로그인 유지하기</label></div><button type="submit" class="btn">확인</button>
                                </form>
                            </div>
                        </div>
                        <div id="recoverPasswordForm" class="d-none">
                            <h2 class="text-center">패스워드 찾기</h2>
                            <div class="form-wrapper">
                                <p>아이디와 이름을 입력하면 가입했던 계정의 이메일로 인증번호가 전송됩니다.</p>
                                <form action="#">
                                    <div class="form-group"><input type="text" class="form-control" placeholder="아이디"></div>
                                    <div class="form-group"><input type="password" class="form-control" placeholder="이름"></div>
                                    <div class="btn-toolbar"><a href="#" class="btn btn--alt js-toggle-forms">취소</a> <button class="btn ml-1">확인</button></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-divider"></div>
                    <div class="col-sm-6 col-md-4 mt-3 mt-sm-0">
                        <h2 class="text-center">새로 가입</h2>
                        <div class="form-wrapper">
                            <p>계정이 없으시다면 회원가입을 해주세요</p><a href="sign.do" class="btn">회원가입 하러가기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>