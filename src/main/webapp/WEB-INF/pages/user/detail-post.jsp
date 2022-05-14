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
                                                <div class="inline-editor" style="float: right; margin-right: 390px;" >
                                                    <table>
                                                        <tr>
                                                            <th><h4 style="color: #2980b9;">${post.name}</h4></th>
                                                        </tr>
                                                        <tr>
                                                            <th><h5>${post.staff.employer.name}</h5></th>
                                                        </tr>
                                                        <tr>
                                                            <th>Địa diểm tuyển dụng: </th>
                                                            <td>${post.staff.employer.address}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Ngành nghề:</th>
                                                            <td>${post.staff.employer.career}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Ngày đăng:</th>
                                                            <td><fmt:formatDate pattern="dd/MM/yyyy" value="${post.postDate}" /></td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="inline-editor">
                                                    <img src="<c:url value="/resources-home/img/company/"/>${post.staff.employer.logo}" width="120px;" height="140px;"/>
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
                                    <h6>MÔ TẢ CÔNG VIỆC</h6>
                                    <div class="basic-form">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="inline-editor">
                                                    <table>
                                                        <tr>
                                                            <td>- ${post.description}</td>
                                                        </tr>

                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </br>
                                    <h6>QUYỀN LỢI ĐƯỢC HƯỞNG</h6>
                                    <div class="basic-form">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="inline-editor">
                                                    <table>
                                                        <tr>
                                                            <td>- ${post.right}</td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </br>
                                    <h6>YÊU CẦU CÔNG VIỆC</h6>
                                    <div class="basic-form">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="inline-editor">
                                                    <table>
                                                        <tr>
                                                            <td>- ${post.request}</td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        </br>
                                        <h6>THÔNG TIN LIÊN HỆ   </h6>
                                        <div class="basic-form">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="inline-editor">
                                                        <table>
                                                            <tr>
                                                                <td>- ${post.contactInfo}</td>
                                                            </tr>
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
                                                        <div class="basic-form">
                                                            <h5>Thông tin của bạn</h5>
                                                            <mvc:form action="${pageContext.request.contextPath}/user/result-CV/${post.id}"  method="post" modelAttribute="fileRecruitment"
                                                                      enctype="multipart/form-data">
                                                                <div class="form-group">
                                                                    <table>
                                                                         <tr>
                                                                            <th>Email: </th>
                                                                            <td>${candidate.user.email}</td>
                                                                        </tr> 
                                                                        <tr>
                                                                            <th>Họ và tên:  </th>
                                                                            <td>${candidate.name}</td>
                                                                        </tr> 
                                                                    </table>
                                                                    <label class="form" style="font-weight: bold;">Thêm CV của bạn</label>
                                                                    <input class="form-control form-upload" name="files" type="file"> 
                                                                </div>
<!--                                                                <label class="form" style="font-weight: bold;">Gửi nội dung cho nhà tuyển dụng</label>
                                                                <div class="input-group" >
                                                                    <textarea style="height: 100px;" class="form-control" name="content"
                                                                              placeholder="Nhập nội dưng" ></textarea>
                                                                </div>-->
                                                                <div class="form-group">
                                                                    <button type="submit" class="btn btn-success">Gửi</button>
                                                                </div>
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

                    </div>
                                                            </br>
                    <jsp:include page="../include/employer/footer.jsp"/>  
                </div>
                <jsp:include page="../include/user-employer-home/js-page.jsp"/>
                </body>
                </html>