<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>    
<script>
	$(function() {
		var qtyValue = $(".qty-input").val();;
		var value;
		var check;
		var qtyString
		
		qtyString = 1*${product.price} + "원";
		$("#qtyprice").html(qtyString);
		$(".inc").click(function() {
			value = $(this).attr("class");
			check = value.charAt(0);
			
			if(check == "d") {
				if(qtyValue == 1) {
					return;
				}
				qtyValue--;
			} else {
				if(qtyValue == 10) {
					return;
				}
				qtyValue++;
			}
			qtyString = qtyValue*${product.price} + "원";
			$("#qtyprice").html(qtyString);
		});
		
		$("#submitBtn").click(function() {
			
			//상품코드 + 개수 + 가격 + 총가격
			var count = $(".qty-input").val();
			var total = qtyValue*${product.price};
			location.href = "productPay.do?pcode=${product.pcode}&img=${imgList[0].pimage}&count=" + count;
		});
	});
</script>
    
    
<!DOCTYPE html>
<div class="page-content">
        <div class="holder mt-0">
            <div class="container">
                <ul class="breadcrumbs">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="category.html">${product.gname}</a></li>
                    <li><span>${product.pname}</span></li>
                </ul>
            </div>
        </div>
        <div class="holder mt-0">
            <div class="container">
                <div class="row prd-block prd-block--mobile-image-first js-prd-gallery" id="prdGallery100">
                    <div class="col-md-5 fixed-col fixed aside js-product-fixed-col">
     	                   <div class="fixed-col_container">
                            <div class="fstart"></div>
                            <div class="fixed-wrapper">
                                <div class="fixed-scroll">
                                    <div class="fixed-col_content">
                                        <div class="prd-block_info js-prd-m-holder mb-2 mb-md-0"></div><!-- Product Gallery -->
                                    <div class="prd-block_main-image main-image--slide js-main-image--slide">
                                        <div class="prd-block_main-image-holder js-main-image-zoom" data-zoomtype="inner">
                                            <div class="prd-block_main-image-video js-main-image-video"><video loop muted preload="metadata" controls="controls">
                                                    <source src="#"></video>
                                                <div class="gdw-loader"></div>
                                            </div>
                                            <div class="prd-has-loader">
                                                <!-- <div class="gdw-loader"></div><img src="images/products/large/product-01.jpg" class="zoom" alt="" data-zoom-image="images/products/large/product-01.jpg"> -->
                                           		<div class="gdw-loader"></div><img src="upload/${imgList[0].pimage}" class="zoom" alt="" data-zoom-image="images/products/large/product-01.jpg">
                                            </div>
                                            <div class="prd-block_main-image-next slick-next js-main-image-next">NEXT</div>
                                            <div class="prd-block_main-image-prev slick-prev js-main-image-prev">PREV</div>
                                        </div>
                                        <div class="prd-block_main-image-links"> <a href="images/products/large/product-01.jpg" class="prd-block_zoom-link"><i class="icon icon-zoomin"></i></a></div>
                                    </div>
                                    <div class="product-previews-wrapper">
                                        <div class="product-previews-carousel" id="previewsGallery100">
	                                        <c:forEach var="productImg" items="${imgList}">
	                                        <a href="#" data-value="Silver" data-image="upload/${productImg.pimage}" data-zoom-image="upload/${productImg.pimage}">
	                                        	<img src="upload/${productImg.pimage}" alt="상품이미지">
	                                        </a>
	                                         </c:forEach>
                                        </div>
                                    </div>
                                    <!-- /Product Gallery -->
                                </div>
                            </div>
                        </div>
                        <div class="fend"></div>
                    </div>
                </div>
                <div class="col-md-7 aside">
                    <div class="prd-block_info">
                        <div class="js-prd-d-holder prd-holder">
                            <div class="prd-block_title-wrap">
                                <h1 class="prd-block_title">${product.pname}</h1>
                                <!-- <div class="prd-block__labels"><span class="prd-label--new">NEW</span></div> -->
                            </div>
                            <div class="prd-block_info-top">
                                <div class="product-sku">SKU: <span>#${product.pcode}</span></div>
                                <div class="prd-rating"><a href="#" class="prd-review-link">
                                	<c:forEach var="i" begin="1" end="5">
                                   		<c:choose>
                                   			<c:when test="${i <= avge}">
		                           				<i class="icon-star fill"></i>
		                           			</c:when>
                                   			<c:otherwise>
                                   				<i class="icon-star"></i>
                                   			</c:otherwise>
                                   		</c:choose>
                                   	</c:forEach>
                                	<span>${product.countNum} reviews</span></a></div>
                            </div>
                            <div class="prd-block_description topline">
                                <p>${product.pcontent}</p>
                            </div>
                        </div>
                        <div class="prd-block_options topline">
                            <div class="prd-block_qty"><span class="option-label">Qty:</span>
                                <div class="qty qty-changer">
                                    <fieldset><input type="button" value="&#8210;" class="decrease inc"> <input type="text" class="qty-input" value="1" data-min="1" data-max="10"> <input type="button" value="+" class="increase inc"></fieldset>
                                </div><span class="option-label">max <span class="qty-max">10</span> item(s)</span>
                            </div>
                        </div>
                        <div class="prd-block_actions topline">
                            <div class="prd-block_price"><span id="qtyprice" class="prd-block_price--actual">원</span> <!-- <span class="prd-block_price--old">$210.00</span> --></div>
                            <div class="btn-wrap"><button class="btn btn--add-to-cart" id="submitBtn"><i class="icon icon-handbag"></i><span>결제하기</span></button></div>
                            <div class="prd-block_link"><a  href="#" class="icon-heart-1"></a> <a href="#" class="icon-share"></a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ymax"></div>
        </div>
        <div class="holder mt-5">
            <div class="container">
                <div class="holder">
                    <div class="container">
                        <h2>상품리뷰</h2>
                        <div id="productReviews">
                            <div class="prd-rating">
                            <c:forEach var="i" begin="1" end="5">
                           		<c:choose>
                           			<c:when test="${i <= avge}">
                           				<i class="icon-star fill"></i>
                           			</c:when>
                           			<c:otherwise>
                           				<i class="icon-star"></i>
                           			</c:otherwise>
                           		</c:choose>
                           	</c:forEach>
                            <span> 총 ${cnt}개의 리뷰</span></div>
                            <c:forEach var="review" items="${review}">
	                            <div class="review-item">
	                                <h4 class="review-item_author">${review.uname}</h4>
	                                <div class="review-item_rating">
	                                	<c:forEach var="i" begin="1" end="5">
			                           		<c:choose>
			                           			<c:when test="${i <= review.rscore}">
			                           				<i class="icon-star fill"></i>
			                           			</c:when>
			                           			<c:otherwise>
			                           				<i class="icon-star"></i>
			                           			</c:otherwise>
			                           		</c:choose>
			                           	</c:forEach>
									</div>
	                                <p>${review.rcommend}</p>
	                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>