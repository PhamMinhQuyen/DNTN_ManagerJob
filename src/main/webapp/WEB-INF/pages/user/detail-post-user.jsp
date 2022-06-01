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
        <jsp:include page="../include/user-employer-home/header-user.jsp"/>
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
                                                    <span style="color: #000000;">Địa Điểm Tuyển Dụng: ${post.staff.employer.address}</span>
                                                    </br>
                                                    <span style="color: #000000;">Ngành Nghề: ${post.staff.employer.career}</span>
                                                    </br>
                                                    <span style="color: #000000;">Ngày Đăng: <fmt:formatDate pattern="dd/MM/yyyy" value="${post.postDate}" /></span>
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
                                                    <table style="color: #000000;">
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
                                        <p style="margin-left: 30px; color: #000000;"> ${post.description}</p>
                                    </div>
                                    <h6 style="border-bottom: 1px solid #0091ce;" >QUYỀN LỢI ĐƯỢC HƯỞNG</h6>
                                    <div class="basic-form">
                                        <p style="margin-left: 30px; color: #000000;">${post.right} </p>
                                    </div>
                                    <h6 style="border-bottom: 1px solid #0091ce; ">YÊU CẦU CÔNG VIỆC</h6>
                                    <div class="basic-form">
                                        <p style="margin-left: 30px; color: #000000;">${post.request} </p>
                                    </div>
                                    <h6 style="border-bottom: 1px solid #0091ce;"> THÔNG TIN LIÊN HỆ   </h6>
                                    <div class="basic-form">
                                        <p style="margin-left: 30px; color: #000000;"> ${post.contactInfo} </p>
                                    </div>
                                    </br>
                                    <div class="basic-form">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="inline-editor">
                                                    <div class="basic-form">
                                                        <h5>Thông tin của bạn</h5>
                                                        <mvc:form action="${pageContext.request.contextPath}/user/result-CV/${post.id}"  method="post" modelAttribute="fileRecruitment"
                                                                  enctype="multipart/form-data" id="detail-post-form">
                                                            <div class="form-group">
                                                                <table style="color: #000000;">
                                                                    <tr >
                                                                        <th>Email: </th>
                                                                        <td>${candidate.user.email}</td>
                                                                    </tr> 
                                                                    <tr>
                                                                        <th>Họ và tên:  </th>
                                                                        <td>${candidate.name}</td>
                                                                    </tr> 
                                                                </table>
                                                                <label for="image" class="form" style="font-weight: bold; color: #000000;">Thêm CV của bạn</label>
                                                                <input class="form-control form-upload" name="files" type="file" id="image"> 
                                                                <label class="form-message" style="color: red; "></label>
                                                            </div>
                                                            <c:if test="${fileRecruitment != null}">
                                                                <div class="form-group">
                                                                    <input type="button" class="btn btn-info" value="Đã ứng tuyển" 
                                                                           onclick="location.href = '#'" />
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${fileRecruitment == null}">
                                                                <div class="form-group">
                                                                    <button type="submit" class="btn btn-success">Gửi</button>
                                                                    <input type="button" class="btn btn-info" value="Hủy" 
                                                                           onclick="location.href = '<c:url value="/user/detail-post-user/${post.id}"/>'" />
                                                                </div>
                                                            </c:if>
                                                        </mvc:form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    </br>
                    <jsp:include page="../include/employer/footer.jsp"/>  
                </div>
                <jsp:include page="../include/user-employer-home/js-page.jsp"/>

                <script src="${pageContext.request.contextPath}/resources-home/js/validation.js"></script>
                <script>
                                                                                   // gọi hàm
                                                                                   Validator({
                                                                                       form: '#detail-post-form',
                                                                                       rules: [
                                                                                           Validator.isCV('#image'),
                                                                                       ]
                                                                                   })
                </script>
                </body>
                </html>