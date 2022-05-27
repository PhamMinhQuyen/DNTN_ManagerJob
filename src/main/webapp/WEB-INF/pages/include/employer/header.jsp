<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header" id="home">
    <div class="container">
        <div class="row align-items-center justify-content-between d-flex">
            <div id="logo">
                <a href="<c:url value="/user/home" />"><img src="<c:url value="/resources/img/logo.png" />" alt="" title="" /></a>
            </div>
            <nav id="nav-menu-container">
                <ul class="nav-menu">
                    <li class="menu-active"><a href="<c:url value="/user/home" />">Trang chủ</a></li>
                    <li><a href="about-us.html">Công ty</a></li>
                    <li><a href="category.html">ứng viên</a></li>
                    <li><a href="price.html">liên hệ</a></li>
                    <li><a class="ticker-btn" href="#">Đăng ký</a>
                        <ul>
                            <li><a href="<c:url value="/user/registration-candidate" />">Ứng viên</a></li>
                            <li><a href="<c:url value="/employer/registration-employer" />">Nhà tuyển dụng</a></li>
                        </ul>
                    </li>
                    <li><a class="ticker-btn" href="<c:url value="/user/login" />">Đăng nhập</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>