<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container-fluid">
    <div class="container">
         <!-- Begin Page Header-->
         <div class="row">
             <div class="page-header">
              <div class="d-flex align-items-center">
                  <h2 class="page-header-title">데시보드</h2>
              </div>
             </div>
         </div>
         <div class="row flex-row">
             <div class="col-xl-6 col-md-6 os-animation" data-os-animation="fadeInUp">
                 <!-- Begin Widget 05 -->
                 <div class="widget widget-05 has-shadow">
                     <!-- Begin Widget Header -->
                     <div class="widget-header bordered d-flex align-items-center">
                         <h2>상품</h2>
                     </div>
                     <!-- End Widget Header -->
                     <!-- Begin Widget Body -->
                     <div class="widget-body no-padding hidden">
                         <div class="author-avatar">
                             <span class="badge-pulse-green"></span>
                             <img src="assets/img/avatar/avatar-03.jpg" alt="..." class="img-fluid rounded-circle">
                         </div>
                         <div class="author-name">
                             	판매 진행 현황
                         </div>
                         <div class="chart">
                             <div class="row no-margin justify-content-center">
                                 <div class="col-12 col-xl-8 col-md-8 col-sm-8">
                                     <div class="row no-margin align-items-center">
                                         <!-- Begin Chart -->
                                         <div class="col-9 no-padding">
                                             <div class="chart-graph">
                                                 <div class="chart">
                                                     <canvas id="sales-stats"></canvas>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col-3 no-padding text-center">
                                             <div class="chart-text">
                                                 <span class="heading">판매수량</span>
                                                 <span class="number">364</span>
                                                 <span class="cxg text-green">364000원</span>
                                             </div>
                                         </div>
                                         <!-- End Chart -->
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <div class="social-stats">
                             <div class="row d-flex justify-content-between">
                                 <div class="col-4 text-center">
                                     <i class="la la-users followers"></i>
                                     <div class="counter">37건</div>
                                     <div class="heading">입금확인중</div>
                                 </div>
                                 <div class="col-4 text-center">
                                     <i class="la la-dribbble dribbble"></i>
                                     <div class="counter">2건</div>
                                     <div class="heading">주문접수</div>
                                 </div>
                                 <div class="col-4 text-center">
                                     <i class="la la-behance behance"></i>
                                     <div class="counter">2건</div>
                                     <div class="heading">발주확인</div>
                                 </div>
                             </div>
                         </div>
                         <div class="social-stats">
                             <div class="row d-flex justify-content-between">
                                 <div class="col-4 text-center">
                                     <i class="la la-users followers"></i>
                                     <div class="counter">2건</div>
                                     <div class="heading">출고처리</div>
                                 </div>
                                 <div class="col-4 text-center">
                                     <i class="la la-dribbble dribbble"></i>
                                     <div class="counter">1건</div>
                                     <div class="heading">출고지연</div>
                                 </div>
                                 <div class="col-4 text-center">
                                     <i class="la la-behance behance"></i>
                                     <div class="counter">0건</div>
                                     <div class="heading">출고완료</div>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <!-- End Widget Body -->
                 </div>
                 <!-- End Widget 05 -->
             </div>
             
             <div class="col-xl-6 os-animation" data-os-animation="fadeInUp">
                 <!-- Begin Widget 06 -->
                 <div class="widget widget-06 has-shadow">
                     <!-- Begin Widget Header -->
                     <div class="widget-header bordered d-flex align-items-center">
                         <h2>리뷰</h2>
                     </div>
                     <!-- End Widget Header -->
                     <!-- Begin Widget Body -->
                     <div class="widget-body p-0">
                         <div id="list-group" class="widget-scroll" style="max-height:490px;">
                             <ul class="reviews list-group w-100">
                                 <!-- 01 -->
                                 <li class="list-group-item">
                                     <div class="media">
                                         <div class="media-left align-self-start">
                                             <img src="assets/img/avatar/avatar-02.jpg" class="user-img rounded-circle" alt="...">
                                         </div>
                                         <div class="media-body align-self-center">
                                             <div class="username">
                                                 <h4>박노율</h4>
                                             </div>
                                             <div class="msg">
                                                 <div class="stars">
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star-half-empty"></i>
                                                 </div>
                                                 <p>
                                                     WoW! Amazing Work!
                                                 </p>
                                             </div>
                                             <div class="meta">
                                                 <span class="mr-3">30 minutes ago - 1 Reply</span>
                                                 <a href="#">Reply</a>
                                             </div>
                                         </div>
                                         <div class="media-right pr-3 align-self-center">
                                             <div class="like text-center">
                                                 <i class="ion-heart"></i>
                                                 <span>12</span>
                                             </div>
                                         </div>
                                     </div>
                                 </li>
                                 <!-- End 01 -->
                                 <!-- 02 -->
                                 <li class="list-group-item">
                                     <div class="media">
                                         <div class="media-left align-self-start">
                                             <img src="assets/img/avatar/avatar-05.jpg" class="user-img rounded-circle" alt="...">
                                         </div>
                                         <div class="media-body align-self-center">
                                             <div class="username">
                                                 <h4>배병주</h4>
                                             </div>
                                             <div class="msg">
                                                 <div class="stars">
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star"></i>
                                                 </div>
                                                 <p>
                                                     Very nice! Keep up the beautiful work.
                                                 </p>
                                             </div>
                                             <div class="meta">
                                                 <span class="mr-3">2 hours ago</span>
                                                 <a href="#">Reply</a>
                                             </div>
                                         </div>
                                         <div class="media-right pr-3 align-self-center">
                                             <div class="like text-center">
                                                 <i class="ion-heart"></i>
                                                 <span>4</span>
                                             </div>
                                         </div>
                                     </div>
                                 </li>
                                 <!-- End 02 -->
                                 <!-- 03 -->
                                 <li class="list-group-item">
                                     <div class="media">
                                         <div class="media-left align-self-start">
                                             <img src="assets/img/avatar/avatar-04.jpg" class="user-img rounded-circle" alt="...">
                                         </div>
                                         <div class="media-body align-self-center">
                                             <div class="username">
                                                 <h4>오찬혁</h4>
                                             </div>
                                             <div class="msg">
                                                 <div class="stars">
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star"></i>
                                                 </div>
                                                 <p>
                                                     Nice work, good design!
                                                 </p>
                                             </div>
                                             <div class="meta">
                                                 <span class="mr-3">4 hours ago</span>
                                                 <a href="#">Reply</a>
                                             </div>
                                         </div>
                                         <div class="media-right pr-3 align-self-center">
                                             <div class="like text-center">
                                                 <i class="ion-heart"></i>
                                                 <span>32</span>
                                             </div>
                                         </div>
                                     </div>
                                 </li>
                                 <!-- End 03 -->
                                 <!-- 04 -->
                                 <li class="list-group-item">
                                     <div class="media">
                                         <div class="media-left align-self-start">
                                             <img src="assets/img/avatar/avatar-09.jpg" class="user-img rounded-circle" alt="...">
                                         </div>
                                         <div class="media-body align-self-center">
                                             <div class="username">
                                                 <h4>김용민</h4>
                                             </div>
                                             <div class="msg">
                                                 <div class="stars">
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star-half-empty"></i>
                                                 </div>
                                                 <p>
                                                     Very nice! Keep up the beautiful work.
                                                 </p>
                                             </div>
                                             <div class="meta">
                                                 <span class="mr-3">5 hours ago - 2 Reply</span>
                                                 <a href="#">Reply</a>
                                             </div>
                                         </div>
                                         <div class="media-right pr-3 align-self-center">
                                             <div class="like text-center">
                                                 <i class="ion-heart"></i>
                                                 <span>2</span>
                                             </div>
                                         </div>
                                     </div>
                                 </li>
                                 <!-- End 04 -->
                                 <!-- 05 -->
                                 <li class="list-group-item">
                                     <div class="media">
                                         <div class="media-left align-self-start">
                                             <img src="assets/img/avatar/avatar-03.jpg" class="user-img rounded-circle" alt="...">
                                         </div>
                                         <div class="media-body align-self-center">
                                             <div class="username">
                                                 <h4>이세희</h4>
                                             </div>
                                             <div class="msg">
                                                 <div class="stars">
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star"></i>
                                                     <i class="la la-star-half-empty"></i>
                                                 </div>
                                                 <p>
                                                     I like the color combination!
                                                 </p>
                                             </div>
                                             <div class="meta">
                                                 <span class="mr-3">1 day ago</span>
                                                 <a href="#">Reply</a>
                                             </div>
                                         </div>
                                         <div class="media-right pr-3 align-self-center">
                                             <div class="like text-center">
                                                 <i class="ion-heart"></i>
                                                 <span>9</span>
                                             </div>
                                         </div>
                                     </div>
                                 </li>
                                 <!-- End 05 -->
                             </ul>
                         </div>
                         <!-- End List -->
                     </div>
                     <!-- End Widget Body -->
                 </div>
                 <!-- End Widget 06 -->
             </div>
         </div>
         <!-- End Row -->
         <div class="row flex-row">
             <!-- Begin Facebook -->
             <div class="col-xl-3 col-md-6 col-sm-6">
                 <div class="widget widget-12 has-shadow">
                     <div class="widget-body">
                         <div class="media">
                             <div class="media-body align-self-center">
                                 <div class="title">방문자수</div>
                                 <div class="number">10,865</div>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <!-- End Facebook -->
             <!-- Begin Twitter -->
             <div class="col-xl-3 col-md-6 col-sm-6">
                 <div class="widget widget-12 has-shadow">
                     <div class="widget-body">
                         <div class="media">
                             <div class="media-body align-self-center">
                                 <div class="title">취소요청</div>
                                 <div class="number">8,986</div>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <!-- End Twitter -->
             <!-- Begin Linkedin -->
             <div class="col-xl-3 col-md-6 col-sm-6">
                 <div class="widget widget-12 has-shadow">
                     <div class="widget-body">
                         <div class="media">
                             <div class="media-body align-self-center">
                                 <div class="title">반품요청</div>
                                 <div class="number">3,654</div>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <!-- End Linkedin -->
             <!-- Begin Youtube -->
             <div class="col-xl-3 col-md-6 col-sm-6">
                 <div class="widget widget-12 has-shadow">
                     <div class="widget-body">
                         <div class="media">
                             <div class="media-body align-self-center">
                                 <div class="title">교환요청</div>
                                 <div class="number">12,357</div>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <!-- End Youtube -->
         </div>
         <!-- Begin Row -->
         <div class="row flex-row">
             <div class="col-xl-6 col-md-6 os-animation" data-os-animation="fadeInUp">
                 <div class="widget widget-22 bg-gradient-03">
                     <div class="widget-body h-100 d-flex align-items-center">
                         <div class="section-title">
                             <h3>남자</h3>
                         </div>
                         <div class="happy-customers">
                             <div class="percent"></div>
                         </div>
                         <div class="value-progress">
                             + 54 Today
                         </div>
                     </div>
                 </div>
                 <div class="widget widget-21 has-shadow">
                     <div class="widget-body h-100 d-flex align-items-center">
                         <div class="section-title">
                             <h3>여자</h3>
                         </div>
                         <div class="hit-rate">
                             <div class="percent"></div>
                         </div>
                         <div class="value-progress text-green">
                             + 54 Today
                         </div>
                     </div>
                 </div>
             </div>
             <div class="col-xl-6 col-md-6 os-animation" data-os-animation="fadeInUp">
                 <!-- Begin Widget 04 -->
                 <div class="widget widget-04 has-shadow">
					<div class="widget has-shadow">
                        <div class="widget-header bordered no-actions d-flex align-items-center">
                            <h4>나이별 차트</h4>
                        </div>
                        <div class="widget-body">
                            <div class="chart">
                                <canvas id="doughnut-chart"></canvas>
                            </div>
                        </div>
                    </div>
                 </div>
                 <!-- End Widget 04 -->
             </div>
         </div>
         <!-- End Row -->
         
         <div class="row flex-row">
             <div class="col-xl-12 os-animation" data-os-animation="fadeInUp">
                 <!-- Begin Widget 07 -->
                 <div class="widget widget-07 has-shadow">
                     <!-- Begin Widget Header -->
                     <div class="widget-header bordered d-flex align-items-center">
                         <h2>1:1 게시판</h2>
                         <div class="widget-options">
                             <div class="btn-group" role="group">
                                 <button type="button" class="btn btn-primary ripple">Week</button>
                                 <button type="button" class="btn btn-primary ripple">Month</button>
                             </div>
                         </div>
                     </div>
                     <!-- End Widget Header -->
                     <!-- Begin Widget Body -->
                     <div class="widget-body">
                         <div class="table-responsive table-scroll padding-right-10" style="max-height:520px;">
                             <table class="table table-hover mb-0">
                                 <thead>
                                     <tr>
                                         <th>
                                             <div class="styled-checkbox mt-2">
                                                 <input type="checkbox" name="check-all" id="check-all">
                                                 <label for="check-all"></label>
                                             </div>
                                         </th>
                                         <th>Order ID</th>
                                         <th>Customer Name</th>
                                         <th>Country</th>
                                         <th>Ship Date</th>
                                         <th><span style="width:100px;">Status</span></th>
                                         <th>Order Total</th>
                                         <th>Actions</th>
                                     </tr>
                                 </thead>
                                 <tbody>
                                     <tr>
                                         <td style="width:5%;">
                                             <div class="styled-checkbox mt-2">
                                                 <input type="checkbox" name="cb1" id="cb1">
                                                 <label for="cb1"></label>
                                             </div>
                                         </td>
                                         <td><span class="text-primary">054-01-FR</span></td>
                                         <td>Lori Baker</td>
                                         <td>US</td>
                                         <td>10/21/2017</td>
                                         <td><span style="width:100px;"><span class="badge-text badge-text-small info">Paid</span></span></td>
                                         <td>$139.45</td>
                                         <td class="td-actions">
                                             <a href="#"><i class="la la-edit edit"></i></a>
                                             <a href="#"><i class="la la-close delete"></i></a>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td style="width:5%;">
                                             <div class="styled-checkbox mt-2">
                                                 <input type="checkbox" name="cb2" id="cb2">
                                                 <label for="cb2"></label>
                                             </div>
                                         </td>
                                         <td><span class="text-primary">021-12-US</span></td>
                                         <td>Lawrence Crawford</td>
                                         <td>FR</td>
                                         <td>10/21/2017</td>
                                         <td><span style="width:100px;"><span class="badge-text badge-text-small info">Paid</span></span></td>
                                         <td>$189.00</td>
                                         <td class="td-actions">
                                             <a href="#"><i class="la la-edit edit"></i></a>
                                             <a href="#"><i class="la la-close delete"></i></a>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td style="width:5%;">
                                             <div class="styled-checkbox mt-2">
                                                 <input type="checkbox" name="cb3" id="cb3">
                                                 <label for="cb3"></label>
                                             </div>
                                         </td>
                                         <td><span class="text-primary">189-01-RU</span></td>
                                         <td>Samuel Walker</td>
                                         <td>AU</td>
                                         <td>08/21/2017</td>
                                         <td><span style="width:100px;"><span class="badge-text badge-text-small danger">Failed</span></span></td>
                                         <td>$107.55</td>
                                         <td class="td-actions">
                                             <a href="#"><i class="la la-edit edit"></i></a>
                                             <a href="#"><i class="la la-close delete"></i></a>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td style="width:5%;">
                                             <div class="styled-checkbox mt-2">
                                                 <input type="checkbox" name="cb4" id="cb4">
                                                 <label for="cb4"></label>
                                             </div>
                                         </td>
                                         <td><span class="text-primary">092-06-FR</span></td>
                                         <td>Angela Walters</td>
                                         <td>US</td>
                                         <td>08/21/2017</td>
                                         <td><span style="width:100px;"><span class="badge-text badge-text-small success">Delivered</span></span></td>
                                         <td>$129.85</td>
                                         <td class="td-actions">
                                             <a href="#"><i class="la la-edit edit"></i></a>
                                             <a href="#"><i class="la la-close delete"></i></a>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td style="width:5%;">
                                             <div class="styled-checkbox mt-2">
                                                 <input type="checkbox" name="cb5" id="cb5">
                                                 <label for="cb5"></label>
                                             </div>
                                         </td>
                                         <td><span class="text-primary">021-09-US</span></td>
                                         <td>Ryan Hanson</td>
                                         <td>ES</td>
                                         <td>07/21/2017</td>
                                         <td><span style="width:100px;"><span class="badge-text badge-text-small info">Paid</span></span></td>
                                         <td>$199.95</td>
                                         <td class="td-actions">
                                             <a href="#"><i class="la la-edit edit"></i></a>
                                             <a href="#"><i class="la la-close delete"></i></a>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td style="width:5%;">
                                             <div class="styled-checkbox mt-2">
                                                 <input type="checkbox" name="cb6" id="cb6">
                                                 <label for="cb6"></label>
                                             </div>
                                         </td>
                                         <td><span class="text-primary">054-01-FR</span></td>
                                         <td>Evelyn Black</td>
                                         <td>FR</td>
                                         <td>10/21/2017</td>
                                         <td><span style="width:100px;"><span class="badge-text badge-text-small info">Paid</span></span></td>
                                         <td>$139.45</td>
                                         <td class="td-actions">
                                             <a href="#"><i class="la la-edit edit"></i></a>
                                             <a href="#"><i class="la la-close delete"></i></a>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td style="width:5%;">
                                             <div class="styled-checkbox mt-2">
                                                 <input type="checkbox" name="cb7" id="cb7">
                                                 <label for="cb7"></label>
                                             </div>
                                         </td>
                                         <td><span class="text-primary">021-12-US</span></td>
                                         <td>James Morris</td>
                                         <td>EN</td>
                                         <td>10/21/2017</td>
                                         <td><span style="width:100px;"><span class="badge-text badge-text-small info">Paid</span></span></td>
                                         <td>$189.00</td>
                                         <td class="td-actions">
                                             <a href="#"><i class="la la-edit edit"></i></a>
                                             <a href="#"><i class="la la-close delete"></i></a>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td style="width:5%;">
                                             <div class="styled-checkbox mt-2">
                                                 <input type="checkbox" name="cb8" id="cb8">
                                                 <label for="cb8"></label>
                                             </div>
                                         </td>
                                         <td><span class="text-primary">189-01-RU</span></td>
                                         <td>Valentin H.</td>
                                         <td>AU</td>
                                         <td>08/21/2017</td>
                                         <td><span style="width:100px;"><span class="badge-text badge-text-small danger">Failed</span></span></td>
                                         <td>$107.55</td>
                                         <td class="td-actions">
                                             <a href="#"><i class="la la-edit edit"></i></a>
                                             <a href="#"><i class="la la-close delete"></i></a>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td style="width:5%;">
                                             <div class="styled-checkbox mt-2">
                                                 <input type="checkbox" name="cb9" id="cb9">
                                                 <label for="cb9"></label>
                                             </div>
                                         </td>
                                         <td><span class="text-primary">092-06-FR</span></td>
                                         <td>Beverly Matthews</td>
                                         <td>RU</td>
                                         <td>08/21/2017</td>
                                         <td><span style="width:100px;"><span class="badge-text badge-text-small info">Paid</span></span></td>
                                         <td>$129.85</td>
                                         <td class="td-actions">
                                             <a href="#"><i class="la la-edit edit"></i></a>
                                             <a href="#"><i class="la la-close delete"></i></a>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td style="width:5%;">
                                             <div class="styled-checkbox mt-2">
                                                 <input type="checkbox" name="cb10" id="cb10">
                                                 <label for="cb10"></label>
                                             </div>
                                         </td>
                                         <td><span class="text-primary">021-09-US</span></td>
                                         <td>Jeffrey Arnold</td>
                                         <td>US</td>
                                         <td>07/21/2017</td>
                                         <td><span style="width:100px;"><span class="badge-text badge-text-small info">Paid</span></span></td>
                                         <td>$199.95</td>
                                         <td class="td-actions">
                                             <a href="#"><i class="la la-edit edit"></i></a>
                                             <a href="#"><i class="la la-close delete"></i></a>
                                         </td>
                                     </tr>
                                 </tbody>
                             </table>
                         </div>
                     </div>
                     <!-- End Widget Body -->
                     <!-- Begin Widget Footer -->
                     <div class="widget-footer d-flex align-items-center">
                         <div class="mr-auto p-2">
                             <span class="display-items">Showing 1-30 / 150 Results</span>
                         </div>
                         <div class="p-2">
                             <nav aria-label="...">
                                 <ul class="pagination justify-content-end">
                                     <li class="page-item disabled">
                                         <span class="page-link"><i class="ion-chevron-left"></i></span>
                                     </li>
                                     <li class="page-item"><a class="page-link" href="#">1</a></li>
                                     <li class="page-item active">
                                         <span class="page-link">2<span class="sr-only">(current)</span></span>
                                     </li>
                                     <li class="page-item"><a class="page-link" href="#">3</a></li>
                                     <li class="page-item">
                                         <a class="page-link" href="#"><i class="ion-chevron-right"></i></a>
                                     </li>
                                 </ul>
                             </nav>
                         </div>
                     </div>
                     <!-- End Widget Footer -->
                 </div>
                 <!-- End Widget 07 -->
             </div>
         </div>
     </div>
