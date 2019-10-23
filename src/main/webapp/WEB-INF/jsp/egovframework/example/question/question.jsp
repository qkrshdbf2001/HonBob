<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>
<div class="page-content">
        <div class="holder mt-0">
            <div class="container">
                <ul class="breadcrumbs">
                    <li><a href="index.html">Home</a></li>
                    <li><span>About Us</span></li>
                </ul>
            </div>
        </div>
        <div class="holder mt-0" style="background-image:url(images/pages/about-text-bg.jpg)">
            <div class="container">
				<h2>문의</h2>
	            <table class="table table-striped">
				    <thead>
					    <tr>
						    <th>번호</th>
						    <th>제목</th>
						    <th>작성자</th>
						    <th>날짜</th>
						    <th>조회수</th>
					    </tr>
				    </thead>
					<tbody>
						<c:forEach var="question" items="${questionList}">
						<tr>
							<td>${question.icode}</td>
							<td>${question.ititle}</td>
							<td>${question.uname}</td>
							<td>${question.iregdate}</td>
							<td>${question. iviews}</td>
						</tr>
						</c:forEach>
					</tbody>		                   
	               </table>
	               
	               <hr />
	               <a href="questionInsert.do" class="btn btn-default pull-right" style="color:white">문의하기</a>
	               
	               <div class="text-center">
	               		<ul class="pagination">
	               			<li><a href="#">&#60;</a></li>
	               			<li><a href="#">1</a></li>
	               			<li><a href="#">2</a></li>
	               			<li><a href="#">3</a></li>
	               			<li><a href="#">4</a></li>
	               			<li><a href="#">5</a></li>
	               			<li><a href="#">&#62;</a></li>
	               		</ul>
	               </div>
                </div>
            </div>
        </div>
    </div>