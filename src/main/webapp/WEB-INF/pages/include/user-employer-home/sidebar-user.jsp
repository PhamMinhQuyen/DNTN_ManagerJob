<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav id="sidebar">
    <div class="avatar">
        <div class="w-24 rounded-full ring ring-primary ring-offset-base-100 ring-offset-2">
             <img src="<c:url value="/resources-home/img/company/"/>${employer.logo}" width="100px" height="100px;"  style="margin-left: 65px;"/>
        </div>
    </div>
    <ul class="list-unstyled components mb-5">
        <li class="active">
            <a href="<c:url value="/employer/home"/>" style="font-size: 13px" ><span class="fa fa-home mr-3"></span> TRANG CHỦ</a>
        </li>
        <li>
            <a href="<c:url value="/employer/account"/>" style="font-size: 13px"><span class="fa fa-user mr-3"></span>THÔNG TIN TÀI KHOẢN</a>
        </li>
        <li>
            <a href="<c:url value="/employer/information-company" />" style="font-size: 13px"><span class="fa fa-user mr-3"></span>QUẢN LÝ HỒ SƠ</a>
        </li>
        <li>
            <a href="<c:url value="/employer/add-job"/>" style="font-size: 13px"><span class="fa fa-automobile mr-3"></span>VIỆC LÀM ĐÃ NỘP</a>
        </li>
        <li>
            <a href="<c:url value="/employer/change-password" />" style="font-size: 13px"><span class="fa fa-paper-plane mr-3"></span>THAY ĐỔI MẬT KHẨU</a>
        </li>
        <li>
            <a href="<c:url value="/user/log-out" />" style="font-size: 13px"><span class="fa fa-paper-plane mr-3"></span> ĐĂNG XUẤT</a>
        </li>
    </ul>
</nav>