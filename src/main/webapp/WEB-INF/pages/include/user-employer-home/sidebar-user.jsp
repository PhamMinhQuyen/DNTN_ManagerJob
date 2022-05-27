<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="list-unstyled components mb-5">
    <li class="active">
        <a href="<c:url value="/user/home-candidate"/>" style="font-size: 13px" ><span class="fa fa-home mr-3"></span> TRANG CHỦ</a>
    </li>
    <li>
        <a href="<c:url value="/user/information-user" />" style="font-size: 13px"><span class="fa fa-user mr-3"></span>QUẢN LÝ HỒ SƠ</a>
    </li>
    <li>
        <a href="<c:url value="/user/file-recruitment"/>" style="font-size: 13px"><span class="fa fa-automobile mr-3"></span>VIỆC LÀM ĐÃ NỘP</a>
    </li>
    <li>
        <a href="<c:url value="/user/change-password-user" />" style="font-size: 13px"><span class="fa fa-paper-plane mr-3"></span>THAY ĐỔI MẬT KHẨU</a>
    </li>
    <li>
        <a href="<c:url value="/user/log-out" />" style="font-size: 13px"><span class="fa fa-paper-plane mr-3"></span> ĐĂNG XUẤT</a>
    </li>
</ul>