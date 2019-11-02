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
		
		if ($zipNo.val().length == 0) {
			alert("주소를 등록해주세요.");
			$zipNo.focus();
			return false;
		}
		
		if ($roadAddrPart1.val().length == 0) {
			alert("이름을 입력해주세요");
			$roadAddrPart1.focus();
			return false;
		}
		
		if ($addrDetail.val().length == 0) {
			alert("이름을 입력해주세요");
			$addrDetail.focus();
			return false;
		}
		
		if (!regExp.test($email.val())) {
			alert("이메일 형식이 아닙니다.");
			$email.val("");	
			$eamil.focus();
			return false;
		}
		
		if (confirm("회원가입을 하시겠습니까?")) {
			alert("회원가입을 축하합니다.");
			return true;
		}
	}
	
	function goback1() {
		location.href = "<c:url value='/adMemberMng.do'/>";
	}
	
	
</script>    

    
<div class="container-fluid">
    <div class="container">
	    <h2 class="tit">회원 등록</h2>
	    <form id="memberField" name="memberField" action="adMemberData.do" method="post" onsubmit="return checkForm();">
			<div class="table-wrap type2 mgt-20">	
				    
				<table border="1" class="tbl-type type1">
			       	<caption>회원 등록</caption>
			       	<colgroup>
			           	<col style="width:13%;"/>
			           	<col style="width:37%;"/>
			           	<col style="width:13%;"/>
			           	<col style="width:37%;"/>
			       	</colgroup>
			       	<tbody>
			       	<c:choose>
			       		<c:when test='${empty param.ucode}'>
			           	<tr>
			               	<th scope="row">아이디</th>
			               	<td scope="row" colspan="3">
			                   	<input type="text" class="form-control" style="width:100%" id="userid" name="userid">
			                   	<div class="alert alert-success" role="alert" id="idSuccess" style="display:none"><strong>가입이 가능합니다.</strong></div>
			                   	<div class="alert alert-danger" role="alert" id="idFail" style="display:none"><strong>이미 존재하는 아이디입니다.</strong></div>
			               	</td>
			           	</tr>
			           	<tr>
			               	<th scope="row">비밀번호</th>
			               	<td scope="row" colspan="3">
				              <input type="password" class="form-control" style="width:100%" id="pwd" name="pwd">
	               			</td>
			           	</tr>
			           	<tr>
							<th scope="row">비밀번호 확인</th>
			               	<td scope="row" colspan="3">
			               		<input type="password" class="form-control" style="width:100%" id="pwdCheck">
			               	</td>
			           	</tr>
			           	<tr>
							<th scope="row">이름</th>
			               	<td scope="row" colspan="3">
			               		<input type="text" class="form-control" style="width:100%" id="name" name="name">
			               	</td>
			           	</tr>
			           	<tr>
							<th scope="row">생년월일</th>
			               	<td scope="row" colspan="3">
			               		<select class="custom-select form-control" style="width:20%;" id="year" name="year">
	                               
	                           </select>
	                          	 년&emsp;
	                           <select class="custom-select form-control" style="width:20%;" id="month" name="month">
	                                <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</oㅋption>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
	                           </select>
	                           	 월&emsp;
	                           <select name="account" class="custom-select form-control" style="width:20%;" id="day" name="day">
	                           
	                           </select>
	                           	일&emsp;
			               	</td>
			           	</tr>
			           	<tr>
							<th scope="row">성별</th>
			               	<td scope="row" colspan="3">
			               		<select class="form-control" id="sex" name="sex">
                                   <option value="남자">남자</option>
                                   <option value="여자">여자</option>
                               </select>
			               	</td>
			           	</tr>
			           		<tr>
							<th scope="row">본인확인이메일</th>
			               	<td scope="row" colspan="3">
			               		<input type="text" class="form-control" style="width:100%" id="email" name="email">
			               	</td>
			           	</tr>
			           		<tr>
							<th scope="row">주소</th>
			               	<td scope="row" colspan="3">
			               		<div class="col-sm-9">
                                    <div class="form-group">
                                        <div class="input-group">
			                                <input type="text" class="form-control" id="zipNo" name="zipNo" readonly>
			                                <input type="button" class="btn btn-primary ripple" value="apply" onClick="goPopup();">
			                            </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" placeholder="Default input" class="form-control" style="width:100%" id="roadAddrPart1" name="roadAddrPart1" readonly>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" placeholder=".input-sm" class="form-control form-control-sm" style="width:100%" id="addrDetail" name="addrDetail">
                                    </div>
                                </div>
			               	</td>
			           	</tr>
			   		</c:when>
			   		<c:otherwise>
			   			<tr>
			               	<th scope="row">아이디</th>
			               	<td scope="row" colspan="3">
			               		${memberInfo.uid}<br>
			               	</td>
			           	</tr>
			           	<tr>
			               	<th scope="row">등급</th>
			               	<td scope="row" colspan="3">
			               		${memberInfo.cname}
			               	</td>
			           	</tr>
			           	<tr>
							<th scope="row">이름</th>
			               	<td scope="row" colspan="3">
			               		${memberInfo.uname}
			               	</td>
			           	</tr>
			           	<tr>
							<th scope="row">생년월일</th>
			               	<td scope="row" colspan="3">
			               		${memberInfo.birthdate}
			               	</td>
			           	</tr>
			           	<tr>
							<th scope="row">성별</th>
			               	<td scope="row" colspan="3">
			               		${memberInfo.sex}
			               	</td>
			           	</tr>
			           		<tr>
							<th scope="row">본인확인이메일</th>
			               	<td scope="row" colspan="3">
			               		${memberInfo.email}
			               	</td>
			           	</tr>
			           		<tr>
							<th scope="row">주소</th>
			               	<td scope="row" colspan="3">
			               		<div class="col-sm-9">
                                    <div class="form-group">
                                        <div class="input-group">
                                        	우편번호 : ${memberInfo.uzipcode}
			                            </div>
                                    </div>
                                    <div class="form-group">
                                    	간단주소 : ${memberInfo.usin}
                                    </div>
                                    <div class="form-group">
										상세주소 : ${memberInfo.upostetcn}
                                    </div>
                                </div>
			               	</td>
			           	</tr>
			   		</c:otherwise>
			   	</c:choose>
		       	</tbody>
		   	</table>
		</div>
		
		<div class="pd-table mgt-20">
			<c:if test="${!empty param.ucode}">
		  	<div class="btn-wrap-mgt-10">
		  		<div class="right txt-right">
			  		<ul>
			      		<li><button type="button" class="btn-box-16" onclick="addRowFn()">정지</button></li>
			    	</ul>
		  		</div>
			</div>
			</c:if>
			<table id="dpBnnrDtl"></table>
		</div>
		
		<div class="btn-wrap mgt-20">
		  	<div class="center">
		    	<ul>
		    		<c:choose>
		    			<c:when test="${empty param.ucode}">
			    			<li><button class="btn-box-06">등록</button></li>
			      			<li><button type="button" class="btn-box-07" onclick="goback1()">취소</button></li>
		    			</c:when>
		    			<c:otherwise>
		      				<li><button type="button" class="btn-box-07" onclick="goback1()">확인</button></li>
		    			</c:otherwise>
		    		</c:choose>
		    	</ul>
		  	</div>
		</div>
		</form>
    </div>
</div>