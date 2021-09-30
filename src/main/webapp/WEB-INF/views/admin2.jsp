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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<body>
	<c:if test="${member.id eq 'tkdfladldi'}">
   <h3> 관리자 페이지</h3>
   <h4> 신고 목록</h4>
   <div style="width:40%; height:200px; overflow:auto">
    <table class="table table-striped table-hover">
    	
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
   </div>
   </c:if>
   
   
   <c:if test="${member.id eq 'tkdfladldi'}">
   <div>
	   <h4>회원 정보 검색</h4>
	   <input type="text" id="memberSel" placeholder="아이디 입력"></input>
	   
	   <button id="selectAdminPage" type="button">검색</button><br>
	 		<c:if test="${selectmember.id != null}">
	  			<br><h4>회원 정보</h4>
	  		<table class="table table-striped table-hover">
			   <tr>
				   	<th>
				   		아이디
				   	</th>
				   	<th>
				   		이름
				   	</th>
				   	<th>
				   		핸드폰번호
				   	</th>
				   	<th>
				   		이메일
				   	</th>
				   	<th>
				   		벤 유/무
				   	</th>
			   </tr>
			   <tr>
			   		<td>
			   			<h4>${selectmember.id}</h4>
			   		</td>
			   		<td>
			   			<h4>${selectmember.name}</h4>
			   		</td>
			   		<td>
			   			<h4>${selectmember.phone}</h4>
			   		</td>
			   		<td>
			   			<h4>${selectmember.email}</h4>
			   		</td>
			   		<td>
			   			<c:if test="${selectmember.blacklist ne 'Y'}">
			   			<br>
			   			<button type="button" id="blackList" data-value="${selectmember.id}">블랙리스트 추가</button>
			   			</c:if>
			   			<c:if test="${selectmember.blacklist eq 'Y'}">
			   			<button type="button" id="blackListDel" data-value="${selectmember.id}">블랙리스트 해제</button>
			   			</c:if>
			   			<h4>${selectmember.blacklist}</h4>
			   		</td>
			   </tr>
	   		</table>
	   		<div style="width:40%; height:800px; overflow:auto">
	   			<h4>회원 자유게시판 목록</h4>
	   			<table class="table table-striped table-hover">
				   <tr>
					   	<th>
					   		제목
					   	</th>
					   	<th>
					   		내용
					   	</th>
					   	<th>
					   		시간
					   	</th>
				   </tr>
				   <c:forEach var="memberBoard" items="${memberBoard}">
				   <tr>
				   		<td>
				   			<h4>${memberBoard.borad_title}</h4>
				   		</td>
				   		<td>
				   			<h4>${memberBoard.borad_contents}</h4>
				   		</td>
				   		<td>
				   		<fmt:formatDate pattern="yyyy년MM월dd일  hh시mm분ss초" value="${memberBoard.borad_time}"></fmt:formatDate>
				   		</td>
				   </tr>
				   </c:forEach>
	   			</table>
	   			</div>
	   			<h4>회원 리뷰 목록</h4>
	   			<div style="width:40%; height:800px; overflow:auto">
	   			<table class="table table-striped table-hover">
				   <tr>
					   	<th>
					   		내용
					   	</th>
					   	<th>
					   		리뷰 상품 아이디 
					   	</th>
					   	<th>
					   		시간
					   	</th>
				   </tr>
				   <c:forEach var="memberProductBoard" items="${memberProductBoard}">
				   <tr>
				   		<td>
				   			<h4>${memberProductBoard.productBoard_contents}</h4>
				   		</td>
				   		<td>
				   			<h4>${memberProductBoard.product_id}</h4>
				   		</td>
				   		<td>
				   		<fmt:formatDate pattern="yyyy년MM월dd일  hh시mm분ss초" value="${memberProductBoard.productBoard_date}"></fmt:formatDate>
				   		</td>
				   </tr>
				   </c:forEach>
	   			</table>
	   			</div>
	   			<br>
	   			<h4>회원 댓글 목록</h4><br>
	   			<div style="width:40%; height:800px; overflow:auto">
	   			<table class="table table-striped table-hover">
				   <tr>
					   	<th>
					   		내용
					   	</th>
					   	<th>
					   		게시판 번호
					   	</th>
					   	<th>
					   		시간
					   	</th>
				   </tr>
				   <c:forEach var="memberReply" items="${memberReply}">
				   <tr>
				   		<td>
				   			<h4>${memberReply.reg_content}</h4>
				   		</td>
				   		<td>
				   			<h4>${memberReply.borad_id}</h4>
				   		</td>
				   		<td>
				   		<fmt:formatDate pattern="yyyy년MM월dd일  hh시mm분ss초" value="${memberReply.reg_date}"></fmt:formatDate>
				   		</td>
				   </tr>
				   </c:forEach>
	   			</table>
	   			</div>
	   		</c:if>
   </div>	
   </c:if>
   
   <c:if test="${member.id ne 'tkdfladldi'}">
   		<h1>접근할수없는 권한입니다.</h1>
   </c:if>
</body>
<script type="text/javascript">
$(function(){
	   $('#blackListDel').on("click",function () {
		   var id = $('#blackListDel').attr('data-value');
		 $.ajax({
				type: "get",
				url : "${pageContext.request.contextPath}/admin/blacklist?id="+id+"&blacklist=N",
				success : function(n) {
					if(n==0){
						location.reload();
						 alert("블랙리스트 해제완료..")
					}else if(n==1){
						alert("오류.")
					}
		         }
			})
			}
		)});
		
$(function(){
	   $('#blackList').on("click",function () {
		 var id = $('#blackList').attr('data-value');
		 $.ajax({
				type: "get",
				url : "${pageContext.request.contextPath}/admin/blacklist?id="+id+"&blacklist=Y",
				success : function(n) {
					if(n==0){
						location.reload();
						 alert("블랙리스트 등록완료.")
					}else if(n==1){
						alert("오류.")
					}
		         }
			})
			}
		)});

$(function(){
	   $('#selectAdminPage').on("click",function () {
		 var id = $('#memberSel').val();
		 self.location = "${pageContext.request.contextPath}/admin/selectAdminPage?id="+id;
       })
	   
	   }
);



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