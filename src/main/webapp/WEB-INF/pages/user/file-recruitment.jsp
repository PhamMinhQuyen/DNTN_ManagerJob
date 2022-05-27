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
        <title>Quản lý việc làm</title>
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
            <nav id="sidebar">
                <div class="avatar">
                    <div class="w-24 rounded-full ring ring-primary ring-offset-base-100 ring-offset-2">
                        <img src="<c:url value="/resources/img/user/"/>${candidate.user.image}" width="100px" height="100px;"  style="margin-left: 65px;
                             margin-top: 10px; margin-bottom:10px;"/>
                    </div>
                </div>
                <jsp:include page="../include/user-employer-home/sidebar-user.jsp"/>
            </nav>
            <div id="content" class="p-4 p-md-5 pt-5">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4>DANH SÁCH VIỆC LÀM ĐÃ NỘP</h4>
                                    </br>
                                    </br>
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Logo</th>
                                                    <th>Tên công ty</th>
                                                    <th>Tên công việc</th>
                                                    <th>Lương</th>
                                                    <th>Ngày nộp</th>
                                                    <th>Thao tác</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:if test="${fileRecruitments != null && fn:length(fileRecruitments) > 0}">
                                                    <c:forEach items="${fileRecruitments}" var="fileRecruitment">
                                                        <tr>
                                                            <td><img src="<c:url value="/resources-home/img/company/"/>${fileRecruitment.post.staff.employer.logo}" width="50px;" height="40px;" /></td>
                                                            <td>${fileRecruitment.post.staff.employer.name}</td>
                                                            <td><a href="<c:url value="/user/detail-post/${fileRecruitment.post.id}" />">${fileRecruitment.post.name}</a></td>
                                                            <td>${fileRecruitment.post.wage}</td>
                                                            <td>
                                                                <fmt:formatDate pattern="dd/MM/yyyy" value="${fileRecruitment.dateOfFiling}" />
                                                            </td>
                                                            <td><button class="btn btn-danger"
                                                                        onclick="location.href = '<c:url value="/user/delete-fileRecruitment/${fileRecruitment.id}"/>'">Xóa</button></th>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../include/employer/footer.jsp"/>
        <jsp:include page="../include/user-employer-home/js-page.jsp"/>
    </body>
</html>