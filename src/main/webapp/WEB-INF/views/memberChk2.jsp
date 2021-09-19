<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 추가할부분 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<title>박사장몰</title>
</head>
 <link href="${pageContext.request.contextPath}/resources/review_css/styles.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/review_css/styles.css" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/review_css/styles.css" rel="stylesheet" />
<style>
 h2 {
 padding: 30px;
 text-align: center; 
 }
</style>
<script type="text/javascript">
</script>

<body>
	<div class="container">
	<div class="row">
	<br>	<h2>회원정보</h2> <br>
		
		
  <form class="form-horizontal" >
		<fieldset>

<!-- Form Name -->

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">아이디</label>  
  <div class="col-md-4">
  <input id="textinput" name="id"  placeholder="${member.id}" class="form-control input-md" required="" type="text">
  <span class="help-block"> </span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">패스워드</label>  
  <div class="col-md-4">
  <input id="textinput" name="pw"  class="form-control input-md" type="password" value="${member.pw}" required>
  <span class="help-block"> </span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">이름</label>  
  <div class="col-md-4">
  <input id="textinput" name="name"  placeholder="${member.name}" class="form-control input-md" required="" type="text">
  <span class="help-block"> </span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">핸드폰번호</label>  
  <div class="col-md-4">
  <input id="textinput" name="phone"  placeholder="${member.phone}" class="form-control input-md" required="" type="text">
  <span class="help-block"> </span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">이메일</label>  
  <div class="col-md-4">
  <input id="textinput" name="email"  placeholder="${member.email}" class="form-control input-md" required="" type="email">
  <span class="help-block"> </span>  
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"> </label>
  <div class="col-md-4">
    <button id="singlebutton" name="singlebutton" class="btn btn-primary" onclick="location.href='/memberPassChange'">비밀번호 변경하기</button>
     <div id="register-link" class="text-right">
     <c:if test="${member.id eq 'tkdfladldi'}">
     <a class="btn btn-primary" href="/admin">관리자 페이지 이동</a>
     </c:if>
                                <button class="btn btn-primary" onclick="history.back()">취소</button>
                            </div>
  </div>
   
</div>


</fieldset>
</form>

	</div>
</div>
             <!-- Bootstrap core JS-->
        <script src="/resources/review_js/scripts.js"></script>
        <!-- Core theme JS-->
       <script src="/resources/review_js/scripts.js"></script>
</body>
</html>