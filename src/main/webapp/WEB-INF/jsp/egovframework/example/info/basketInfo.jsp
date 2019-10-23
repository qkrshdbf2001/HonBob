<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
							<a href="addressInfo.do" class="list-group-item">주소</a> 
							<a href="basketInfo.do" class="list-group-item active">장바구니</a>
							<a href="orderInfo.do" class="list-group-item">주문목록</a>
                       	</div>
                    </div>
                    <div class="col-md-9 aside">
                        <h2>다중결제가 구현되지않았습니다.</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>