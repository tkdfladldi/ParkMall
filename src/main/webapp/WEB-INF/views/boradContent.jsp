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
h2{
text-align: center;
}
#label{
 font-size: 20px;
}

body {
	padding-top: 70px;
	padding-bottom: 30px;
}

.board_title {
	font-weight : 600;
	font-size : 22pt;
	margin : 5pt;
}

.board_info_box {
	color : #6B6B6B;
	margin : 10pt;
}

.board_author {
	font-size : 15pt;
	margin-right : 10pt;
}

.board_date {
	font-size : 15pt;
}

.board_content {
	color : #444343;
	font-size : 12pt;
	margin : 10pt;
}
.replyUpdate{
	padding: .25rem .5rem;
    font-size: .875rem;
    line-height: 1.5;
    border-radius: .2rem;
	color: #fff;
    background-color: #007bff;
    border-color: #007bff;

}
.replyDelet{
	padding: .25rem .5rem;
    font-size: .875rem;
    line-height: 1.5;
    border-radius: .2rem;
	color: #fff;
    background-color: #007bff;
    border-color: #007bff;

}
.board_tag {
	font-size : 11pt;
	margin : 10pt;
	padding-bottom : 10pt;
}

</style>
<meta charset="UTF-8">

</head>
<script>

function editReply(reg_id,borad_id,reg_content,memberId,replyName){
	if(memberId==replyName){
	$('.content'+reg_id).html(
			"<textarea id ='edit_content"+reg_id+"'>"+reg_content+"</textarea>"
	+"<style>#edit_content"+reg_id+"{width:740px; resize:none;}</style>"		
	);
	$('#idReplyUpdate'+reg_id).html(
			"<a onclick='insertEditSave("+reg_id+','+borad_id+")' id='btnEdit'>완료</a>"
	);
	}else if(memberId != replyName){
		alert("댓글 작성자만 삭제 할 수 있습니다.")
	}
}
	function insertEditSave(reg_id,borad_id){
		var acontent = $("#edit_content"+reg_id).val();	
	  location.href='/boradContent/replyUpdate?reg_id='+reg_id+"&borad_id="+borad_id+"&reg_content="+acontent; 
		
	}



</script>
<title>박사장몰</title>
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

			<h2>게시글</h2>
			<div class="bg-white rounded shadow-sm">

				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="borad_title" id="title" value="${boradContent.borad_title}" readonly>
				</div>
				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<input type="text" name ="borad_name" class="form-control" value="${member.id}" readonly/>
				</div>

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="borad_contents" id="content" readonly>${boradContent.borad_contents}</textarea>
				</div>
          

			</div>
			작성날짜 : 
            <fmt:formatDate pattern="yyyy년MM월dd일  hh시mm분ss초" value="${boradContent.borad_time}"/>
			
			<div style="margin-top : 20px">
				<c:if test="${member.id eq boradContent.borad_name}">
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate" onclick="location.href='/boradUpdate/${boradContent.borad_id}'">수정</button>

				<button type="button" class="btn btn-sm btn-primary" id="btnDelete" onclick="location.href='/boradDelete/${boradContent.borad_id}'">삭제</button>
				</c:if>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='/borad?p=1&'">목록</button>
		
			</div>
			
		</div>
		
			
	</article>
			
			<br><form style="position: absolute; left: 200px; width: 1100px; height: 70px;" 
			id="form" method="post">
				  
				   
			 <div>
				  <input type="hidden"  name="borad_id" value="${boradContent.borad_id}"/>
					    <label id="label" for="content">댓글 </label><input style= "width : 800px;height : 50px;" type="text" id="content" name="reg_content" />
				  
			 	 <button type="button" id="submit" class="replyWriteBtn">작성</button>
			  </div>
			</form>
			
			
	<c:forEach var="replyList" items="${replyList}">
			<div style="margin-top : 100px;margin-left: 200px;background-color: lightblue; width: 1100px; height: 70px;">
			
				
			        <p>
			     	   작성자 : ${replyList.reg_name}<br/>
			        </p>
			        
				<div class="content${replyList.reg_id}">
      				  <p>내용 : ${replyList.reg_content}</p>
				</div>
				
				<button type="button" class="replyUpdate" id="idReplyUpdate${replyList.reg_id}" onclick="editReply(${replyList.reg_id},${boradContent.borad_id},'${replyList.reg_content}','${member.id}','${replyList.reg_name}')">수정</button>
				
				<button type="button" class="replyDelet" id="idReplyDelet${replyList.reg_id}"data-value="${replyList.reg_id}" data-value2="${replyList.reg_name}">삭제</button>
			
			</div>
	</c:forEach>
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
		success : function(n) {
			if(n==0){
				location.reload();
				 alert("댓글 저장 완료.")
			}else if(n==1){
				alert("로그인이 필요합니다.")
			}
         }
	})
	}
)});
$(function(){
    $('.replyDelet').on("click",function () {
    	var value = $(this).attr('data-value');
    	var value2 = $(this).attr('data-value2');
	$.ajax({
		type: "post",
		url : "/boradContent/replyDelete",
		data : {"reg_id" : value ,"reg_name":value2},
		dataType: 'json',
		success : function(n) {
			if(n==1){
				alert("본인이 작성한 댓글만 삭제 할 수 있습니다.")
			}else if(n==2){
				location.reload();
				alert("댓글 삭제 완료")
			}
		}
	})
	}
)});
</script>
</html>
