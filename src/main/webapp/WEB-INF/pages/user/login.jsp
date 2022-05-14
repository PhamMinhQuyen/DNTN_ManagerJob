<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="img/fav.png">
        <meta name="author" content="codepixer">
        <meta name="keywords" content="">
        <meta charset="UTF-8">
        <title>Đăng nhập</title>
        <jsp:include page="../include/employer/css-page.jsp"/>
    </head>

    <body>
        <jsp:include page="../include/employer/header.jsp"/>
        <section class="banner-area relative" id="home">
            <div class="overlay overlay-bg"></div>
        </section>
        <div id="preloader">
            <div class="loader">
                <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
                </svg>
            </div>
        </div>
        <section class="h-100 gradient-form" style="background-color: #eee;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-10">
                        <div class="card rounded-3 text-black">
                            <div class="row g-0">
                                <div class="col-lg-6">
                                    <div class="card-body p-md-5 mx-md-4">
                                        <div class="text-center" style="margin-left: 280px; width: 200px">
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/lotus.webp"
                                                 style="width: 185px;" alt="logo">
                                            <h4 class="mt-1 mb-5 pb-1">Đăng nhập</h4>
                                        </div>
                                        <mvc:form  id="login-form" action="${pageContext.request.contextPath}/user/checkLogin"  method="post" modelAttribute="user">
                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="email" style="margin-left: 270px;">Email</label>
                                                <input type="email" id="email" class="form-control"
                                                       placeholder="Nhập vào email đăng nhập" style="margin-left: 270px;" name="email"/>
                                                <label class="form-message" style="color: red; width: 200px; margin-left: 270px;"></label> 
                                            </div>
                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="password" style="margin-left: 270px; width: 200px;">Mật khẩu</label>
                                                <input type="password" id="password" class="form-control"
                                                       placeholder="Nhập vào mật khẩu" style="margin-left: 270px;" name="password" id="password"/>
                                                  <label class="form-message" style="color: red; width: 200px; margin-left: 270px;"></label> 
                                            </div>
                                            <div class="text-center pt-1 mb-5 pb-1">
                                                <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit">Đăng nhập</button>
                                                <label class="form-label" for="form2Example11"  width: 300px;">Quên mật khẩu?</label>
                                            </div>
                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="form2Example11" style="margin-left: 270px; width: 250px;">Bạn chưa có tài khoản?<a href="#">Đăng ký</a></label>
                                            </div>
                                        </mvc:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="../include/employer/footer.jsp"/>
        <jsp:include page="../include/employer/js-page.jsp"/>
        
        <script src="${pageContext.request.contextPath}/resources-home/js/validation.js"></script>
         <script>
                // gọi hàm
                Validator({
                    form: '#login-form',
                    rules: [
                        Validator.isEmail('#email'), 
                        Validator.isPassword('#password'), 
                    ]
                })
            </script>
    </body>
</html>
