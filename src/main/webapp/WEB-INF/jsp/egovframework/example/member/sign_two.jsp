<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	var check;
	$(function() {
		
		selectBirthDay();
		
		var $userId 	= $("#userid"),
			$idSuccess	= $("#idSuccess"),
			$idFail		= $("#idFail");
		
		//id 증복체크
		$userId.blur(function() {
			
			if ($userId.val() == "") {
				$idSuccess.hide();
				$idFail.hide();
				
			} else {
				$.ajax({
					url 	 : "<c:url value='/loginCheck.do'/>",
					type	 : "POST",
					data 	 : {userid : $userId.val()},
					dataType : "json",
					async	 : false,
					success  : function(data) {
						check = data["check"];
						if (check === 0) {
							$idSuccess.show();
							$idFail.hide();
							
						} else {
							$idSuccess.hide();
							$idFail.show();
						}
						
					}, error : function() {
						alert("실패");
					}
				});
			}
		});
		
	});
	
	function goPopup(){ 
		var pop = window.open("<c:url value='/popup.do'/>","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	} 
	
	function jusoCallBack(roadAddrPart1,addrDetail,zipNo){ 
		$("#roadAddrPart1").val(roadAddrPart1);
		$("#addrDetail").val(addrDetail);
		$("#zipNo").val(zipNo);
	}
	
	function goback1() {
		location.href = "<c:url value='/main.do'/>";
	}
	
	//델리데이션 체크
	function checkForm() {
		console.log(check);
		var $userid   = $("#userid"),
			$pwd 	 = $("#pwd"),
			$pwdCheck = $("#pwdCheck"),
			$name	 = $("#name"),
			$email	 = $("#email"),
			$zipNo	 = $("#zipNo"),
			$roadAddrPart1 = $("#roadAddrPart1"),
			$addrDetail	  = $("#addrDetail"),
			regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
		if ($userid.val().length == 0) {
			alert("아이디를 입력해주세요.");
			$userid.focus();
			return false;
		}
		
		if (check == 1) {
			alert("이미 존재하는 아이디입니다.");
			$userid.focus();
			return false;
		}
		 
		if ($pwd.val().length == 0) {
			alert("비밀번호를 입력해주세요.");
			$pwd.focus();
			return false;
		} 
		
		if ($pwd.val() != $pwdCheck.val()) {
			alert("비밀번호가 다릅니다. 비밀번호를 확인해주세요.");
			$pwd.focus();
			return false;
		}
		
		if ($name.val().length == 0) {
			alert("이름을 입력해주세요.");
			$name.focus();
			return false;
		}
		
		if ($email.val().length == 0) {
			alert("이메일을 입력해주세요.");
			$email.focus();
			return false;
		}
		
		if (!regExp.test($email.val())) {
			alert("이메일 형식이 아닙니다.");
			$email.val("");			
			$eamil.focus();
			return false;
		}
		
		if ($zipNo.val().length == 0) {
			alert("주소를 등록해주세요.");
			$zipNo.focus();
			return false;
		}
		
		if ($roadAddrPart1.val().length == 0) {
			alert("주소를 입력해주세요");
			$roadAddrPart1.focus();
			return false;
		}
		
		if ($addrDetail.val().length == 0) {
			alert("주소를 입력해주세요");
			$addrDetail.focus();
			return false;
		}
		
		if (confirm("회원가입을 하시겠습니까?")) {
			alert("회원가입을 축하합니다.");
			return true;
		}
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
                        <h2 class="text-center">회원가입</h2>
                        <div class="form-wrapper">
                            <form id="memberField" name="memberField" action="sign1.do" method="post" onsubmit="return checkForm();">
                                <div class="form-group"><strong>아이디</strong><br><input type="text" class="form-control" id="userid" name="userid"></div>
                                <div class="alert alert-success" id="idSuccess" style="display:none"><strong>가입이 가능합니다.</strong></div>
                                <div class="alert alert-danger" id="idFail" style="display:none"><strong>이미 존재하는 아이디입니다.</strong></div>
                                <div class="form-group"><strong>비밀번호</strong><br><input type="password" class="form-control" id="pwd" name="pwd"></div>
                                <div class="form-group"><strong>비밀번호 확인</strong><input type="password" class="form-control" id="pwdCheck"></div>
                                <div class="form-group"><strong>이름</strong><input type="text" class="form-control" id="name" name="name"></div>
                                <div class="form-group"><strong>생년월일</strong></div>
                                <div class="row">
	                                <div class="col-sm-4">
		                            	<div class="form-group select-wrapper">
		                            		<select class="form-control" id="year" name="year">
		                            		
		                            		</select>
		                            	</div>
		                            	년
		                            </div>
		                            <div class="col-sm-4">
			                            <div class="form-group select-wrapper">
			                               <select class="form-control" id="month" name="month">
			                                    <option value="1">1</option>
			                                    <option value="2">2</option>
			                                    <option value="3">3</option>
			                                    <option value="4">4</option>
			                                    <option value="5">5</option>
			                                    <option value="6">6</option>
			                                    <option value="7">7</option>
			                                    <option value="8">8</option>
			                                    <option value="9">9</option>
			                                    <option value="10">10</option>
			                                    <option value="11">11</option>
			                                    <option value="12">12</option>
			                                </select>
			                        	</div>
			                        	월
		                            </div>
		                            <div class="col-sm-4">
		                                <div class="form-group select-wrapper">
		                            		<select class="form-control" id="day" name="day">
		                            		
		                            		</select>
		                            	</div>
		                            	일
		                            </div>
	                            </div>
                                <div class="form-group"><strong>성별</strong></div>
                                <div class="col-sm-4">
	                                <div class="form-group select-wrapper">
		                               <select class="form-control" id="sex" name="sex">
		                                    <option value="남자">남자</option>
		                                    <option value="여자">여자</option>
		                                </select>
		                            </div>
	                            </div>
                                <div class="form-group"><strong>본인확인이메일</strong><input type="email" class="form-control" id="email" name="email"></div>
                                <div class="form-group"><strong>우편번호</strong>
                                	<div class="form-flex">
                                    	<div class="form-group"><input type="text" class="form-control" id="zipNo" name="zipNo" readonly></div><button onClick="goPopup();" class="btn btn--form btn--alt" value="팝업" type="button">Apply</button>
                                	</div>
                                </div>
                                 <div class="form-group"><strong>주소</strong><br>
                                 <input type="text" class="form-control" id="roadAddrPart1" name="roadAddrPart1" readonly></div>
                                 <div class="form-group"><input type="text" class="form-control" id="addrDetail" name="addrDetail"></div>	
                                <div class="text-center"><button class="btn">확인</button> <button type="button" class="btn" onclick="goback1()">취소</button></div>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>