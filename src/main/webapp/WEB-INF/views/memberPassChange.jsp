<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 추가할부분 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<title>박사장몰</title>
</head>
<script type="text/javascript">


</script>
<body>
	<div class="container">
	<div class="row">
		<h2>비밀번호 변경</h2> 
        <form action="memberPassChange" class="form-horizontal" method="post">
<fieldset>



<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">현재 패스워드</label>  
  <div class="col-md-4">
  <input id="memberPass" name="pw"  placeholder="현재 패스워드" class="form-control input-md" required="" type="password">
  <span class="help-block"> </span>  
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">새 비밀번호</label>  
  <div class="col-md-4">
  <input id="textinput" name="phone"  placeholder="새 패스워드" class="form-control input-md" required="" type="password">
  <span class="help-block"> </span>  
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">새 비밀번호 확인</label>  
  <div class="col-md-4">
  <input id="textinput" name="email"  placeholder="새 비밀번호 확인" class="form-control input-md" required="" type="password">
  <span class="help-block"> </span>  
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"> </label>
  <div class="col-md-4">
    <button id="singlebutton" name="singlebutton" class="btn btn-primary" onclick="passChange">완료</button>
     <div id="register-link" class="text-right">
                                <a href="mainPage" class="text-info">취소</a>
                            </div>
  </div>
   
</div>



</fieldset>
</form>

	</div>
</div>

</body>
</html>