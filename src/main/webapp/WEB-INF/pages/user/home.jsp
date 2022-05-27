<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="img/fav.png">
        <meta name="author" content="codepixer">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta charset="UTF-8">
        <title>Trang chủ</title>
        <jsp:include page="../include/user-employer-home/css-page.jsp"/>

    </head>

    <body>
        <header id="header" id="home">
            <div class="container">
                <div class="row align-items-center justify-content-between d-flex">
                    <div id="logo">
                        <a href="index.html"><img src="<c:url value="/resources-home/img/logo.png" />" alt="" title="" /></a>
                    </div>
                    <nav id="nav-menu-container">
                        <ul class="nav-menu">
                            <li class="menu-active"><a href="index.html">Trang chủ</a></li>
                            <li><a href="about-us.html">Công ty</a></li>
                            <li><a href="category.html">Tuyển dụng</a></li>
                            <li><a href="price.html">Liên hệ</a></li>
                            <li><a class="ticker-btn sf-with-ul" href="#">Đăng ký</a>
                                <ul>
                                    <li><a href="<c:url value="/user/registration-candidate" />">Ứng viên</a></li>
                                    <li><a href="<c:url value="/employer/registration-employer" />">Nhà tuyển dụng</a></li>
                                </ul>
                            </li>
                            <li><a class="ticker-btn" href="<c:url value="/user/login"/>">Đăng nhập</a></li>				          				          
                        </ul>
                    </nav>	    		
                </div>
            </div>
        </header>

        <section class="banner-area relative" id="home">	
            <div class="overlay overlay-bg"></div>
            <div class="container">
                <div class="row fullscreen d-flex align-items-center justify-content-center">
                    <div class="banner-content col-lg-12">
                        <form action="${pageContext.request.contextPath}/user/search" class="serach-form-area"
                              method="post">
                            <div class="row justify-content-center form-wrap">
                                <div class="col-lg-3 form-cols">
                                    <div class="default-select" id="default-selects"">
                                        <select name="careers">
                                            <c:forEach items="${careerses}" var="careers">
                                                <option value="${careers.id}">${careers.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-3 form-cols">
                                    <input type="text" class="form-control" name="name" placeholder="Nhập tên công việc">
                                </div>  
                                <div class="col-lg-3 form-cols">
                                    <input type="text" class="form-control" name="company" placeholder="Nhập tên công ty">
                                </div>

                                <div class="col-lg-2 form-cols">
                                    <button type="sumbit" class="btn btn-info">
                                        Tìm kiếm
                                    </button>
                                </div>								
                            </div>
                        </form>	
                    </div>											
                </div>
            </div>
        </section>
        <section class="popular-post-area pt-100">
            <div class="container">
                <div class="row align-items-center">
                    <div class="active-popular-post-carusel">
                        <c:forEach items="${posts}" var="post">
                            <div class="single-popular-post d-flex flex-row">
                                <div class="thumb">
                                    <img class="img-fluid" style="height: 70px; width: 100px;" src="<c:url value="/resources-home/img/company/${post.staff.employer.logo}" />" alt="">
                                </div>
                                <div class="details">
                                    <a href="<c:url value="/user/detail-post/${post.id}" />"><h4>${post.name}</h4></a>
                                    <h6>${post.staff.employer.name}</h6>
                                    <p> Lương:
                                        ${post.wage}
                                    </p>
                                </div>
                            </div>	
                        </c:forEach>

                    </div>
                </div>
            </div>	
        </section>
        <section class="feature-cat-area pt-100" id="category">
            <div class="container">
                <h4>NHÀ TUYỂN DỤNG HÀNG ĐẦU</h4>
                </br>
                <div class="row">
                    <c:forEach items="${employers}" var="employer">
                        <div class="col-lg-2 col-md-4 col-sm-6">
                            <div class="single-fcat">
                                <a href="#">
                                    <img width="80px;" height="80px;" src="<c:url value="/resources-home/img/company/${employer.logo}" />" alt="">
                                </a>
                                <p>${employer.name}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>																											
            </div>
        </div>	
    </section>
    <section class="post-area section-gap">
        <div class="container">
            <div class="row justify-content-center d-flex">
                <div class="col-lg-8 post-list">
                    <h4>VIỆC LÀM TUYỂN GẤP TẠI ĐÀ NẴNG</h4>
                    </br>
                    <c:forEach items="${page.content}" var="post">
                        <div class="single-post d-flex flex-row" style="height: 160px;">
                            <div class="thumb" style="margin-right: 80px;">
                                <img style="height: 100px; width: 150px;" src="<c:url value="/resources-home/img/company/${post.staff.employer.logo}" />" alt="">
                            </div>
                            <div class="details">
                                <a href="<c:url value="/user/detail-post/${post.id}" />"><h4 style="color: #2980b9;">${post.name}</h4></a>
                                <h6 style="color: #2980b9;">${post.staff.employer.name}</h6>					
                                <p class="address">Lương: ${post.wage}</p>
                                <p class="address">Ngày đăng: <fmt:formatDate pattern="dd/MM/yyyy" value="${post.postDate}" /></p>
                            </div>
                        </div>
                    </c:forEach>
                    <nav aria-label="Page navigation example" style="margin-left: 200px;">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="/DATN_JobManagement/user/?page=0">First</a></li>
                            <li class="page-item"><a class="page-link" href="/DATN_JobManagement/user/?page=${page.number - 1}"><<</a></li>
                            <li class="page-item"><a class="page-link" href="/DATN_JobManagement/user/?page=0">1</a></li>
                            <li class="page-item"><a class="page-link" href="/DATN_JobManagement/user/?page=1">2</a></li>
                            <li class="page-item"><a class="page-link" href="/DATN_JobManagement/user/?page=2">3</a></li>
                            <li class="page-item"><a class="page-link" href="/DATN_JobManagement/user/?page=${page.number + 1}">>></a></li>
                            <li class="page-item"><a class="page-link" href="/DATN_JobManagement/user/?page=${page.totalPages - 1}">Last</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-4 sidebar" style="margin-top: 45px;">
                    <div class="single-slidebar">
                        <h4>Bài đăng gần đây</h4>
                        <div class="active-relatedjob-carusel">
                            <c:forEach items="${posts}" var="post">
                                <div class="single-rated">
                                    <img  height="100px;" width="100px;" src="<c:url value="/resources-home/img/company/${post.staff.employer.logo}" />" alt="">
                                    <a href="<c:url value="/user/detail-post/${post.id}" />"><h4>${post.name}</h4></a>
                                    <h6>${post.staff.employer.name}</h6>
                                    <p class="address">Lương: ${post.wage}</p>
                                    <p class="address">Ngày đăng: <fmt:formatDate pattern="dd/MM/yyyy" value="${post.postDate}" /></p>
                                    <a href="#" class="btns text-uppercase">Ứng tuyển</a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>			

                    <div class="single-slidebar">
                        <h4>Jobs by Category</h4>
                        <ul class="cat-list" style="margin-top: 50px;">
                            <li><a class="justify-content-between d-flex" href="category.html"><p>Technology</p><span>37</span></a></li>
                            <li><a class="justify-content-between d-flex" href="category.html"><p>Media & News</p><span>57</span></a></li>
                            <li><a class="justify-content-between d-flex" href="category.html"><p>Goverment</p><span>33</span></a></li>
                            <li><a class="justify-content-between d-flex" href="category.html"><p>Medical</p><span>36</span></a></li>
                            <li><a class="justify-content-between d-flex" href="category.html"><p>Restaurants</p><span>47</span></a></li>
                            <li><a class="justify-content-between d-flex" href="category.html"><p>Developer</p><span>27</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>	
    </section>

    <jsp:include page="../include/employer/footer.jsp"/>
    <jsp:include page="../include/user-employer-home/js-page.jsp"/>
</body>
</html>
