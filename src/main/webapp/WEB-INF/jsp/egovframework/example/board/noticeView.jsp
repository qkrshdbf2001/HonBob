<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<script>
function doImgPop(img){
	 img1= new Image();
	 img1.src=(img);
	 imgControll(img);
}
 
function imgControll(img){
	 if((img1.width!=0)&&(img1.height!=0)){
	    viewImage(img);
	  }
	  else{
	     controller="imgControll('"+img+"')";
	     intervalID=setTimeout(controller,20);
	  }
}

function viewImage(img){
	 W="1000px";
	 H="560px";
	 O="width="+W+",height="+H+",scrollbars=yes";
	 imgWin=window.open("","",O);
	 imgWin.document.write("<html><head><title>:*:*:*: 이미지상세보기 :*:*:*:*:*:*:</title></head>");
	 imgWin.document.write("<body topmargin=0 leftmargin=0>");
	 imgWin.document.write("<img style='width:1000px;height:560px' src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
	 imgWin.document.close();
}
</script>
<div class="page-content">
        <div class="holder mt-0">
            <div class="container">
                <ul class="breadcrumbs">
                    <li><a href="index.html">Home</a></li>
                    <li><span>About Us</span></li>
                    <li><span>${notice.ncode}</span></li>
                </ul>
            </div>
        </div>
        <div class="holder mt-0" style="background-image:url(images/pages/about-text-bg.jpg)">
            <div class="container">
				<h2>공지사항</h2>
	            <table class="table table-striped">
					<tr>
						<td>제목</td>
						<td>${notice.ntitle}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>${notice.ncontent}</td>
					</tr>
					<tr>
						<td>이미지</td>
						<td>
							<c:forEach var="imgList" items="${imgList}">
								<img alt="공지이미지입니다" style="width: 200px;" src="upload/${imgList.nimage}" onclick="doImgPop('upload/${imgList.nimage}')">
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td>등록날짜</td>
						<td>${notice.nregdate}</td>
					</tr>
					<tr>
						<td>조회수</td>
						<td>${notice.views}</td>
					</tr>
					
               </table>
	           <hr />
	            <a href="notice.do" class="btn btn-default pull-right" style="color:white">목록</a>
               </div>
            </div>
        </div>
    </div>