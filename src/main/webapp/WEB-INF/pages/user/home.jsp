<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
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
                        <form action="search.html" class="serach-form-area">
                            <div class="row justify-content-center form-wrap">
                                <div class="col-lg-4 form-cols">
                                    <input type="text" class="form-control" name="search" placeholder="Nhập tên công việc">
                                </div>
                                <div class="col-lg-3 form-cols">
                                    <input type="text" class="form-control" name="search" placeholder="Nhập tên công ty">
                                </div>
                                <div class="col-lg-3 form-cols">
                                    <div class="default-select" id="default-selects"">
                                        <select>
                                            <option>Ngành nghề</option>
                                            <c:forEach items="${careerses}" var="careers">
                                                <option>${careers.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-2 form-cols">
                                    <button type="button" class="btn btn-info">
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
                                    <p> Địa chỉ:
                                        ${post.staff.employer.address}
                                    </p>
                                </div>
                            </div>	
                        </c:forEach>
                    </div>
                </div>
            </div>	
        </section>
        <!-- Start feature-cat Area -->
        <section class="feature-cat-area pt-100" id="category">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-md-4 col-sm-6">
                        <div class="single-fcat">
                            <a href="category.html">
                                <img src="<c:url value="/resources-home/img/o1.png" />" alt="">
                            </a>
                            <p>Accounting</p>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-6">
                        <div class="single-fcat">
                            <a href="category.html">
                                <img src="<c:url value="/resources-home/img/o2.png" />" alt="">
                            </a>
                            <p>Development</p>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-6">
                        <div class="single-fcat">
                            <a href="category.html">
                                <img src="<c:url value="/resources-home/img/o3.png" />" alt="">
                            </a>
                            <p>Technology</p>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-6">
                        <div class="single-fcat">
                            <a href="category.html">
                                <img src="<c:url value="/resources-home/img/o4.png" />" alt="">
                            </a>
                            <p>Media & News</p>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-6">
                        <div class="single-fcat">
                            <a href="category.html">
                                <img src="<c:url value="/resources-home/img/o5.png" />" alt="">
                            </a>
                            <p>Medical</p>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-6">
                        <div class="single-fcat">
                            <a href="category.html">
                                <img src="<c:url value="/resources-home/img/o6.png" />" alt="">
                            </a>
                            <p>Goverment</p>
                        </div>			
                    </div>																											
                </div>
            </div>	
        </section>
        <!-- Start post Area -->
        <section class="post-area section-gap">
            <div class="container">
                <div class="row justify-content-center d-flex">
                    <div class="col-lg-8 post-list">
                        <ul class="cat-list">
                            <li><a href="#">Recent</a></li>
                            <li><a href="#">Full Time</a></li>
                            <li><a href="#">Intern</a></li>
                            <li><a href="#">part Time</a></li>
                        </ul>
                        <c:forEach items="${posts}" var="post">
                            <div class="single-post d-flex flex-row" style="height: 170px;">
                                <div class="thumb" style="margin-right: 80px;">
                                    <img style="height: 100px; width: 150px;" src="<c:url value="/resources-home/img/company/${post.staff.employer.logo}" />" alt="">
                                </div>
                                <div class="details">
                                    <div class="title d-flex flex-row justify-content-between">
                                        <div class="titles">
                                            <a href="<c:url value="/user/detail-post/${post.id}" />"><h4 style="color: #2980b9;">${post.name}</h4></a>
                                            <h6 style="color: #2980b9;">${post.staff.employer.name}</h6>					
                                        </div>
                                        <ul class="btns" style="margin-left: 270px;">
                                            <li><a href="#" >Apply</a></li>
                                        </ul>
                                    </div>
                                    <p></span>Địa chỉ: ${post.staff.employer.address}</p>
                                    <p>Ngày đăng: <fmt:formatDate pattern="dd/MM/yyyy" value="${post.postDate}" /></p>
                                </div>
                            </div>
                        </c:forEach>
                        <a class="text-uppercase loadmore-btn mx-auto d-block" href="category.html">Load More job Posts</a>

                    </div>
                    <div class="col-lg-4 sidebar">
                        <div class="single-slidebar">
                            <h4>Jobs by Location</h4>
                            <ul class="cat-list">
                                <li><a class="justify-content-between d-flex" href="category.html"><p>New York</p><span>37</span></a></li>
                                <li><a class="justify-content-between d-flex" href="category.html"><p>Park Montana</p><span>57</span></a></li>
                                <li><a class="justify-content-between d-flex" href="category.html"><p>Atlanta</p><span>33</span></a></li>
                                <li><a class="justify-content-between d-flex" href="category.html"><p>Arizona</p><span>36</span></a></li>
                                <li><a class="justify-content-between d-flex" href="category.html"><p>Florida</p><span>47</span></a></li>
                                <li><a class="justify-content-between d-flex" href="category.html"><p>Rocky Beach</p><span>27</span></a></li>
                                <li><a class="justify-content-between d-flex" href="category.html"><p>Chicago</p><span>17</span></a></li>
                            </ul>
                        </div>
                        <div class="single-slidebar">
                            <h4>Jobs by Category</h4>
                            <ul class="cat-list">
                                <li><a class="justify-content-between d-flex" href="category.html"><p>Technology</p><span>37</span></a></li>
                                <li><a class="justify-content-between d-flex" href="category.html"><p>Media & News</p><span>57</span></a></li>
                                <li><a class="justify-content-between d-flex" href="category.html"><p>Goverment</p><span>33</span></a></li>
                                <li><a class="justify-content-between d-flex" href="category.html"><p>Medical</p><span>36</span></a></li>
                                <li><a class="justify-content-between d-flex" href="category.html"><p>Restaurants</p><span>47</span></a></li>
                                <li><a class="justify-content-between d-flex" href="category.html"><p>Developer</p><span>27</span></a></li>
                                <li><a class="justify-content-between d-flex" href="category.html"><p>Accounting</p><span>17</span></a></li>
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
