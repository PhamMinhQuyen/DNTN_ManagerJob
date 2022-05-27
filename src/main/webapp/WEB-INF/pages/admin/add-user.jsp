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
        <title>Thêm người dùng</title>
        <jsp:include page="../include/employer/css-page.jsp"/>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value="/sidebar/css/style.css" />">
    </head>
    <body>
        <jsp:include page="../include/admin/header.jsp"/>
        <section class="banner-area relative" id="home">
            <div class="overlay overlay-bg"></div>
        </section>
        <div class="wrapper d-flex align-items-stretch">
            <nav id="sidebar">
                <jsp:include page="../include/admin/sidebar.jsp"/>
            </nav>
            <div id="content" class="p-4 p-md-5 pt-5">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <c:if test="${action == 'add'}">
                                        <h4>THÊM NGƯỜI DÙNG</h4>
                                    </c:if>
                                    <c:if test="${action == 'update'}">
                                        <h4>CẬP NHẬT NGÀNH NGHỀ</h4>
                                    </c:if>
                                    </br>
                                    <div class="table-responsive">
                                        <div class="basic-form">
                                            <mvc:form id="add-user-form" action="${pageContext.request.contextPath}/admin/result-add-careers"  method="post" modelAttribute="careers">
                                                <c:if test="${action == 'update'}">
                                                    <input type="text" class="form-control input-default"
                                                           name="id" id="id" value="${careers.id}" hidden>
                                                </c:if>
                                                <div class="form-group">
                                                    <label class="form" for="email">Email</label>
                                                    <span style=color:red;>*</span>
                                                    <input type="email" class="form-control input-default" value="${careers.name}"
                                                           name="name" id="email">
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>

                                                <div class="form-group">
                                                    <label class="form" for="password">Mật Khẩu</label>
                                                    <span style=color:red;>*</span>
                                                    <input type="password" class="form-control input-default" value="${careers.name}"
                                                           name="name" id="password">
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                                <div class="form-group">
                                                    <label class="form" for="role">Vai Trò</label>
                                                    <span style=color:red;>*</span>
                                                    <select class="form-control " id="role">
                                                        <option></option>
                                                        <option>Nhà Tuyển Dụng</option>
                                                        <option>Ứng Viên</option>
                                                    </select>
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                                <c:if test="${action == 'add'}">
                                                    <button type="submit" class="btn btn-success">Thêm</button>
                                                </c:if>
                                                <c:if test="${action == 'update'}">
                                                    <button type="submit" class="btn btn-success">Cập Nhật</button>
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

        <jsp:include page="../include/employer/footer.jsp"/>
        <jsp:include page="../include/user-employer-home/js-page.jsp"/>

        <script src="${pageContext.request.contextPath}/resources-home/js/validation.js"></script>
        <script>
            // gọi hàm
            Validator({
                form: '#add-user-form',
                rules: [
                    Validator.isCareers('#name'),
                ]
            })
        </script>
    </body>
</html>