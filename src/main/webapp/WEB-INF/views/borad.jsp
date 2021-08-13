<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
<script>
</script>
<style type="text/css">
ul li {list-style-type: none; float: left;
margin: 5px;
}
a{
text-decoration : none;
}
.aClass{
position: fixed;
margin: 10px;
border: 10px;
top: 270px;
}


</style>
</head>
<body>

<h2>자유게시판</h2>
<button type="button" id="btnWrite" onclick="location.href='/boradForm'">글쓰기</button>
<table border="1" width="600px">
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>이름</th>
        <th>작성일</th>
    </tr>
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
   		 
</table>
	<c:set var="page" value="${(param.p == null)?1:param.p}"/>
	<c:set var="startNum" value="${page-(page-1)%5}" />
	
			<c:if test="${startNum > 5}">
       		<a class= "aClass" href="?p=${startNum-1}&">이전</a>
       		</c:if>
		<ul>
		
		<c:forEach var="i" begin="0" end="4">
       		<li><a href="?p=${startNum+i}&">${startNum+i}</a></li>
       	</c:forEach>
       	</ul>
      	 	 <c:if test="${not empty borad_list}">	
       		<a href="?p=${startNum+5}&">다음</a>
       		</c:if>
       		<button style="position: fixed; left: 200px; top: 300px; background-color: white; font-size: 15;" onclick="location.href='/mainPage'">나가기</button>
</body>
</html>
