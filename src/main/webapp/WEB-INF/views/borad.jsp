<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>

<html>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
div{
margin: 30px;
border: 30px;
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
  
			
		<div class="search">
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
		  
</body>
</html>
