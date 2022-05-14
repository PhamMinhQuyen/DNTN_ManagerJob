<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <ul class="list-unstyled components mb-5">
        <li class="active">
            <a href="<c:url value="/employer/home"/>" style="font-size: 13px" ><span class="fa fa-home mr-3"></span> TRANG CHỦ</a>
        </li>
        <li>
            <a href="<c:url value="/employer/account"/>" style="font-size: 13px"><span class="fa fa-user mr-3"></span>THÔNG TIN TÀI KHOẢN</a>
        </li>
        <li>
            <a href="<c:url value="/employer/information-company" />" style="font-size: 13px"><span class="fa fa-user mr-3"></span> THÔNG TIN CÔNG TY</a>
        </li>
        <li>
            <a href="<c:url value="/employer/add-job"/>" style="font-size: 13px"><span class="fa fa-automobile mr-3"></span>ĐĂNG TIN TUYỂN DỤNG</a>
        </li>
        <li>
            <a href="<c:url value="/employer/list-post/${staff.id}" />" style="font-size: 13px"><span class="fa fa-paper-plane mr-3"></span>DANH SÁCH BÀI ĐĂNG</a>
        </li>
        <li>
            <a href="<c:url value="/employer/file-recruitment" />" style="font-size: 13px"><span class="fa fa-paper-plane mr-3"></span> HỒ SƠ ỨNG TUYỂN</a>
        </li>
        <li>
            <a href="<c:url value="/employer/change-password" />" style="font-size: 13px"><span class="fa fa-paper-plane mr-3"></span>THAY ĐỔI MẬT KHẨU</a>
        </li>
        <li>
            <a href="<c:url value="/user/log-out" />" style="font-size: 13px"><span class="fa fa-paper-plane mr-3"></span> ĐĂNG XUẤT</a>
        </li>
    </ul>