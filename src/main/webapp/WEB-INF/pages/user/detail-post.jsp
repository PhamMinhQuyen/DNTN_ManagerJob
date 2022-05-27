<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="img/fav.png">
        <meta name="author" content="codepixer">
        <!-- Meta Keyword -->
        <meta name="keywords" content="">
        <meta charset="UTF-8">
        <title>Chi tiết bài đăng</title>
        <jsp:include page="../include/employer/css-page.jsp"/>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value="/sidebar/css/style.css" />">
    </head>
    <body>
        <header id="header" id="home">
            <div class="container">
                <div class="row align-items-center justify-content-between d-flex">
                    <div id="logo">
                        <a href="<c:url value="/user/" />"><img src="<c:url value="/resources-home/img/logo.png" />" alt="" title="" /></a>
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
        </section>
        <div class="wrapper d-flex align-items-stretch">
            <div id="content" class="p-4 p-md-5 pt-5">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card" style="width: 949px; margin-left: 221px;">
                                <div class="card-body">
                                    <h3>CHI TIẾT BÀI ĐĂNG</h3>
                                    <div class="basic-form">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="inline-editor" style="float: right; margin-right: 380px;" >
                                                    <h4 style="color: #2980b9;">${post.name}</h4>
                                                    <h5>${post.staff.employer.name}</h5>
                                                    <span>Địa Điểm Tuyển Dụng: ${post.staff.employer.address}</span>
                                                    </br>
                                                    <span>Ngành Nghề: ${post.staff.employer.career}</span>
                                                     </br>
                                                    <span>Ngày Đăng: <fmt:formatDate pattern="dd/MM/yyyy" value="${post.postDate}" /></span>
                                                </div>
                                                <div class="inline-editor">
                                                    <img src="<c:url value="/resources-home/img/company/"/>${post.staff.employer.logo}" width="120px;" height="140px;"
                                                         style="border: 2px solid #ced4da;" />
                                                             
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </br>
                                    <div class="basic-form">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="inline-editor">
                                                    <table>
                                                        <tr>
                                                            <th>Kinh nghiệm:</th>
                                                            <td>${post.experience}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Yêu cầu chức vụ:</th>
                                                            <td>${post.careers.name}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Yêu cầu giới tính:</th>
                                                            <td>${post.gender}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Số lượng cần tuyển:</th>
                                                            <td>${post.quantity} người</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Mức lương:</th>
                                                            <td>${post.wage}</td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </br>
                                    <h6 style="border-bottom: 1px solid #0091ce;" >MÔ TẢ CÔNG VIỆC</h6>
                                    <div class="basic-form">
                                         <p style="margin-left: 30px;"> ${post.description}</p>
                                    </div>
                                    <h6 style="border-bottom: 1px solid #0091ce;">QUYỀN LỢI ĐƯỢC HƯỞNG</h6>
                                    <div class="basic-form">
                                        <p style="margin-left: 30px;">${post.right} </p>
                                    </div>
                                    <h6 style="border-bottom: 1px solid #0091ce;">YÊU CẦU CÔNG VIỆC</h6>
                                    <div class="basic-form">
                                        <p style="margin-left: 30px;">${post.request} </p>
                                    </div>
                                    <h6 style="border-bottom: 1px solid #0091ce;"> THÔNG TIN LIÊN HỆ   </h6>
                                    <div class="basic-form">
                                          <p style="margin-left: 30px;"> ${post.contactInfo} </p>
                                    </div>
                                    </br>
                                    <button onclick="location.href = '<c:url value="/user/login"/>'" type="button" class="btn btn-success">Ứng tuyển ngay</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                </br>
                <jsp:include page="../include/employer/footer.jsp"/>  
            </div>
            <jsp:include page="../include/user-employer-home/js-page.jsp"/>
    </body>
</html>