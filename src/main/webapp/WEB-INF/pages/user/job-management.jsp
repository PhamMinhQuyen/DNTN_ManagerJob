<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        <jsp:include page="../include/employer/header-employer.jsp"/>
        <section class="banner-area relative" id="home">
            <div class="overlay overlay-bg"></div>
        </section>
        <div class="wrapper d-flex align-items-stretch">
            <jsp:include page="../include/user-employer-home/sidebar-user.jsp"/>
            <div id="content" class="p-4 p-md-5 pt-5">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4>VIỆC LÀM ĐÃ NỘP</h4>
                                    </br>
                                    <div class="row padding-bottom-10px">
                                        <div class="col-12 col-lg-6">
                                            <button class="btn btn-primary"
                                                    onclick="location.href = '<c:url value="/employer/add-job"/>'">Tạo tin tuyển dụng</button>
                                        </div>
                                        <div class="col-12 col-lg-6">
                                            <form action="${pageContext.request.contextPath}/search" method="post"
                                                       class="form-inline float-right">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="strSearch" />
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
                                                    <th>Tiêu đề</th>
                                                    <th>Số lượng</th>
                                                    <th>Mức lương</th>
                                                    <th>Ngành</th>
                                                    <th>Ngày đăng</th>
                                                    <th scope="col">Thao tác</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:if test="${posts != null && fn:length(posts) > 0}">
                                                    <c:forEach items="${posts}" var="post">
                                                        <tr>
                                                            <th>${post.name}</th>
                                                            <th>${post.quantity}</th>
                                                            <th>${post.wage}</th>
                                                            <th>${post.careers.name}</th>
                                                            <th>${post.postDate}</th>
                                                            <td>
                                                                <span>
                                                                    <a href="<c:url value="/employer/update-post/${post.id}"/>" data-toggle="tooltip" data-placement="top" title="Chỉnh sửa"><i class="fa fa-pencil color-muted m-r-5"></i> </a>
                                                                    <a href="<c:url value="/employer/delete-post/${post.id}"/>" data-toggle="tooltip" data-placement="top" title="Xóa" style="margin-left: 10px;"><i class="fa fa-close color-danger"></i></a>
                                                                </span>
                                                            </td>
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