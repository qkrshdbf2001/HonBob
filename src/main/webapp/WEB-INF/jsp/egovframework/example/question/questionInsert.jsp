<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<script>
	function goback1() {
		location.href = "<c:url value='/main.do'/>";
	}
	
	//델리데이션 체크
	function checkForm() {
		var $title   	 = $("#title"),
			$content 	 = $("#content"),
			
		if ($title.val().length == 0) {
			alert("제목 입력해주세요.");
			$title.focus();
			return false;
		}
		
		if ($content.val().length == 0) {
			alert("내용을 입력해주세요.");
			$content.focus();
			return false;
		}
	}
	
</script>
</script>

<div class="page-content">
        <div class="holder mt-0">
            <div class="container">
                <ul class="breadcrumbs">
                    <li><a href="index.html">Home</a></li>
                    <li><span>Create account</span></li>
                </ul>
            </div>
        </div>
        <div class="holder mt-0">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-sm-8 col-md-6">
                        <h2 class="text-center">문의작성</h2>
                        <div class="form-wrapper">
                            <form id="questionField" name="questionField" action="questionInsert.do" method="post" onsubmit="return checkForm();">
                                <div class="form-group"><strong>제목</strong><br><input type="text" class="form-control" id="title" name="title"></div>
                                <div class="form-group"><strong>내용</strong><textarea class="form-control textarea--height-100" id="content" name="content" style="resize: none;"></textarea></div>
                                <div class="text-center"><button class="btn">확인</button> <button type="button" class="btn" onclick="goback1()">취소</button></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>