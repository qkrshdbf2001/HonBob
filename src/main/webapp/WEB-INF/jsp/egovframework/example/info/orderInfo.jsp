<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$(".delete").click(function() {
			$.ajax({
				type:	"POST",
				url:	"orderdelete.do",
				data: 	{"id":$(this).attr("id")}
			});
		});
		
		$(".review").click(function() {
			if(confirm("리뷰를 작성하시겠습니까?")){
				location.href="reviewInsert.do?id="+$(this).attr("id");
			}
		});
	});
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
							<a href="addressInfo.do" class="list-group-item">주소</a> 
							<a href="basketInfo.do" class="list-group-item">장바구니</a>
							<a href="orderInfo.do" class="list-group-item active">주문목록</a>
                       	</div>
                    </div>
                    <div class="col-md-9 aside">
                    	<div class="minicart-drop-content">
							<h3>장바구니 목록</h3>
							<c:forEach var="orderList" items="${orderList}">
							<div class="minicart-prd">
								<div class="minicart-prd-image">
									<a href="#"><img src="upload/${orderList.pimage}" data-srcset="upload/${orderList.pimage}" class="lazyload" alt=""></a>
								</div>
								<div class="minicart-prd-name">
									<h2>
										<a href="#">${orderList.pname}</a>
									</h2>
								</div>
								<div class="minicart-prd-qty">
									<span>개수:</span> <b>${orderList.ordcount}</b>
								</div>
								<script>
									
								</script>
								<c:if test="${orderList.paycheck==0}">
								<div class="minicart-prd-price">
									<div class="minicart-prd-price" style="display: inherit;">
									<a href="#"><span>결제중</span></a>
								</div>
								</div>
								<div class="minicart-prd-action">
									<a id="${orderList.ocode}" href="#" class="icon-cross js-product-remove delete"></a>
								</div>
								</c:if>
								
								<c:if test="${orderList.paycheck==1}">
								<div class="minicart-prd-price">
									<i class="icon-check-box"></i>
									<span>결제완료</span>
								</div>
								<div class="minicart-prd-action">
									<a id="${orderList.ocode}" href="#" class="icon-pencil review"></a> 
								</div>
								</c:if>
							</div>
							</c:forEach>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>