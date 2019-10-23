<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
  
<div class="page-content">
        <div class="holder mt-0">
            <div class="container">
                <ul class="breadcrumbs">
                    <li><a href="index.html">Home</a></li>
                    <li><span>Category</span></li>
                </ul>
            </div>
        </div>
        <div class="holder mt-0">
            <div class="container">
                <!-- Two columns -->
                <!-- Page Title -->
                <div class="page-title text-center d-none d-lg-block">
                    <div class="title">
                        <h1>${productSelect[0].gname}</h1>
                    </div>
                </div>
                <!-- /Page Title -->
                <div class="row">
                    <!-- Left column -->
                    <div class="col-lg-3 aside aside--left fixed-col js-filter-col">
                        <div class="fixed-col_container">
                            <div class="filter-close">CLOSE</div>
                            <div class="sidebar-block sidebar-block--mobile d-block d-lg-none">
                                <div class="d-flex align-items-center">
                                    <div class="selected-label">(6) FILTER</div>
                                    <div class="selected-count ml-auto">SELECTED <span><b>25 items</b></span></div>
                                </div>
                            </div>
                            <div class="sidebar-block filter-group-block collapsed selected open">
                                <div class="sidebar-block_title"><span>메뉴</span>
                                    <div class="toggle-arrow"></div>
                                </div>
                                <div class="sidebar-block_content">
                                    <ul class="category-list">
                                        <li><a id="mc1" class="menu" href="#">한식</a></li>
                                        <li><a id="mc2" class="menu"  href="#">분식</a></li>
                                        <li><a id="mc3" class="menu"  href="#">돈까스</a></li>
                                        <li><a id="mc4" class="menu"  href="#">회</a></li>
                                        <li><a id="mc5" class="menu"  href="#">일식</a></li>
                                        <li><a id="mc6" class="menu"  href="#">치킨</a></li>
                                        <li><a id="mc7" class="menu"  href="#">피자</a></li>
                                        <li><a id="mc8" class="menu"  href="#">중국집</a></li>
                                        <li><a id="mc9" class="menu"  href="#">족발</a></li>
                                        <li><a id="mc10" class="menu"  href="#">보쌈</a></li>
                                        <li><a id="mc11" class="menu"  href="#">야식</a></li>
                                        <li><a id="mc12" class="menu"  href="#">찜</a></li>
                                        <li><a id="mc13" class="menu"  href="#">탕</a></li>
                                        <li><a id="mc14" class="menu"  href="#">도시락</a></li>
                                        <li><a id="mc15" class="menu"  href="#">카페</a></li>
                                        <li><a id="mc16" class="menu"  href="#">디저트</a></li>
                                        <li><a id="mc17" class="menu"  href="#">패스트푸드</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Left column -->
                    <!-- Center column -->
                    <div class="col-lg aside">
                        <div class="prd-grid-wrap">
                            <!-- Filter Row -->
                            <div class="filter-row invisible">
                                <div class="row row-1 d-lg-none align-items-center">
                                    <div class="col">
                                        <h1 class="category-title">WOMEN’S</h1>
                                    </div>
                                    <div class="col-auto ml-auto">
                                        <div class="view-in-row d-md-none"><span data-view="data-to-show-sm-1"><i class="icon icon-view-1"></i></span> <span data-view="data-to-show-sm-2"><i class="icon icon-view-2"></i></span></div>
                                        <div class="view-in-row d-none d-md-inline"><span data-view="data-to-show-md-2"><i class="icon icon-view-2"></i></span> <span data-view="data-to-show-md-3"><i class="icon icon-view-3"></i></span></div>
                                    </div>
                                </div>
                                <div class="row row-2">
                                    <div class="col-left d-flex align-items-center">
                                        <div class="sort-by-holder">
                                            <div class="select-label d-none d-lg-inline">Sort by:</div>
                                            <div class="select-wrapper-sm d-none d-lg-inline-block"><select class="form-control input-sm">
                                                    <option value="featured">Featured</option>
                                                    <option value="rating">Rating</option>
                                                    <option value="price">Price</option>
                                                </select></div>
                                            <div class="select-directions d-none d-lg-inline"><span><i class="icon icon-arrow-down"></i></span> <span><i class="icon icon-arrow-up"></i></span></div>
                                            <div class="dropdown d-flex d-lg-none align-items-center justify-content-center"><span class="select-label">Sort By</span>
                                                <div class="select-wrapper-sm"><select class="form-control input-sm">
                                                        <option value="featured">Featured</option>
                                                        <option value="rating">Rating</option>
                                                        <option value="price">Price</option>
                                                    </select></div>
                                            </div>
                                        </div>
                                        <div class="filter-button d-lg-none"><a href="#" class="fixed-col-toggle">FILTER</a></div>
                                    </div>
                                    <div class="col col-center d-none d-lg-flex align-items-center justify-content-center">
                                        <div class="view-label">View:</div>
                                        <div class="view-in-row"><span data-view="data-to-show-3"><i class="icon icon-view-3"></i></span> <span data-view="data-to-show-4"><i class="icon icon-view-4"></i></span></div>
                                    </div>
                                    <div class="col-right ml-auto d-none d-lg-flex align-items-center">
                                        <div class="items-count">35 item(s)</div>
                                        <div class="show-count-holder">
                                            <div class="select-label">Show:</div>
                                            <div class="select-wrapper-sm"><select class="form-control input-sm">
                                                    <option value="featured">12</option>
                                                    <option value="rating">36</option>
                                                    <option value="price">100</option>
                                                </select></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Filter Row -->
                            <!-- Products Grid -->
                            <div class="prd-grid product-listing data-to-show-3 data-to-show-md-3 data-to-show-sm-2 js-category-grid">
                                <c:forEach var="product" items="${productSelect}" varStatus="status">
                                <div class="prd prd-has-loader prd-new prd-popular">
                                    <div class="prd-inside">
                                        <div class="prd-img-area">
                                        	<a href="productDetail.do?pcode=${product.pcode}&pageName=${pageName}" class="prd-img">
                                        		<c:forEach var="productimg" items="${productimg}">
	                                            	<c:if test="${product.pcode == productimg.pcode}">
	                                            		<c:if test="${productimg.pSeq == 1}">
			                                        		<!-- <img src="images/products/product-placeholder.png" data-srcset="images/products/product-01.jpg" alt="Glamor shoes" class="js-prd-img lazyload"> -->
			                                        		<img src="images/products/product-placeholder.png" data-srcset="upload/${productimg.pimage}" alt="${product.pname}" class="js-prd-img lazyload">
		                                        		</c:if>
	                                        		</c:if>
                                                </c:forEach>
                                        	</a>
                                           	<!-- <div class="label-new">NEW</div><a href="#" class="label-wishlist icon-heart js-label-wishlist"></a>
                                            <div class="label-sale">-62%</div>
                                            <div class="label-outstock">OUT OF STOCK</div><a href="#" class="label-wishlist icon-heart js-label-wishlist"></a> -->
                                            <ul class="list-options color-swatch prd-hidemobile">
                                            	<c:forEach var="productimg" items="${productimg}">
	                                            	<c:if test="${product.pcode == productimg.pcode}">
	                                            		<c:if test="${productimg.pSeq == 1 || productimg.pSeq == 2}">
	                                                		<li data-image="upload/${productimg.pimage}"><a href="#" class="js-color-toggle"><img src="images/products/product-placeholder.png" data-srcset="images/products/xsmall/product-01.jpg" class="lazyload" alt="Color Name"></a></li>
		                                        		</c:if>
	                                                </c:if>
                                                </c:forEach>
                                                <!-- <li data-image="images/products/product-01-2.jpg"><a href="#" class="js-color-toggle"><img src="images/products/product-placeholder.png" data-srcset="images/products/xsmall/product-01-2.jpg" class="lazyload" alt="Color Name"></a></li> -->
                                            </ul>
                                            <div class="gdw-loader"></div>
                                        </div>
                                        <div class="prd-info">
                                            <div class="prd-tag prd-hidemobile"><a href="#">#${product.pcode}</a></div>
                                            <h2 class="prd-title"><a href="productDetail.do?pcode=${product.pcode}&pageName=${pageName}">${product.pname}</a></h2>
                                            <div class="prd-rating prd-hidemobile">
                                            	<c:forEach var="i" begin="1" end="5">
                                            		<c:choose>
                                            			<c:when test="${i < avgNum}">
                                            				<i class="icon-star fill"></i>
                                            			</c:when>
                                            			<c:otherwise>
                                            				<i class="icon-star"></i>
                                            			</c:otherwise>
                                            		</c:choose>
                                            	</c:forEach>
                                            </div>
                                            <div class="prd-price">
                                                <div class="price-new">${product.price}원</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                            <div class="loader-wrap">
                                <div class="dots">
                                    <div class="dot one"></div>
                                    <div class="dot two"></div>
                                    <div class="dot three"></div>
                                </div>
                            </div>
                            <!-- /Products Grid -->
                                <ul class="pagination mt-0">
                                    <li class="active"><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /Center column -->
                </div>
                <!-- /Two columns -->
            </div>
        </div>
