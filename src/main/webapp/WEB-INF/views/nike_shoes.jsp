<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 목록</title>
</head>
<body>

    <h2>상품목록</h2>
    <table border="1">
        <tr>
            <th>상품ID번호</th>
            <th>상품이미지</th>
            <th>상품명</th>
            <th>가격</th>
        </tr>
        <c:forEach var="row" items="${list}">
        <tr>
            <td>
                ${row.product_id}
            </td>
            <td>
                <a href="${path}/nike_shoesChk/${row.product_id}">
                    <img src="../resources/assets/img/portfolio/${row.product_url}" width="120ox" height="110px">
                </a>
            </td>
             <td>
                <a href="${pageContext.request.contextPath}/nike_shoesChk/${row.product_id}">${row.product_name}</a>
            </td>
            <td>
                <fmt:formatNumber value="${row.product_price}" pattern="###,###,###"/>
            </td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>