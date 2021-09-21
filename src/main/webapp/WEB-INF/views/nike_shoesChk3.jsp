<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
    
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>박사장몰</title>
        
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <!-- Google fonts-->
        <link href="${pageContext.request.contextPath}/resources/review_css/styles.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/review_css/styles.css" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/review_css/styles.css" rel="stylesheet" />
    </head>
    <style>
    .page{padding-top:25px; }
    .list_n_menu {padding:3px; MARGIN:30px;}
    .list_n_menu A {padding:5px 8px 4px 8px; MARGIN: 2px; BORDER: #ccc 1px solid; COLOR: #999; TEXT-DECORATION: none;
   }
    #portfolio{
     padding: 10px;
    }
    #div{
    padding: 10px;
    }
   table {
    width: 100%;
  }
  th, td {
  }
  ul li {list-style-type: none; }
  .page-prev{
  float: left;
  }
  .page-next{position: relative;
  left:360px;
  top : 1px;
  bottom: 31px;
  }
  .page-next2{bottom: 30px;
  }
  #insert{
  position: relative;
  left: 350px;
  bottom: 40px;
  }
  
  
    </style>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="/mainPage">박사장몰</a>
                <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                    <c:if test="${member == null}">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/login">로그인</a></li>
                    </c:if>
                    <c:if test="${member != null}">
                     <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/logout">로그아웃</a></li>
                     </c:if>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/borad?p=1">자유게시판</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/shopping">쇼핑하기</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image-->
                <!-- Masthead Heading-->
                <!-- Icon Divider-->
               
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0" id="p">상품</p>
                <table>
        <tr>
            <td>
            <td> 
				<img src="../resources/assets/img/portfolio/${vo.product_url}" width="300px" height="300px">
            </td>
            <td>
                <table style="height: 500px; width: 500px;">
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
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
      </table>
                
            </div>
        </header>
        <!-- Portfolio Section-->
        <section class="page-section portfolio" id="portfolio">
            <div class="container" id="div">
                <!-- Portfolio Section Heading-->
                <!-- Icon Divider-->
             
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
   	 	<div class="list_n_menu">
   	 		<ul>
   	 			
   	 			<c:if test="${pagination.prev}">

				<li><a class="page-prev" href="#hh" onClick="fn_prev(	${vo.product_id},'${pagination.page}', '${pagination.range}', '${pagination.rangeSize}','${pagination.searchType}','${pagination.keyword}')">Previous</a></li>

				</c:if>
   	 			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
   	 					<a class="page" href="#hh" onClick="fn_pagination(
   	 								${vo.product_id},'${idx}', '${pagination.range}', '${pagination.rangeSize}','${pagination.searchType}','${pagination.keyword}')" >${idx}</a>
   	 			</c:forEach>
   	 			
   	 			<c:if test="${pagination.next}">
   	 			<li class="page-next2">
   	 				<a class="page-next" href="#hh" onClick="fn_next(
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
            </div>
        </section>
       
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
