<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
							<a href="memberInfo.do" class="list-group-item active">나의 정보</a> 
							<a href="addressInfo.do" class="list-group-item">주소</a> 
							<a href="basketInfo.do" class="list-group-item">장바구니</a>
							<a href="orderInfo.do" class="list-group-item">주문목록</a>
                       	</div>
                    </div>
                    <div class="col-md-9 aside">
                        <h2>회원정보</h2>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="card">
                                    <div class="card-body">
                                        <h3>${memberInfo.uname}님의 정보</h3>
                                        <p>
                                        	<b>유저 코드 : </b> ${memberInfo.ucode}<br>
	                                        <b>등급 : </b> ${memberInfo.cname}<br>
	                                        <b>이름 : </b> ${memberInfo.uname}<br>
	                                        <b>생년월일 : </b> ${memberInfo.birthdate}<br>
											<b>이메일 : </b> ${memberInfo.email}
                                        </p>
                                        <div class="mt-2 clearfix"><a href="#" class="link-icn js-show-form" data-form="#updateDetails"><i class="icon-pencil"></i>이메일변경</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>