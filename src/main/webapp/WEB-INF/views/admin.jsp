<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 추가할부분 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<style>
a{
text-decoration:none;
}
</style>
<head>
<meta charset="UTF-8">
<title>박사장몰</title>
</head>
<body>
	<c:if test="${member.id eq 'tkdfladldi'}">
   <h1> 관리자 페이지</h1>
   <table border="1" width="600px">
    <tr>
        <th>신고 대상자</th>
        <th>신고 내용</th>
        <th>신고 날짜</th>
        <th>신고자</th>
    </tr>
    <c:forEach var="ReportList" items="${ReportList}">
    <tr>
        <td><a class="reportiIdChk" data-value="${ReportList.member_id}" href="#">${ReportList.member_id}</a></td>
        <td>${ReportList.report_contents}</td>
        <td>
     	    <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
            <fmt:formatDate pattern="yyyy년MM월dd일  hh시mm분ss초" value="${ReportList.report_date}"/>
        </td>
        <td>${ReportList.reporter_Id}</td>
    </tr>    
    </c:forEach> 
   </table>
   </c:if>
   
   <c:if test="${member.id ne 'tkdfladldi'}">
   		<h1>접근할수없는 권한입니다.</h1>
   </c:if>
</body>
<script type="text/javascript">
$(function(){
    $('.reportiIdChk').on("click",function () {
    	var value = $(this).attr('data-value');
	$.ajax({
		type: "post",
		url : "/admin/reportiIdChk",
		data : {"reportiIdChk" : value},
		dataType: 'json',
		success : function(reportiIdChkNum) {
			var win = window.open("", "Win", "width=500,height=250");
			win.document.write("<h1>신고대상자 :"+value+"<h1>"+"<h2>신고 누적 개수는 :<h2>"+reportiIdChkNum+"번");
		}
	})
	}
)});

</script>
</html>