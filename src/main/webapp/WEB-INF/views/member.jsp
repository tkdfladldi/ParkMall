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

function fn_idChk(){
	$.ajax({
		url : "/idchk",
		type : "post",
		dataType : "json",
		data : {"id" : $("#textinput").val()},
		success : function(data){
			if(data == 1){
				alert("중복된 아이디입니다.");
			}else if(data == 0){
				$("#idChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		}
	})
}
</script>

<body>
	<div class="container">
	<div class="row">
		<h2>회원가입</h2> 
        
        <form action="insertMember" class="form-horizontal" method="post">
<fieldset>

<!-- Form Name -->

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">아이디</label>  
  <div class="col-md-4">
  <input id="textinput" name="id"  placeholder="아이디" class="form-control input-md" required="" type="text">
  <span class="help-block"> </span>  
  <button class="fnidChk" type="button" id=idChk onclick="fn_idChk();" value="N">중복확인</button>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">패스워드</label>  
  <div class="col-md-4">
  <input id="textinput" name="pw"  placeholder="패스워드" class="form-control input-md" required="" type="password">
  <span class="help-block"> </span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">이름</label>  
  <div class="col-md-4">
  <input id="textinput" name="name"  placeholder="이름" class="form-control input-md" required="" type="text">
  <span class="help-block"> </span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">핸드폰번호</label>  
  <div class="col-md-4">
  <input id="textinput" name="phone"  placeholder="핸드폰번호" class="form-control input-md" required="" type="text">
  <span class="help-block"> </span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">이메일</label>  
  <div class="col-md-4">
  <input id="textinput" name="email"  placeholder="이메일" class="form-control input-md" required="" type="email">
  <span class="help-block"> </span>  
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"> </label>
  <div class="col-md-4">
    <button id="singlebutton" name="singlebutton" class="btn btn-primary">완료</button>
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