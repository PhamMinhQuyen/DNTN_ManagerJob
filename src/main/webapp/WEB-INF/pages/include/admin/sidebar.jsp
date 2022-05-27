<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <ul class="list-unstyled components mb-5">
        <li class="active">
            <a href="<c:url value="/employer/home"/>" style="font-size: 13px" ><span class="fa fa-home mr-3"></span> TRANG CHỦ</a>
        </li>
        <li>
            <a href="<c:url value="/admin/manager-user"/>" style="font-size: 13px"><span class="fa fa-user mr-3"></span>QUẢN LÝ NGƯỜI DÙNG</a>
        </li>
        <li>
            <a href="<c:url value="/admin/manager-employer" />" style="font-size: 13px"><span class="fa fa-user mr-3"></span>NHÀ TUYỂN DỤNG</a>
        </li>
        <li>
            <a href="<c:url value="/admin/manager-careers" />" style="font-size: 13px"><span class="fa fa-paper-plane mr-3"></span>NGÀNH NGHỀ</a>
        </li>
        <li>    
            <a href="<c:url value="/user/log-out" />" style="font-size: 13px"><span class="fa fa-paper-plane mr-3"></span> ĐĂNG XUẤT</a>
        </li>
    </ul>