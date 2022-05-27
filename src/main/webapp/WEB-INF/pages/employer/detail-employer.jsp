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
        <title>Chi tiết nhà tuyển dụng</title>
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
                                    <h3>CHI TIẾT NHÀ TUYỂN DỤNG</h3>
                                    <div class="basic-form">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="inline-editor" style="float: right; margin-right: 450px;" >
                                                    <h4 style="color: #2980b9;">${employer.name}</h4>
                                                    <span>Địa chỉ: ${employer.address}</span>
                                                    </br>
                                                    <span>Ngành nghề: ${employer.career}</span>
                                                    </br>
                                                    <span>Quy mô công ty: ${employer.scale}</span>
                                                </div>
                                                <div class="inline-editor">
                                                    <img src="<c:url value="/resources-home/img/company/"/>${employer.logo}" width="120px;" height="140px;"
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
                                                    <h5 style="margin-left: 10px;"> VIỆC LÀM ĐANG TUYỂN</h5>
                                                    <div class="col-lg-8 post-list">
                                                        <c:forEach items="${posts}" var="post">
                                                            <div class="single-post d-flex flex-row" style="height: 170px;">
                                                                <div class="thumb" style="margin-right: 80px;">
                                                                    <img style="height: 100px; width: 150px;" src="<c:url value="/resources-home/img/company/${post.staff.employer.logo}" />" alt="">
                                                                </div>
                                                                <div class="details">
                                                                    <div class="title d-flex flex-row justify-content-between">
                                                                        <div class="titles">
                                                                            <a href="<c:url value="/user/detail-post/${post.id}" />"><h4 style="color: #2980b9;">${post.name}</h4></a>
                                                                            <h6 style="color: #2980b9;">${post.staff.employer.name}</h6>					
                                                                        </div>
                                                                    </div>
                                                                    <p></span>Lương: ${post.wage}</p>
                                                                    <p>Ngày đăng: <fmt:formatDate pattern="dd/MM/yyyy" value="${post.postDate}" /></p>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
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