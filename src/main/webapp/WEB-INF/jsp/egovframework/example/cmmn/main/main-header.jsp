<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	var left = {
		
			pageSubmitFn : function(menu) {
				location.href = "<c:url value='productList.do?pageName=" + menu + "'/>";
			}
	}

	$(function() {
		var $menu = $(".menu");
		var pageNum = "${pageName}";
		
		$menu.removeClass("active");
		$("#ma" + pageNum).parents("li").addClass("active");
		$("#mb" + pageNum).parents("li").addClass("active");
		$("#mc" + pageNum).parents("li").addClass("active");
		
		$menu.click(function() {
			var menu = $(this).attr("id");
			var group = menu.substring(2);
			left.pageSubmitFn(group);
		});
		
	});
</script>

<header class="hdr global_width hdr_sticky hdr-mobile-style2">
	<!-- Promo TopLine -->
	<div class="bgcolor"
		style="background-image: url(images/promo-topline-bg.png);">
		<div class="promo-topline" data-expires="1" style="display: none;">
			<div class="container">
				<div class="promo-topline-item"></div>
			</div>
		</div>
	</div>
	<!-- /Promo TopLine -->
	<!-- Mobile Menu -->
	<div class="mobilemenu js-push-mbmenu">
		<div class="mobilemenu-content">
			<div class="mobilemenu-close mobilemenu-toggle">CLOSE</div>
			<div class="mobilemenu-scroll">
				<div class="mobilemenu-search"></div>
				<div class="nav-wrapper show-menu">
					<div class="nav-toggle">
						<span class="nav-back"><i class="icon-arrow-left"></i></span> <span
							class="nav-title"></span>
					</div>
					<ul class="nav nav-level-1">
						<li><a href="main.do">카테고리 전체보기</a><span class="arrow"></span>
							<ul class="nav-level-2">
								<li><a id="ma1" class="menu" title="한식">한식</a></li>
								<li><a id="ma2" class="menu" title="분식">분식</a></li>
								<li><a id="ma3" class="menu" title="돈까스">돈까스</a></li>
								<li><a id="ma4" class="menu" title="회">회</a></li>
								<li><a id="ma5" class="menu" title="일식">일식</a></li>
								<li><a id="ma6" class="menu" title="치킨">치킨</a></li>
								<li><a id="ma7" class="menu" title="피자">피자</a></li>
								<li><a id="ma8" class="menu" title="중국집">중국집</a></li>
								<li><a id="ma9" class="menu" title="족발">족발</a></li>
								<li><a id="ma10" class="menu" title="보쌈">보쌈</a></li>
								<li><a id="ma11" class="menu" title="야식">야식</a></li>
								<li><a id="ma12" class="menu" title="찜">찜</a></li>
								<li><a id="ma13" class="menu" title="탕">탕</a></li>
								<li><a id="ma14" class="menu" title="도시락">도시락</a></li>
								<li><a id="ma15" class="menu" title="카페">카페</a></li>
								<li><a id="ma16" class="menu" title="디저트">디저트</a></li>
								<li><a id="ma17" class="menu" title="패스트푸드">패스트푸드</a></li>
							</ul></li>
						<li><a href="#">신상품<span
								class="menu-label menu-label--color1">NEW</span></a><span
							class="arrow"></span></li>
						<li><a href="#"">인기상품<span
								class="menu-label menu-label--color3">COMMEND</span></a><span
							class="arrow"></span></li>
						<li><a href="#">신상품<span
								class="menu-label menu-label--color4">SALE</span></a><span
							class="arrow"></span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- /Mobile Menu -->
	<div class="hdr-mobile show-mobile">
		<div class="hdr-content">
			<div class="container">
				<!-- Menu Toggle -->
				<div class="menu-toggle">
					<a href="#" class="mobilemenu-toggle"><i class="icon icon-menu"></i></a>
				</div>
				<!-- /Menu Toggle -->
				<div class="logo-holder">
					<a href="main.do" class="logo"><img src="images/logo.png"
						srcset="images/logo-retina.png 2x" alt=""></a>
				</div>
				<div class="hdr-mobile-right">
					<div class="hdr-topline-right links-holder"></div>
					<div class="minicart-holder"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="hdr-desktop hide-mobile">
		<div class="hdr-topline">
			<div class="container">
				<div class="row">
					<div class="col hdr-topline-center">
						<div class="custom-text">
							<span>${loginName}</span> 환영합니다.
						</div>
					</div>
					<div class="col-auto hdr-topline-right links-holder">
						<!-- Header Search -->
						<div class="dropdn dropdn_search hide-mobile @@classes">
							<a href="#" class="dropdn-link"><i class="icon icon-search2"></i><span>검색</span></a>
							<div class="dropdn-content">
								<div class="container">
									<form action="#" class="search">
										<button type="submit" class="search-button">
											<i class="icon-search2"></i>
										</button>
										<input type="text" class="search-input"
											placeholder="search keyword">
										<div class="search-popular js-search-autofill">
											<span class="search-popular-label">popular searches:</span><a
												href="#">Jeans</a> <a href="#">Sunglazsses</a> <a href="#">hand
												bags</a> <a href="#">Discount</a> <a href="#">St.Valentine’s
												gift</a> <a href="#">maxi dress</a> <a href="#">Underwear</a><a
												href="#">new in clothing</a> <a href="#">men tops</a>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- /Header Search -->
						<!-- Header Wishlist -->
						<div class="dropdn dropdn_wishlist @@classes">
							<a href="basketInfo.do" class="dropdn-link"><i
								class="icon icon-heart-1"></i><span>장바구니</span></a>
						</div>
						<!-- /Header Wishlist -->
						<!-- Header Account -->
						<div class="dropdn dropdn_account @@classes">
							<a href="#" class="dropdn-link"><i class="icon icon-person"></i><span>계정
									정보</span></a>
							<div class="dropdn-content">
								<div class="container">
									<div class="dropdn-close">CLOSE</div>
									<ul>
										<c:choose>
											<c:when test="${not empty loginName}">
												<li><a href="logout.do"><i class="icon icon-lock"></i><span>로그아웃</span></a></li>
												<li><a href="memberInfo.do"><i class="icon icon-person-fill"></i><span>나의 정보</span></a></li>
												<li><a href="orderInfo.do"><i class="icon icon-check-box"></i><span>주문정보</span></a></li>
												<c:if test="${ccode == 2 }">
													<li><a href="admin.do"><i class="icon icon-eye"></i><span>관리자</span></a></li>
												</c:if>
											</c:when>
											<c:otherwise>
												<li><a href="login.do"><i class="icon icon-lock"></i><span>로그인</span></a></li>
												<li><a href="sign.do"><i class="icon icon-person-fill-add"></i><span>회원가입</span></a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>
							</div>
						</div>
						<!-- /Header Account -->
					</div>
				</div>
			</div>
		</div>
		<div class="hdr-content hide-mobile">
			<div class="container">
				<div class="row">
					<div class="col-auto logo-holder">
						<a href="main.do" class="logo"><img src="images/logo.png"
							srcset="images/logo-retina.png 2x" alt=""></a>
					</div>
					<!--navigation-->
					<div class="prev-menu-scroll icon-angle-left prev-menu-js"></div>
					<div class="nav-holder">
						<div class="hdr-nav">
							<!--mmenu-->
							<ul class="mmenu mmenu-js">
								<li class="mmenu-item--mega"><a href="#">카테고리
										전체보기</a>
									<div class="mmenu-submenu mmenu-submenu-with-sublevel">
										<div class="mmenu-submenu-inside">
											<div class="container">
												<div class="mmenu-cols column-5">
													<div class="mmenu-col">
														<ul class="submenu-list">
															<li><a id="mb1" class="menu" href="#">한식</a></li>
															<li><a id="mb2" class="menu"  href="#">분식</a></li>
															<li><a id="mb3" class="menu"  href="#">돈까스</a></li>
															<li><a id="mb4" class="menu"  href="#">회</a></li>
														</ul>
													</div>
													<div class="mmenu-col">
														<ul class="submenu-list">
															<li><a id="mb5" class="menu"  href="#">일식</a></li>
															<li><a id="mb6" class="menu"  href="#">치킨</a></li>
															<li><a id="mb7" class="menu"  href="#">피자</a></li>
															<li><a id="mb8" class="menu"  href="#">중국집</a></li>
														</ul>
													</div>
													<div class="mmenu-col">
														<ul class="submenu-list">
															<li><a id="mb9" class="menu"  href="#">족발</a></li>
															<li><a id="mb10" class="menu"  href="#">보쌈</a></li>
															<li><a id="mb11" class="menu"  href="#">야식</a></li>
															<li><a id="mb12" class="menu"  href="#">찜</a></li>
															<li><a id="mb13" class="menu"  href="#">탕</a></li>
														</ul>
													</div>
													<div class="mmenu-col">
														<ul class="submenu-list">
															<li><a id="mb14" class="menu"  href="#">도시락</a></li>
															<li><a id="mb15" class="menu"  href="#">카페</a></li>
															<li><a id="mb16" class="menu"  href="#">디저트</a></li>
															<li><a id="mb17" class="menu"  href="#">패스트푸드</a></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div></li>
								<li><a href="#" title="">신상품<span
										class="menu-label menu-label--color1">NEW</span></a></li>
								<li><a href="#">인기상품<span
										class="menu-label menu-label--color3">COMMEND</span></a></li>
								<li class="mmenu-item--mega"><a href="#">할인상품<span
										class="menu-label menu-label--color4">SALE</span></a></li>
							</ul>
							<!--/mmenu-->
						</div>
					</div>
					<div class="next-menu-scroll icon-angle-right next-menu-js"></div>
					<!--//navigation-->
					<div class="col-auto minicart-holder">
						<!-- <div class="minicart minicart-js">
							<a href="#" class="minicart-link"><i
								class="icon icon-handbag"></i> <span class="minicart-qty">3</span>
								<span class="minicart-title">장바구니</span> <span
								class="minicart-total">75,000원</span></a>
							<div class="minicart-drop">
								<div class="container">
									<div class="minicart-drop-close">CLOSE</div>
									<div class="minicart-drop-content">
										<h3>장바구니 목록</h3>
										<div class="minicart-prd">
											<div class="minicart-prd-image">
												<a href="#"><img
													src="images/products/product-placeholder.png"
													data-srcset="images/products/xsmall/product-05.jpg"
													class="lazyload" alt=""></a>
											</div>
											<div class="minicart-prd-name">
												<h5>
													<a href="#">상품명</a>
												</h5>
												<h2>
													<a href="#">Checkered shirt</a>
												</h2>
											</div>
											<div class="minicart-prd-qty">
												<span>개수:</span> <b>1</b>
											</div>
											<div class="minicart-prd-price">
												<span>price:</span> <b>$ 75.00</b>
											</div>
											<div class="minicart-prd-action">
												<a href="#" class="icon-heart js-label-wishlist"></a> <a
													href="product.html" class="icon-pencil"></a> <a href="#"
													class="icon-cross js-product-remove"></a>
											</div>
										</div>
										<div class="minicart-prd">
											<div class="minicart-prd-image">
												<a href="#"><img
													src="images/products/product-placeholder.png"
													data-srcset="images/products/xsmall/product-02.jpg"
													class="lazyload" alt=""></a>
											</div>
											<div class="minicart-prd-name">
												<h5>
													<a href="#">상품명</a>
												</h5>
												<h2>
													<a href="#">Long top with print</a>
												</h2>
											</div>
											<div class="minicart-prd-qty">
												<span>개수:</span> <b>1</b>
											</div>
											<div class="minicart-prd-price">
												<span>price:</span> <b>$ 20.00</b>
											</div>
											<div class="minicart-prd-action">
												<a href="#" class="icon-heart js-label-wishlist"></a> <a
													href="product.html" class="icon-pencil"></a> <a href="#"
													class="icon-cross js-product-remove"></a>
											</div>
										</div>
										<div class="minicart-prd">
											<div class="minicart-prd-image">
												<a href="#"><img
													src="images/products/product-placeholder.png"
													data-srcset="images/products/xsmall/product-14.jpg"
													class="lazyload" alt=""></a>
											</div>
											<div class="minicart-prd-name">
												<h5>
													<a href="#">saucany</a>
												</h5>
												<h2>
													<a href="#">Knitted sweater</a>
												</h2>
											</div>
											<div class="minicart-prd-qty">
												<span>개수:</span> <b>1</b>
											</div>
											<div class="minicart-prd-price">
												<span>price:</span> <b>$ 199.00</b>
											</div>
											<div class="minicart-prd-action">
												<a href="#" class="icon-heart js-label-wishlist"></a> <a
													href="product.html" class="icon-pencil"></a> <a href="#"
													class="icon-cross js-product-remove"></a>
											</div>
										</div>
										<div class="minicart-drop-total">
											<div class="float-right">
												<span class="minicart-drop-summa"><span>Cart
														Subtotal:</span> <b>$ 294.00</b></span>
												<div class="minicart-drop-btns-wrap">
													<a href="checkout.html" class="btn"><i
														class="icon-check-box"></i><span>checkout</span></a> <a
														href="cart.html" class="btn btn--alt"><i
														class="icon-handbag"></i><span>view cart</span></a>
												</div>
											</div>
											<div class="float-left">
												<a href="cart.html" class="btn btn--alt"><i
													class="icon-handbag"></i><span>view cart</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="sticky-holder compensate-for-scrollbar">
		<div class="container">
			<div class="row">
				<a href="#" class="mobilemenu-toggle show-mobile"><i
					class="icon icon-menu"></i></a>
				<div class="col-auto logo-holder-s">
					<a href="main.do" class="logo"><img src="images/logo.png"
						srcset="images/logo-retina.png 2x" alt=""></a>
				</div>
				<!--navigation-->
				<div class="prev-menu-scroll icon-angle-left prev-menu-js"></div>
				<div class="nav-holder-s"></div>
				<div class="next-menu-scroll icon-angle-right next-menu-js"></div>
				<!--//navigation-->
				<div class="col-auto minicart-holder-s"></div>
			</div>
		</div>
	</div>
</header>

