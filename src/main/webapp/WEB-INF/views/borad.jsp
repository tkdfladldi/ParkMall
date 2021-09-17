<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<head>
<style type="text/css">

ul li {list-style-type: none; float: left;
margin: 5px;
}
a {
	text-decoration: none;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
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
        <!-- Header-->
        <header class="bg-primary bg-gradient text-white">
            <div class="container px-4 text-center">
                <h1 class="fw-bolder">자유게시판</h1>
                <a class="btn btn-lg btn-light" href="/boradForm">글쓰기</a>
            </div>
        </header>
        <!-- About section-->
 <table class="table table-striped table-hover">
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>이름</th>
        <th>작성일</th>
    </tr>
     <c:if test="${borad_list != null }">
    <c:forEach var="borad_list" items="${borad_list}">
    <tr>
        <td>${borad_list.borad_id}</td>
        <td><a href="${path}/boradContent/${borad_list.borad_id}">${borad_list.borad_title}</a></td>
        <td>${borad_list.borad_name}</td>
       <td>
            <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
            <fmt:formatDate pattern="yyyy년MM월dd일  hh시mm분ss초" value="${borad_list.borad_time}"/>
        </td>
    </tr>    
    </c:forEach> 
     </c:if> 
     
     <c:if test="${searchList != null }">
    <c:forEach var="searchList" items="${searchList}">
    <tr>
        <td>${searchList.borad_id}</td>
        <td><a href="${path}/boradContent/${searchList.borad_id}">${searchList.borad_title}</a></td>
        <td>${searchList.borad_name}</td>
       <td>
            <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
            <fmt:formatDate pattern="yyyy년MM월dd일  hh시mm분ss초" value="${searchList.borad_time}"/>
        </td>
    </tr>    
    </c:forEach> 
     </c:if> 
     
</table>
		<c:set var="page" value="${(param.p == null)?1:param.p}"/>
		<c:set var="startNum" value="${page-(page-1)%5}" />
	
			<c:if test="${startNum > 5}">
       			<a data-value="${startNum-1}" class= "previousPage" href="#">이전</a>
       		</c:if>
		<ul>
		
		<c:forEach var="i" begin="0" end="4">
       		<li><a data-value="${startNum+i}" class="page" href="#">${startNum+i}</a></li>
       	</c:forEach>
       	</ul>
       		
      	 	 <c:if test="${not empty borad_list}">	
       			<a data-value="${startNum+5}" class= "nextPage" href="#">다음</a>
       		</c:if>
 
        <!-- Services section-->
        <section class="bg-light" id="services">
            <div class="container px-4">
                <div class="row gx-4 justify-content-center">
                    <div class="col-lg-8">
                    <select name="searchType" >
		     <option>---</option>
		      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
		      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
		      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
		      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
		    </select>
		
		    <input type="text" name="keyword" id="keywordInput" value="${searchCriteria.keyword}"/>
		    <button id="searchBtn" type="button">검색</button> <br>
		     <button style="background-color: white; font-size: 15;" onclick="location.href='/mainPage'">나가기</button>
		   
		    <script>
		    $(function(){
		        $('.previousPage').click(function() {
		        	var value = $(this).attr('data-value');
		        	 self.location = "borad?"+"p="+ value +"&searchType=${searchCriteria.searchType}" + "&keyword=${searchCriteria.keyword}" ;
		        });
		      }); 
		    $(function(){
		        $('.nextPage').click(function() {
		        	var value = $(this).attr('data-value');
		        	 self.location = "borad?"+"p="+ value +"&searchType=${searchCriteria.searchType}" + "&keyword=${searchCriteria.keyword}" ;
		        });
		      }); 
		    
		    $(function(){
		        $('.page').click(function() {
		        	var value = $(this).attr('data-value');
		        	 self.location = "borad?"+"p="+ value +"&searchType=${searchCriteria.searchType}" + "&keyword=${searchCriteria.keyword}" ;
		        });
		      }); 
		        
		      $(function(){
		        $('#searchBtn').click(function() {
		          self.location = "borad?"+"p=1" + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		        });
		      });   
		    </script>
                        </div>
                </div>
            </div>
        </section>
        <!-- Contact section-->
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container px-4"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/bo_js/scripts.js"></script>
    </body>
</html>
