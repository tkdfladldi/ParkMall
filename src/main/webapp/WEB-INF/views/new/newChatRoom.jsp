<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!DOCTYPE html>

<c:if test="${member.id != null}">
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>채팅방 생성</title>
        <link href="/resources2/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">채팅방 생성</h3></div>
                                    <div class="card-body">
                                        <form id="form">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="inputName" id="inputName" type="text" placeholder="Enter your first name" />
                                                        <label for="inputFirstName">방이름</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <select id="people" name="people">
                                                        <option>최대인원</option>
					                  					  <c:forEach begin="1" end="12" var="i">
						                                        <option value="${i}">${i} 명</option>
						                                  </c:forEach>
                                                        </select>
                                                        <select name="category" id="category">
                                                        <option>카테고리</option>
                                                        <option>코딩</option>
                                                        <option>학생</option>
                                                        <option>취업</option>
                                                        <option>잡담</option>
                                                        <option>공부</option>
                                                        </select>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="inputPassword" id="inputPassword" type="password" placeholder="Create a password" />
                                                        <label for="inputPassword">비밀번호</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-4 mb-0">
                                               <div class="d-grid"><a class="btn btn-primary btn-block" onclick="submit();" href="#">방만들기</a></div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources2/js/scripts.js"></script>
    </body>
</html>
</c:if>
<script>
function submit() {
	 var inputName= $("#inputName").val();
	 var people = $("#people").val();
	 var category = $("#category").val();
	 var inputPassword = $("#inputPassword").val();
	 
	 if(inputName == '' || inputName == null){
		 alert("방이름을 입력해주세요.");
		 return false;
	 }else if(inputName.length > 30 ){
		 alert("방이름의 길이가 적합하지 않습니다.");
		 return false;
	 }
	 
	 if(people == "최대인원"){
		 alert("방 인원 수를 설정해주세요.");
		 return false;
	 }
	 if(category == "카테고리"){
		 alert("카테고리를 설정해주세요.");
		 return false;
	 }
	 if(inputPassword !== ""){
		 if(inputPassword.length > 10){
			 alert("비밀번호는 최소 4 ~ 10 자리를 입력해주세요");
			 return false;
		 }else if(inputPassword.length < 4){
			 alert("비밀번호는 최소 4 ~ 10 자리를 입력해주세요");
			 return false;
		 }
		 
	 }
	 
	 var myForm = document.getElementById("form");
	 myForm.setAttribute("charset", "UTF-8");
	 myForm.setAttribute("method", "Post");
	 myForm.setAttribute("action", "/chatRoom");
	 
	 
	 myForm.submit();
	 
}
</script>

