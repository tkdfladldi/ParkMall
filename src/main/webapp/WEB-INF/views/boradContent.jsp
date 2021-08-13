<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>


<head>
<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">


<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}

.board_title {
	font-weight : 700;
	font-size : 22pt;
	margin : 10pt;
}

.board_info_box {
	color : #6B6B6B;
	margin : 10pt;
}

.board_author {
	font-size : 10pt;
	margin-right : 10pt;
}

.board_date {
	font-size : 10pt;
}

.board_content {
	color : #444343;
	font-size : 12pt;
	margin : 10pt;
}

.board_tag {
	font-size : 11pt;
	margin : 10pt;
	padding-bottom : 10pt;
}

</style>
<meta charset="UTF-8">

<title>자유게시판</title>
</head>
<body>
	<article>

		<div class="container" role="main">

			<h2>글 상세 페이지</h2>
			<div class="bg-white rounded shadow-sm">

				<div class="board_title"><c:out value="${boradContent.borad_title}"/></div>

				<div class="board_info_box">

					<span class="board_author"><c:out value="${boradContent.borad_name}"/>,</span><span class="board_date"><c:out value="${boradContent.borad_name}"/></span>

				</div>

				<div class="board_content">${boradContent.borad_contents}</div>

			</div>
			<div style="margin-top : 20px">

				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>

				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>

				<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='/borad?p=1&'">목록</button>

			</div>

		</div>
	</article>

</body>

</html>
