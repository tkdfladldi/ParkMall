<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세정보</title>
<head profile="http://www.w3.org/2005/10/profile">
<link rel="icon" type="image/png" href="http://example.com/myicon.png"> 
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

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
    <h3>Review</h3>
    <div>
    	<form id="form"  method="post">
    		<div>
    		 <label >내용   : </label>
    			<input id="reView" style="height: 60px; width: 300px;" name="productBoard_contents">
    			<input type="hidden" name="product_id" value="${vo.product_id}">
    		</div>
    			<button type="button" id="insert">리뷰 완료</button>
    	</form>
   	</div>
   	  <table class="table table-striped table-hover">
   	 			 <tr>
			        <th>no</th>
			        <th>내용</th>
			        <th>조회수</th>
			        <th>작성자</th>
			        <th>작성날짜</th>
			     </tr>
   	 	<c:forEach var="productBoardList" items="${productBoardList}">
				 <tr>
				        <td>${productBoardList.productBoard_id}</td>
				        <td>${productBoardList.productBoard_contents}</td>
				        <td>${productBoardList.productBoard_hit}</td>
				      	<td>${productBoardList.productBoard_name}</td>
				        <td>
				            <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
				            <fmt:formatDate pattern="yyyy년MM월dd일  hh시mm분ss초" value="${productBoardList.productBoard_date}"/>
				        </td>
			    </tr>   
   	 	</c:forEach>
   	 				
   	 				
			   	
   	 </table>
   	 	<div>
   	 		<ul>
   	 			
   	 			<c:if test="${pagination.prev}">

				<li><a class="page-link" href="#" onClick="fn_prev(	${vo.product_id},'${pagination.page}', '${pagination.range}', '${pagination.rangeSize}','${pagination.searchType}','${pagination.keyword}')">Previous</a></li>

				</c:if>
   	 			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
   	 					<a  href="#"onClick="fn_pagination(
   	 								${vo.product_id},'${idx}', '${pagination.range}', '${pagination.rangeSize}','${pagination.searchType}','${pagination.keyword}')">${idx}</a>
   	 			</c:forEach>
   	 			
   	 			<c:if test="${pagination.next}">
   	 			<li>
   	 				<a class="page-link" href="#" onClick="fn_next(
   	 								${vo.product_id},'${pagination.page}', '${pagination.range}', '${pagination.rangeSize}','${pagination.searchType}','${pagination.keyword}')"> Next</a>
   	 			</li>
   	 			</c:if>
   	 		</ul>
 		</div>
 		<div>
 			<select id="selectType">
 				<option>---</option>
 				<option value="a">내용</option>
 				<option value="b">작성자</option>
 				<option value="c">내용+작성자</option>
 			</select>
 			<input type="text" name="keyword" id="keywordInput" value="${pagination.keyword}"/>
 			<button type="button" data-value="${vo.product_id}" id="searchBtn">검색</button>
 		</div>
 		
 		
   			
    
</body>

<script type="text/javascript">

		$(function() {
			$('#searchBtn').click(function() {
				var  product_id =   $(this).attr('data-value');
				self.location = "${pageContext.request.contextPath}/nike_shoesChk/"+product_id+"?searchType=" + $("#selectType").val() +"&keyword=" + encodeURIComponent($('#keywordInput').val());
				
			})
			
		})

		function fn_prev(product_id,page, range, rangeSize,searchType,keyword) {
			var page = ((range - 1) * rangeSize);
			var range = range - 1;
			var url = "${pageContext.request.contextPath}/nike_shoesChk/"+product_id;
			url = url + "?page=" + page;

			url = url + "&range=" + range;
			url = url + "&searchType="+searchType;
			url = url + "&keyword="+keyword;
			location.href = url;	
			
		}

		function fn_pagination(product_id,page, range, rangeSize,searchType,keyword) {
					
			var url = "${pageContext.request.contextPath}/nike_shoesChk/"+product_id;
			url = url + "?page=" + page;

			url = url + "&range=" + range;
			
			url = url + "&searchType="+searchType;
			url = url + "&keyword="+keyword;
			
			location.href = url;	
			
		}
		
		function fn_next(product_id,page, range, rangeSize,searchType,keyword) {
			
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			
			var url = "${pageContext.request.contextPath}/nike_shoesChk/"+product_id;
			url = url + "?page=" + page;

			url = url + "&range=" + range;
			
			url = url + "&searchType="+searchType;
			
			url = url + "&keyword="+keyword;
			location.href = url;		
		}



$('#insert').on("click",function () {
	if($("#reView").val()==""){
		alert("내용을 입력해주세요");
		$("#reView").focus();
		return false;
	}

    var form = $("#form").serialize();
    $.ajax({
		type: "post",
		url : "/insertProductBorad",
		data : form,
		dataType: 'json',
		success : function(n) {
			if(n==0){
				location.reload();
				 alert("댓글 저장 완료.")
			}else if(n==1){
				alert("로그인이 필요합니다.")
			}
         }
	})
	}
);
</script>
</html>