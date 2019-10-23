<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>
    
<script>
	$(function() {
		$("#phone").numeric({
			maxPreDecimalPlaces : 11	
		});
		
		$("#kakaopay").click(function() {
			var $payName 	= $("#payName"),
				$phone	= $("#phone"),
				$zipNo	 = $("#zipNo"),
				$roadAddrPart1 = $("#roadAddrPart1"),
				$addrDetail	  = $("#addrDetail");
			
			if ($payName.val().length == 0) {
				alert("이름을 등록해주세요.");
				$payName.focus();
				return false;
			}
			
			if ($phone.val().length == 0) {
				alert("번호를 등록해주세요.");
				$phone.focus();
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
	
</script>

<div class="page-content">
        <div class="holder mt-0">
            <div class="container">
                <ul class="breadcrumbs">
                    <li><a href="index.html">Home</a></li>
                    <li><span>결제</span></li>
                </ul>
            </div>
        </div>
        <div class="holder mt-0">
            <div class="container">
                <h1 class="text-center">결제</h1>
                <div class="clearfix"></div>
                <form action="kakaoPay.do" method="post">
                    <div class="row">
                        <div class="col-md-7">
                            <div class="panel-group" id="checkoutAccordion">
                                <div class="panel">
                                    <div class="panel-heading active">
                                        <h4 class="panel-title"><a data-toggle="collapse" href="#step1">01. 주문상세</a></h4>
                                    </div>
                                    <div id="step1" data-parent="#checkoutAccordion" class="panel-collapse collapse show">
                                        <div class="panel-body">
                                            <div class="panel-body-inside">
                                                <div class="row mt-2">
                                                    <div class="col-sm-6"><label class="text-uppercase">이름</label>
                                                        <div class="form-group"><input id="payName" name="payName" type="text" class="form-control"></div>
                                                    </div>
                                                </div>
                                                <div class="row mt-2">
                                                    <div class="col-sm-6"><label class="text-uppercase">전화번호</label>
                                                        <div class="form-group"><input id="phone" name="phone" type="text" class="form-control" style="text-align:center" onKeyup="inputPhonenumber(this)"></div>
                                                    </div>
                                                </div>
				                                <div class="form-group"><strong>우편번호</strong>
				                                	<div class="form-flex">
				                                    	<div class="form-group"><input type="text" class="form-control" id="zipNo" name="zipNo" readonly></div><button onClick="goPopup();" class="btn btn--form btn--alt" value="팝업" type="button">Apply</button>
				                                	</div>
				                                </div>
			                                 	<div class="form-group"><strong>주소</strong><br>
			                                 	<input type="text" class="form-control" id="roadAddrPart1" name="roadAddrPart1" readonly></div>
			                                 	<div class="form-group"><input type="text" class="form-control" id="addrDetail" name="addrDetail"></div>	
                                                <div class="clearfix"><button id="kakaopay" type="submit" class="btn btn--lg w-100">카카오 페이로 결제하기</button></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 pl-lg-8 mt-2 mt-md-0">
                            <h2 class="custom-color">결제한 상품</h2>
                            <div class="cart-table cart-table--sm">
                                <div class="cart-table-prd cart-table-prd-headings d-none d-lg-table">
                                    <div class="cart-table-prd-image"></div>
                                    <div class="cart-table-prd-name"><b>상품</b></div>
                                    <div class="cart-table-prd-qty"><b>개수</b></div>
                                    <div class="cart-table-prd-price"><b>가격</b></div>
                                </div>
                                <div class="cart-table-prd">
                                    <div class="cart-table-prd-image"><img src="upload/${img}" alt=""></div>
                                    <div class="cart-table-prd-name">
                                        <h2>${product.pname}</h2>
                                        <input id="pname" name="pname" type="hidden" value="${product.pname}">.
                                        <input id="pcode" name="pcode" type="hidden" value="${product.pcode}">
                                    </div>
                                    <div class="cart-table-prd-qty"><b>${count}</b></div>
                                    <input id="count" name="count" type="hidden" value="${count}">
                                    <div class="cart-table-prd-price"><b>${product.price} 원</b></div>
                                </div>
                            </div>
                            <div class="card-total-sm">
                                <div class="float-right">총 <span class="card-total-price">${total} 원</span></div>
                            </div>
                            <div class="mt-2"></div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>