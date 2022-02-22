<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<style>
	
	select {
	  border: 3px groove;
	}
</style>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>박사장몰</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/admin_vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/admin_css/sb-admin-2.min.css" rel="stylesheet">

</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">박사장몰</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/crawling">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>우리동네 날씨</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>XXX</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Components:</h6>
                        <a class="collapse-item" href="buttons.html">Buttons</a>
                        <a class="collapse-item" href="cards.html">Cards</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>XXX</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="utilities-color.html">Colors</a>
                        <a class="collapse-item" href="utilities-border.html">Borders</a>
                        <a class="collapse-item" href="utilities-animation.html">Animations</a>
                        <a class="collapse-item" href="utilities-other.html">Other</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>회원관련</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                     <c:if test="${member.id == null}">
                        <h6 class="collapse-header">로그인이 필요합니다</h6>
                        <a class="collapse-item" href="#">xxx</a>
                        <a class="collapse-item" href="#">xxx</a>
                        <a class="collapse-item" href="#">xxx</a>
                        <a class="collapse-item" href="#">xxx</a>
                     </c:if>
                      <c:if test="${member.id != null}">
                       <h6 class="collapse-header">환영합니다 !</h6>
                      	<a class="collapse-item" href="/logout">로그아웃</a>
                      	<a class="collapse-item" href="/memberChk">내정보</a>
                        <a class="collapse-item" href="/memberPassChange">비밀번호 변경</a>
                      </c:if>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="/nike_shoes">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>세일 상품</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="/borad?p=1&">
                    <i class="fas fa-fw fa-table"></i>
                    <span>자유게시판</span></a>
            </li>
           
			<c:if test="${member.id eq 'tkdfladldi'}">
			    <li class="nav-item">
                <a class="nav-link" href="/admin">
                    <i class="fas fa-fw fa-table"></i>
                    <span>현재 계정은 관리자 입니다.</span></a>
            </li>
		    </c:if>
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            <!-- Sidebar Message -->
            <div class="sidebar-card d-none d-lg-flex">
                <p class="text-center mb-2">저희 박사장몰은 사람들과의 소통을 할 수 있는 채팅방이 있습니다.</p>
                <a class="btn btn-success btn-sm" href="/echo/chat">채팅방 입장!</a>
            </div>
			<div class="sidebar-card d-none d-lg-flex">
                <p class="text-center mb-2">박사장몰에서 신규 커뮤니티 사이트를 오픈 했습니다.</p>
                <a class="btn btn-success btn-sm" href="/newhome">모아채팅 사이트 입장!</a>
            </div>
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

               

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                   
                                   
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun Â· 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez Â· 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog Â· 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                       <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <c:if test="${member.id == null}">
                        <li class="nav-item dropdown no-arrow">
                       
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">비회원</span>
                            </a>
                        
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="/login">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    		로그인
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    		아이디 찾기
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    		비밀번호 찾기
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/member">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    		회원가입
                                </a>
                            </div>
                        </li>
                        </c:if>
                         <c:if test="${member.id != null}">
                        <li class="nav-item dropdown no-arrow">
                       
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span style="font-size: 12px" class="m-0 font-weight-bold text-primary" >${member.id}님 반갑습니다.</span>
                           </a>
                        
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="/memberChk">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    		내정보
                                </a>
                                <a class="dropdown-item" href="/memberPassChange">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    		비밀번호 변경
                                </a>
                                <a class="dropdown-item" href="/logout">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    		로그아웃
                                </a>
                            </div>
                        </li>
                        </c:if>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
					
                    <!-- 404 Error Text -->
                    <div class="text-center">
                        <div style="font-size: 30px" class="m-0 font-weight-bold text-primary"></div>
                        <p class="lead text-gray-800 mb-5"> </p>
                       <div class="col-lg-6 mb-4">

                            <!-- Illustrations -->
                            <div class="card shadow mb-4" style="width: 1000px;height : 830px; position: relative; left: 110px" >
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">${vo.product_name}</h6>
                                </div>
                                <div class="card-body">
                                    <div class="text-center">
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="../resources/assets/img/portfolio/${vo.product_url}" alt="...">
                                    </div>
                                    
                                   <p style="color: red;"> <fmt:formatNumber value="${vo.product_price}" pattern="###,###,###"/></p>
                                    <p style="color: black;">무료배송</p>
                                    	<table style="position: relative; left: 378px">
						                   	<tr align="center">
						                        <td colspan="2">
						                            <form name="form1" method="post" action="${path}/cart">
						                                <input type="hidden" name="product_id" value="${vo.product_id}">
						                                <select name="amount">
						                                    <c:forEach begin="1" end="100" var="i">
						                                        <option value="${i}">${i}</option>
						                                    </c:forEach>
						                                </select>&nbsp;개
														 <a href="#" class="btn btn-primary btn-icon-split btn-sm">
						                                        <span class="icon text-white-50">
						                                            <i class="fas fa-check"></i>
						                                        </span>
						                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="width: 128px; height: 31px;">장바구니 담기</button>
						                                    </a>
						                            </form>
						                        </td>
						                    </tr>
						                </table><br>
                                    <p style="width: 600px; position: relative; left: 168px">${vo.product_desc}</p>
                                </div>
                            </div>

                        </div>
                       
                    </div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow" style="position: relative; top : 24px;">
             					 <div>
							    	<form id="form" style="position: relative; top : 3px; left: 350px;"  method="post" enctype="multipart/form-data">
							    		<div>
							    		 <br><label >리뷰 작성   : </label>
							    			<input id="reView" style="height: 68px; width: 300px;" name="productBoard_contents">
							    			<input type="hidden" name="product_id" value="${vo.product_id}">
							    			<input style="position: relative; left: 70px;" type="file" id="file" name="file" value="사진업로드">
							    		</div>
							    			<button class="btn btn-primary btn-user btn-block" style="position: relative;width: 60px; height: 31px; left: 381px; bottom: 43px;" type="button" id="insert">작성</button>
							    	</form>
							   	</div>
            </nav>
           
             <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
            					<!-- Topbar Search -->
		                    <section style="position: relative; left: 280px;" class="bg-light" style="position: relative; left: 18px;" id="services">
						            <div class="container px-4" id="asd">
						                <div class="row gx-4 justify-content-center">
						                    <div class="col-lg-8">
																	                   
													   <select id="selectType">
											 				<option>선택</option>
											 				<option value="a">내용</option>
											 				<option value="b">작성자</option>
											 				<option value="c">내용+작성자</option>
											 			</select>
 			
								    	</div>
								   	 </div>
								    </div>
							   </section>
							   <form style="position: relative; left: 270px;"
			                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
			                        <div class="input-group">
			                            <input type="text" class="form-control bg-light border-0 small" name="keyword" id="keywordInput" value="${pagination.keyword}" placeholder="게시판 검색..."
			                                aria-label="Search" aria-describedby="basic-addon2">
			                            <div class="input-group-append">
			                            
			                                <button class="btn btn-primary" id="searchBtn" data-value="${vo.product_id}" type="button">
			                               				  검색
			                                </button>
			                            </div>
			                        </div>
			                    </form>
			   </nav>
			     <div class="card shadow mb-4" style="position: relative; bottom: 24px;">
                        <div class="card-header py-3">
							   <h6 class="m-0 font-weight-bold text-primary" style="position: relative; left: 550px;">리뷰 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0">
								            <tbody><tr>
											        <th><h6 align="center" class="m-0 font-weight-bold text-primary">번호</h6></th>
											        <th><h6 align="center" class="m-0 font-weight-bold text-primary">내용</h6></th>
											        <th><h6 align="center" class="m-0 font-weight-bold text-primary">작성자</h6></th>
											        <th><h6 align="center" class="m-0 font-weight-bold text-primary">작성날짜</h6></th>
											        <th><h6 align="center" class="m-0 font-weight-bold text-primary">사진</h6></th>
											    </tr>
											 <c:forEach var="productBoardList" items="${productBoardList}">
											    <tr>
											        <td style="text-align: center; width: 75px;">${productBoardList.productBoard_id}
											        		<c:if test="${productBoardList.productBoard_name eq member.id }"><button style="width: 70px" onclick="productBoardDel(${productBoardList.productBoard_id},'${productBoardList.productBoard_name}','${productBoardList.fileFakeName}');" class="btn btn-primary btn-user btn-block" type="button">삭제</button> </c:if></td>
											        <td>${productBoardList.productBoard_contents}</td>
											        <td>${productBoardList.productBoard_name}</td>
											       <td>
											             <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
				      								      <fmt:formatDate pattern="yyyy년MM월dd일  hh시mm분ss초" value="${productBoardList.productBoard_date}"/>
											        </td>
											        <c:if test="${productBoardList.fileFakeName != null}">
											         <td><img style="position:relative;left:25px; width: 230px; height: 120px;" src="../resources/uplodFile/${productBoardList.fileFakeName}"/></td>
											  		</c:if>
											  		 <c:if test="${productBoardList.fileFakeName == null}">
											  		<td></td>
											  		</c:if>
											    </tr>    
											  </c:forEach>
                                </tbody></table>
                            </div>
                        </div>
                        
                    </div>
                    
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
            	<div class="col-sm-12 col-md-7" style="position: relative;left: 450px; bottom: 30px;">
					 <div class="dataTables_paginate paging_simple_numbers">
							
						<ul class="pagination">
							<c:if test="${pagination.prev}">
				       			<a class="page-link" id="previousPage" href="#" onClick="fn_prev(	${vo.product_id},'${pagination.page}', '${pagination.range}', '${pagination.rangeSize}','${pagination.searchType}','${pagination.keyword}')">
				       		이전</a>
				       		</c:if>
						<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				       		<li class="paginate_button page-item active"><a class="page-link" href="#"onClick="fn_pagination(
   	 								${vo.product_id},'${idx}', '${pagination.range}', '${pagination.rangeSize}','${pagination.searchType}','${pagination.keyword}')">
   	 							${idx}</a></li>
				       	</c:forEach>
				       	<c:if test="${pagination.next}">
				       			<a class= "page-link" id="nextPage" href="#" onClick="fn_next(
   	 								${vo.product_id},'${pagination.page}', '${pagination.range}', '${pagination.rangeSize}','${pagination.searchType}','${pagination.keyword}')">
   	 							다음</a>
				       		</c:if>
				       	</ul>
				       		
				     </div>
				 	</div>
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">Ã</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/admin_vendor/jquery/jquery.min.js"></script>
    <script src="/resources/admin_vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/admin_vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/admin_js/sb-admin-2.min.js"></script>

</body>
<script type="text/javascript">
		function productBoardDel(productBoard_id,productBoard_name,fileFakeName) {
			$.ajax({
				type: "post",
				url : "/productBoardDel",
				data : {"productBoard_id" : productBoard_id, "fileFakeName" : fileFakeName,"productBoard_name":productBoard_name},
				dataType: 'json',
				success : function(n) {
					if(n==0){
						location.reload();
						 alert("삭제 완료.")
					}else if(n==1){
						alert("오류.")
					}
		         }
			})
			};
		
		

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
	
	var form = $('#form')[0]; 
	 var data = new FormData(form);  
    $.ajax({
    	enctype: 'multipart/form-data',
		type: "post",
		url : "/insertProductBorad",
		data : data,
		processData: false,    
        contentType: false, 
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