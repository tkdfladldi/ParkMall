<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세정보</title>
<head profile="http://www.w3.org/2005/10/profile">
<link rel="icon" type="image/png" href="http://example.com/myicon.png"> 
</head>
<body>
    <h2>상품 상세정보</h2>
    <table border="1">
        <tr>
            <td>
            <td> 
				<img src="../resources/assets/img/portfolio/${vo.product_url}" width="120ox" height="110px">
            </td>
            <td>
                <table border="1" style="height: 300px; width: 400px;">
                    <tr align="center">
                        <td>상품명</td>
                        <td>${vo.product_name}</td>
                    </tr>
                    <tr align="center">
                        <td>가격</td>
                        <td><fmt:formatNumber value="${vo.product_price}" pattern="###,###,###"/></td>
                    </tr>
                    <tr align="center">
                        <td>상품소개</td>
                        <td>${vo.product_desc}</td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <form name="form1" method="post" action="${path}/cart">
                                <input type="hidden" name="product_id" value="${vo.product_id}">
                                <select name="amount">
                                    <c:forEach begin="1" end="100" var="i">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </select>&nbsp;개
                                <input type="submit" value="장바구니에 담기">
                            </form>
                            <a href="${pageContext.request.contextPath}/nike_shoes">상품목록</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        
    </table>
</body>
</html>