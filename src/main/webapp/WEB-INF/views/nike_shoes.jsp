<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>박사장몰</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="${pageContext.request.contextPath}/resources/review_css/styles.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/review_css/styles.css" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/review_css/styles.css" rel="stylesheet" />
    </head>
    <style>
    #h2{
    	font-size: 32px;
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
        
        <!-- Portfolio Section-->
        <section class="page-section portfolio" id="portfolio">
            <div class="container" id="div">
                <!-- Portfolio Section Heading-->
                
                 <br><h2 class="page-section-heading text-center text-uppercase text-secondary mb-0" id="h2">나이키</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Grid Items-->
              
                <div class="row justify-content-center">
                       <c:forEach var="row" items="${list}">
                    <!-- Portfolio Item 1-->
                    <div class="col-md-6 col-lg-4 mb-5">
                 		<input type="hidden" value="${row.product_id}">
                        <div onclick="location.href='${pageContext.request.contextPath}/nike_shoesChk/${row.product_id}'" class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div onclick="location.href='${pageContext.request.contextPath}/nike_shoesChk/${row.product_id}'" class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <img src="../resources/assets/img/portfolio/${row.product_url}" width="405px" height="230px" alt="..."/>
                        </div>
                    </div>
                     </c:forEach>
                </div>
            
            </div>
          
        </section>
        
     
        <!-- Bootstrap core JS-->
        <script src="/resources/review_js/scripts.js"></script>
        <!-- Core theme JS-->
       <script src="/resources/review_js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
          <script src="/resources/review_js/scripts.js"></script>
    </body>
</html>
