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
<script>
	
</script>
<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>
</head>

<body>
	<article>

		<div class="container" role="main">
			<h2>글쓰기</h2>
			<form name="form" id="form" role="form" method="post" action="/boradUpdate">			
				<input type="hidden" name="borad_id" value="${boradContent.borad_id}"/>
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="borad_title" id="title" value="${boradContent.borad_title}">
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="borad_contents" id="content">${boradContent.borad_contents}</textarea>
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
</body>
</html>