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
        <title>Hồ sơ ứng tuyển</title>
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
                    <img src="<c:url value="/resources-home/img/company/"/>${staff.employer.logo}" width="100px" height="100px;"  style="margin-left: 65px;
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
                                    <h4>DANH SÁCH HỒ SƠ ỨNG TUYỂN</h4>
                                    </br>
                                    <div class="row padding-bottom-10px">
                                        <div class="col-12 col-lg-6">

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
                                                    <th>STT</th>
                                                    <th>Tiêu đề</th>
                                                    <th>Tên ứng viên</th>
                                                    <th>Học vấn</th>
                                                    <th>Số điện thoại</th>
                                                    <th>Ngày nộp</th>
                                                    <th scope="col">Thao tác</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:if test="${files != null && fn:length(files) > 0}">
                                                    <c:forEach items="${files}" var="file" >
                                                        <tr>
                                                            <th>làm sau</th>
                                                            <th>${file.post.name}</th>
                                                            <th>${file.candidate.name}</th>
                                                            <th><c:forEach items="${file.candidate.educations}" var="education">
                                                                    ${education.school}, 
                                                                </c:forEach></th>
                                                            <th>${file.candidate.phone}</th>
                                                            <th>${file.dateOfFiling}</th>
                                                            <td>
                                                                <span>
                                                                    <a href="<c:url value="/employer/detail-file-recruitment/${file.id}" />">Xem chi tiết</a>
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