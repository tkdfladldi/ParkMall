<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<!-- 장바구니안에서 새로고침 누르면 하나씩 생기는 버그를 새로고침을 막고 방지하기 -->
<script>
function doNotReload(){
    if(    (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82))
        || (event.keyCode == 116) )
    {
      event.keyCode = 0;
      event.cancelBubble = true;
      event.returnValue = false;
 alert("새로고침 방지");
    }
}
document.onkeydown = doNotReload;
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>
</head>
<body>

    <h2>장바구니 <button onclick="location.href='/shopping'">쇼핑하러가기</button></h2>
    <table border="1">
        <tr>
            <th>상품ID번호</th>
            <th>상품이미지</th>
            <th>상품명</th>
            <th>수량</th>
            <th>가격</th>
        </tr>
         <c:forEach var="cartItem" items="${cartList}" varStatus="Status">
        <tr>
            <td>
                ${cartItem.product_id}
            </td>
            <td>
                <a href="${path}/nike_shoesChk/${cartItem.product_id}">
                    <img src="../resources/assets/img/portfolio/${cartItem.product_url}" width="120ox" height="110px">
                </a>
            </td>
             <td>
                <a href="${pageContext.request.contextPath}/nike_shoesChk/${cartItem.product_id}">${cartItem.product_name}</a>
            </td>
            <td>
            		${cartItem.product_amount}
            </td>
            <td>
                <fmt:formatNumber value="${cartItem.product_price}" pattern="###,###,###"/>
            </td>
            <td>
            <button onclick="location.href='/cartDelet/${Status.index}'">삭제</button>
            </td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>