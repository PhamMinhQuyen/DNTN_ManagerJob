<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="img/fav.png">
        <meta name="author" content="codepixer">
        <!-- Meta Keyword -->
        <meta name="keywords" content="">
        <meta charset="UTF-8">
        <title>Danh sách bài đăng</title>
        <jsp:include page="../include/employer/css-page.jsp"/>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value="/sidebar/css/style.css" />">
    </head>
    <body>
        <jsp:include page="../include/employer/header-employer.jsp"/>
        <section class="banner-area relative" id="home">
            <div class="overlay overlay-bg"></div>
        </section>
        <div class="wrapper d-flex align-items-stretch">
            <nav id="sidebar">
                <div class="avatar">
                    <div class="w-24 rounded-full ring ring-primary ring-offset-base-100 ring-offset-2">
                        <img src="<c:url value="/resources-home/img/company/"/>${employer.logo}" width="100px" height="100px;"  style="margin-left: 65px;
                             margin-top: 10px; margin-bottom:10px;"/>
                    </div>
                </div>
                <jsp:include page="../include/employer/sidebar.jsp"/>
            </nav>
            <div id="content" class="p-4 p-md-5 pt-5">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4>DANH SÁCH TIN TUYỂN DỤNG</h4>
                                    <c:if test="${message != null || message !=''}">
                                        <div class="alert alert-${type}">
                                            ${message}
                                        </div>
                                    </c:if>
                                    <div class="row padding-bottom-10px">
                                        <div class="col-12 col-lg-6">
                                            <button class="btn btn-primary"
                                                    onclick="location.href = '<c:url value="/employer/add-job"/>'">Thêm tin tuyển dụng</button>
                                        </div>
                                        <div class="col-12 col-lg-6">
                                            <form action="${pageContext.request.contextPath}/employer/searchTitle" method="post"
                                                  class="form-inline float-right">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="name" placeholder="Nhập tiêu đề"/>
                                                    <input type="submit" class="btn btn-secondary" value="Tìm kiếm" />
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    </br>
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>STT</th>
                                                    <th>Tiêu đề</th>
                                                    <th>Số lượng</th>
                                                    <th>Mức lương</th>
                                                    <th>Ngành</th>
                                                    <th>Ngày đăng</th>
                                                    <th scope="col">Thao tác</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${posts.content}" var="post" varStatus="status">
                                                    <tr>
                                                        <td>${status.count}</td>
                                                        <td>${post.name}</td>
                                                        <td>${post.quantity}</td>
                                                        <td>${post.wage}</td>
                                                        <td>${post.careers.name}</td>
                                                        <td>
                                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${post.postDate}" />
                                                        </td>
                                                        <td>
                                                            <span>
                                                                <a href="<c:url value="/employer/update-post/${post.id}"/>" data-toggle="tooltip" data-placement="top" title="Chỉnh sửa"><i class="fa fa-pencil color-muted m-r-5"></i> </a>
                                                                <a href="<c:url value="/employer/delete-post/${post.id}"/>" data-toggle="tooltip" data-placement="top" title="Xóa" style="margin-left: 10px;"><i class="fa fa-close color-danger"></i></a>
                                                            </span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            </br>
                            <nav aria-label="Page navigation example" style="margin-left: 400px;">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="/DATN_JobManagement/employer/list-post/${staff.id}/?page=0">First</a></li>
                                    <li class="page-item"><a class="page-link" href="/DATN_JobManagement/employer/list-post/${staff.id}/?page=${page.number - 1}"><<</a></li>
                                    <li class="page-item"><a class="page-link" href="/DATN_JobManagement/employer/list-post/${staff.id}/?page=0">1</a></li>
                                    <li class="page-item"><a class="page-link" href="/DATN_JobManagement/employer/list-post/${staff.id}/?page=1">2</a></li>
                                    <li class="page-item"><a class="page-link" href="/DATN_JobManagement/employer/list-post/${staff.id}/?page=2">3</a></li>
                                    <li class="page-item"><a class="page-link" href="/DATN_JobManagement/employer/list-post/${staff.id}/?page=${page.number + 1}">>></a></li>
                                    <li class="page-item"><a class="page-link" href="/DATN_JobManagement/employer/list-post/${staff.id}/?page=${page.totalPages - 1}">Last</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../include/employer/footer.jsp"/>
        <jsp:include page="../include/user-employer-home/js-page.jsp"/>
    </body>
</html>