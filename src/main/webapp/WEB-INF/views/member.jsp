<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>박사장몰</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/admin_vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/admin_css/sb-admin-2.min.css" rel="stylesheet">

</head>
<script type="text/javascript">

function passChk(val) {
	
	if(val.length <= 6){
	var html = "비밀번호 보안이 취약합니다.";
	$('#passMSG').text(html);
	}else{
		html = "비밀번호가 양호합니다.";
		$('#passMSG').text(html);
	}
	
	
}

function fn_idChk(){
	var valId = $('input[name=id]').val();
	
	if(valId == '' || valId == null){
		alert("아이디가 올바르지 않습니다.");
		return false
	}
	
	$.ajax({
		url : "/idchk",
		type : "post",
		dataType : "json",
		data : {"id" : $("#exampleFirstName").val()},
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
<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block">
                            <img style="height: 570px;" width="450px" src="resources/assets/img/model.jpg"/>
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                                    </div>
                           <form class="user" action="insertMember" method="post">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" name="id" class="form-control form-control-user" id="exampleFirstName"
                                            placeholder="아이디" required=""> 
                                            <button class="btn btn-primary btn-user btn-block" type="button" id=idChk onclick="fn_idChk();" value="N">아이디 중복확인</button>
                                  
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" name="pw" class="form-control form-control-user" id="exampleLastName"
                                            placeholder="패스워드" required="" onchange="passChk(this.value);">
                                            <p id="passMSG"></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="email" name="email" class="form-control form-control-user" id="exampleInputEmail"
                                        placeholder="Email Address" required="">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" name="name"   class="form-control form-control-user"
                                            id="exampleInputPassword" placeholder="이름" required="" >
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user"
                                            id="exampleRepeatPassword" name="phone" placeholder="핸드폰 번호" required="">
                                    </div>
                                </div>
                                    	<button type="submit" id="regiChk" class="btn btn-primary btn-user btn-block">회원가입 완료</button>
                            
                               
                            </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.html">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="register.html">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>

</html>