</div>

<script>
(function(c) {
    c(".dropdown-menu a.dropdown-toggle").on("click", function(d) {
        if (!c(this).next().hasClass("show")) {
            c(this).parents(".dropdown-menu").first().find(".show").removeClass("show")
        }
        var f = c(this).next(".dropdown-menu");
        f.toggleClass("show");
        c(this).parents("li.nav-item.dropdown.show").on("hidden.bs.dropdown", function(g) {
            c(".dropdown-submenu .show").removeClass("show")
        });
        return false
    });
    c(".hit-rate").circleProgress({
        value: 0.15,
        size: 140,
        startAngle: -Math.PI / 2,
        thickness: 6,
        lineCap: "round",
        emptyFill: "#f0eff4",
        fill: {
            gradient: ["#e76c90", "#e76c90"]
        }
    }).on("circle-animation-progress", function(e, d) {
        c(this).find(".percent").html(Math.round(15 * d) + "<i>%</i>")
    });
    c(".happy-customers").circleProgress({
        value: 0.85,
        size: 140,
        startAngle: -Math.PI / 2,
        thickness: 6,
        lineCap: "round",
        emptyFill: "rgba(255, 255, 255, 0.15)",
        fill: {
            gradient: ["#fff", "#fff"]
        }
    }).on("circle-animation-progress", function(e, d) {
        c(this).find(".percent").html(Math.round(85 * d) + "<i>%</i>")
    });
    var a = document.getElementById("sales-stats").getContext("2d");
    var b = new Chart(a, {
        type: "line",
        data: {
            labels: ["02/10", "02/11", "02/12", "02/13", "02/14", "02/15"],
            datasets: [{
                label: "Sales",
                borderColor: "#08a6c3",
                pointRadius: 0,
                pointHitRadius: 5,
                pointHoverRadius: 3,
                pointHoverBorderColor: "#08a6c3",
                pointHoverBackgroundColor: "#08a6c3",
                pointHoverBorderWidth: 3,
                fill: true,
                backgroundColor: "#fff",
                borderWidth: 3,
                data: [10, 6, 14, 8, 12, 10]
            }]
        },
        options: {
            tooltips: {
                backgroundColor: "rgba(47, 49, 66, 0.8)",
                titleFontSize: 13,
                titleFontColor: "#fff",
                caretSize: 0,
                cornerRadius: 4,
                xPadding: 5,
                displayColors: false,
                yPadding: 5,
            },
            layout: {
                padding: {
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0
                }
            },
            legend: {
                display: false
            },
            scales: {
                yAxes: [{
                    ticks: {
                        display: false,
                        beginAtZero: false,
                        maxTicksLimit: 2,
                    },
                    gridLines: {
                        drawBorder: false,
                        display: false
                    }
                }],
                xAxes: [{
                    gridLines: {
                        drawBorder: false,
                        display: false
                    },
                    ticks: {
                        display: false
                    }
                }]
            }
        }
    });
    var a = document.getElementById("doughnut-chart").getContext("2d");
	var b = new Chart(a, {
		type : "doughnut",
		data : {
			labels : [ "Blue", "Green", "Red" ],
			datasets : [ {
				label : "Label",
				backgroundColor : [ "#08a6c3", "#5cb85c", "#d9534f" ],
				hoverBorderColor : [ "#fff", "#fff", "#fff" ],
				borderColor : [ "#fff", "#fff", "#fff" ],
				borderWidth : 10,
				data : [ 2478, 4268, 1265 ]
			} ]
		},
		options : {
			legend : {
				display : true,
				position : "top",
				labels : {
					fontColor : "#2e3451",
					usePointStyle : true,
					fontSize : 13
				}
			},
			tooltips : {
				backgroundColor : "rgba(47, 49, 66, 0.8)",
				titleFontSize : 13,
				titleFontColor : "#fff",
				caretSize : 0,
				cornerRadius : 4,
				xPadding : 10,
				displayColors : true,
				yPadding : 10
			}
		}
	});
})(jQuery);
</script>
