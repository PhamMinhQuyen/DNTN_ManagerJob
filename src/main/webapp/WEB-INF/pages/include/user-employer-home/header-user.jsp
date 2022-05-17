<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header" id="home">
            <div class="container">
                <div class="row align-items-center justify-content-between d-flex">
                    <div id="logo">
                        <a href="<c:url value="/employer/home"/>"><img src="<c:url value="/resources-home/img/logo.png" />" alt="" title="" /></a>
                    </div>
                    <nav id="nav-menu-container">
                        <ul class="nav-menu">
                            <li class="menu-active"><a href="<c:url value="/employer/home"/>">Trang chủ</a></li>
                            <li><a href="<c:url value="/employer/information-company"/>">Công ty</a></li>
                            <li><a href="">Tuyển dụng</a></li>
                            <li><a href="">Liên hệ</a></li>
                            <li><a class="ticker-btn" href="#">${candidate.name}</a>
                                <ul>
                                    <li><a href="<c:url value="/user/information-user"/>">Quản lý hồ sơ</a></li>
                                    <li><a href="<c:url value="/user/job-management"/>">Quản lý việc làm</a></li>
                                    <li><a href="<c:url value="/employer/change-password"/>">Đổi mật khẩu</a></li>
                                    <li><a href="<c:url value="/user/log-out"/>">Đăng xuất</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>	    		
                </div>
            </div>
        </header>