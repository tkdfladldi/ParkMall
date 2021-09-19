<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<title>자유게시판</title>
<style>
h2{
	 text-align: center; 
}

body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>
</head>


        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/bo_css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
            <div class="container px-4">
                <a class="navbar-brand" href="/mainPage">박사장몰</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                   		<c:if test="${member.id == null}">
                        <li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
                        </c:if>
                        <c:if test="${member.id != null}">
                        <li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
                        </c:if>
                        <li class="nav-item"><a class="nav-link" href="/shopping">쇼핑하기</a></li>
                        <li class="nav-item"><a class="nav-link" href="/echo/chat">채팅방</a></li>
                    </ul>
                </div>
            </div>
        </nav>

<body>
	<article>

		<div class="container" role="main">
			<br><h2>글쓰기</h2>
			<form name="form" id="form" role="form" method="post" action="boradForm">
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="borad_title" id="title" placeholder="제목을 입력해 주세요">
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="borad_contents" id="content" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<input type="text" name ="borad_name" class="form-control" value="${member.id}" readonly/>
				</div>
				<div >
				<button class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='/borad?p=1&'">목록</button>
			 </div>			
			</form>
		</div>
	</article>
	<script type="text/javascript">
$("#btnSave").on("click", function(){
	if($("#title").val()==""){
		alert("제목을 입력해주세요.");
		$("#title").focus();
		return false;
	}
});
</script>
</body>
</html>
