<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	function goPopup(){ 
		var pop = window.open("<c:url value='/popup.do'/>","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	} 
	
	function jusoCallBack(roadAddrPart1,addrDetail,zipNo){ 
		$("#roadAddrPart1").val(roadAddrPart1);
		$("#addrDetail").val(addrDetail);
		$("#zipNo").val(zipNo);
	}
</script>

<div class="page-content">
        <div class="holder mt-0">
            <div class="container">
                <ul class="breadcrumbs">
                    <li><a href="index.html">Home</a></li>
                    <li><span>My account</span></li>
                </ul>
            </div>
        </div>
        <div class="holder mt-0">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 aside aside--left">
                        <div class="list-group">
							<a href="memberInfo.do" class="list-group-item">나의 정보</a> 
							<a href="addressInfo.do" class="list-group-item active">주소</a> 
							<a href="basketInfo.do" class="list-group-item">장바구니</a>
							<a href="orderInfo.do" class="list-group-item">주문목록</a>
                       	</div>
                    </div>
                    <div class="col-md-9 aside">
                        <h2>주소 정보</h2>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="card">
                                    <div class="card-body">
                                        <h3><c:out value="${addressInfo.uname}님의 주소" /></h3>
                                        <p>
                                        	<b>주소 코드 : </b> <c:out value="${addressInfo.uacode}" /><br>
                                        	<b>우편번호 : </b> <c:out value="${addressInfo.uzipcode}" /><br>
                                        	<b>지역 정보 : </b> <c:out value="${addressInfo.usin}" /><br>
                                        	<b>상세 정보 :</b> <c:out value="${addressInfo.upostetcn}" />
                                        </p>
                                        <div class="mt-2 clearfix"><a href="#" class="link-icn js-show-form" data-form="#updateDetails"><i class="icon-pencil"></i>Edit</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card mt-3 d-none" id="updateDetails">
                            <div class="card-body">
                                <h3>주소변경</h3>
                                <div class="row mt-2">
                                    <div class="col-sm-6"><label>우편번호</label>
                                        <div class="form-group"><input type="text" class="form-control" id="zipNo" name="zipNo" value="<c:out value='${addressInfo.uzipcode} '/>" readonly></div>
                                        <div class="mt-2"><button onClick="goPopup();" class="btn btn--alt js-close-form">검색</button></div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-sm-6"><label class="text-uppercase">주소</label>
                                        <div class="form-group"><input type="text" class="form-control" id="roadAddrPart1" name="roadAddrPart1" readonly value="<c:out value='${addressInfo.usin} '/>"></div>
                                        <div class="form-group"><input type="text" class="form-control" id="addrDetail" name="addrDetail" value="<c:out value='${addressInfo.upostetcn} '/>"></div>
                                    </div>
                                </div>
                                <div class="mt-2"><button type="submit" class="btn ml-1">수정</button> <button type="reset" class="btn btn--alt js-close-form" data-form="#updateDetails">취소</button></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>