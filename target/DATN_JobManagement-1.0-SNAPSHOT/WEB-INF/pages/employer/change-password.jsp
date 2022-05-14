<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="img/fav.png">
        <meta name="author" content="codepixer">
        <!-- Meta Keyword -->
        <meta name="keywords" content="">
        <meta charset="UTF-8">
        <title>Thay đổi mật khẩu</title>
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
                                    <h3>THAY ĐỔI MẬT KHẨU</h3>
                                    </br>
                                    <div class="basic-form">
                                        <mvc:form action="${pageContext.request.contextPath}/employer/result-change-password"  method="post" modelAttribute="account"
                                                  id="change-password-form">
                                            <c:if test="${action == 'update'}">
                                                <input type="text" class="form-control" name="id"
                                                       value="${account.id}" hidden>
                                                <input type="text" class="form-control" name="role.id"
                                                       value="${account.role.id}" hidden>
                                                <input type="text" class="form-control" name="email"
                                                       value="${account.email}" hidden>
                                                <input type="text" class="form-control" name="image"
                                                       value="${account.image}" hidden>
                                            </c:if>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label class="form" for="password">Mật khẩu cũ</label>
                                                    <input type="text" class="form-control input-default" id="password" name="password"
                                                           placeholder="Nhập mật khẩu cũ">
                                                    <label class="form-message" style="color: red;"></label>
                                                    <c:if test="${message != null || message !=''}">
                                                         <label style="color: red;"> ${message}</label>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label class="form" for="newPassword">Mật khẩu mới</label>
                                                    <input type="text" class="form-control input-default"  id="newPassword"
                                                           placeholder="Nhập mật khẩu mới" name="newPassword">
                                                    <label class="form-message" style="color: red;"></label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label class="form" for="newPasswordConfirm">Nhập lại mật khẩu mới</label>
                                                    <input type="text" class="form-control input-default" 
                                                           placeholder="Nhập lại mật khẩu mới" name="confirmPassword" id="newPasswordConfirm">
                                                    <label class="form-message" style="color: red;"></label>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-success">CẬP NHẬT</button>
                                        </mvc:form>
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
                form: '#change-password-form',
                rules: [
                    Validator.isPassword('#password'),
                    Validator.isNewPassword('#newPassword'),
                    Validator.isNewPasswordConfirm('#newPasswordConfirm'),
                ]
            })
        </script>
    </body>
</html>