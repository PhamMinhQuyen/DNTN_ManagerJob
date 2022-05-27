<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header" id="home">
            <div class="container">
                <div class="row align-items-center justify-content-between d-flex">
                    <div id="logo">
                        <a href="<c:url value="/employer/home" />"><img src="<c:url value="/resources-home/img/logo.png" />" alt="" title="" /></a>
                    </div>
                    <nav id="nav-menu-container">
                        <ul class="nav-menu">
                            <li class="menu-active"><a href="<c:url value="/employer/home" />">Trang chủ</a></li>
                            <li><a href="">Công ty</a></li>
                            <li><a href="">Tuyển dụng</a></li>
                            <li><a href="">Liên hệ</a></li>
                            <li><a class="ticker-btn" href="#">${email}</a>
                                <ul>
                                    <li><a href="elements.html">Quản lý người dùng</a></li>
                                    <li><a href="search.html">Quản lý nhà tuyển dụng</a></li>
                                    <li><a href="<c:url value="/user/login" />">Đăng xuất</a></li>
                                </ul>
                            </li>

                        </ul>
                    </nav>	    		
                </div>
            </div>
        </header>