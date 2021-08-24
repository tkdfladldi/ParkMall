<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>


<head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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

				<div class="board_title"><c:out value="제목 :${boradContent.borad_title}"/></div>
				
            <fmt:formatDate pattern="yyyy년MM월dd일  hh시mm분ss초" value="${boradContent.borad_time}"/>

				<div class="board_info_box">

					<span class="board_author">작성자 :</span><span class="board_date"><c:out value="${boradContent.borad_name}"/></span>

				</div>

				<div class="board_content">내용 :${boradContent.borad_contents}</div>
				 
          

			</div>
			
			<div style="margin-top : 20px">

				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate" onclick="location.href='/boradUpdate/${boradContent.borad_id}'">수정</button>

				<button type="button" class="btn btn-sm btn-primary" id="btnDelete" onclick="location.href='/boradDelete/${boradContent.borad_id}'">삭제</button>

				<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='/borad?p=1&'">목록</button>

			</div>

		</div>
	</article>
			<form id="form" method="post">
			  <div>
			  
			   <input type="hidden"  name="borad_id" value="${boradContent.borad_id}"/>
			    <label for="content">댓글</label><input type="text" id="content" name="reg_content" />
			  </div>
			  <div>
			 	 <button type="button" id="submit" class="replyWriteBtn">작성</button>
			  </div>
			</form>
	
</body>
<script>

$(function(){
    $('#submit').on("click",function () {
        var form1 = $("#form").serialize();
	$.ajax({
		type: "post",
		url : "/boradContent/replyInsert",
		data : form1,
		dataType: 'json',
		success : function(data) {
  
         }
	})
	}
)});

</script>
</html>
