<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<script>
</script>
</head>
<body>

<h2>게시글 목록</h2>
<button type="button" id="btnWrite">글쓰기</button>
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
        <td><a href="${path}/board/view.do?bno=${borad_list.borad_title}">${borad_list.borad_title}</a></td>
        <td>${borad_list.borad_name}</td>
       <td>
            <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
          ${borad_list.borad_time}
        </td>
    </tr>    
    </c:forEach>
</table>
</body>
</html>
