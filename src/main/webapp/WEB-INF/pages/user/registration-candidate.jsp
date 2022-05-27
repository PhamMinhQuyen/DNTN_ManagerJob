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
        <title>Đăng ký</title>
        <jsp:include page="../include/employer/css-page.jsp"/>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value="/sidebar/css/style.css" />">

        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="<c:url value="/login/vendor/bootstrap/css/bootstrap.min.css " />">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="<c:url value="/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="<c:url value="/login/fonts/iconic/css/material-design-iconic-font.min.css" />">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="<c:url value="/login/vendor/animate/animate.css" />">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="<c:url value="/login/vendor/css-hamburgers/hamburgers.min.css" />">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="<c:url value="/login/vendor/animsition/css/animsition.min.css" />">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="<c:url value="/login/vendor/select2/select2.min.css" />">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="<c:url value="/login/vendor/daterangepicker/daterangepicker.css" />">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="<c:url value="/login/css/util.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/login/css/main.css" />">
        <!--===============================================================================================-->
    </head>
    <body>
        <jsp:include page="../include/employer/header.jsp"/>
        <section class="banner-area relative" id="home">
            <div class="overlay overlay-bg"></div>

        </section>
        <div class="limiter">
            <div class="container-login100" style="background-image: url('images/bg-01.jpg');">
                <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                    <mvc:form class="login100-form validate-form" action="${pageContext.request.contextPath}/user/resultRegistrationCandidate" 
                              method="post" modelAttribute="candidate" id="registration-candidate-form">
                        <span class="login100-form-title p-b-49">
                            ĐĂNG KÝ
                        </span>
                        
                         <div class="wrap-input100 validate-input m-b-23" >
                            <label class="label-input100" for="name" >Họ và tên</label>
                            <input class="input100" type="text" name="name" placeholder="Nhập vào họ và tên" id="name">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                            <label class="form-message" style="color: red; "></label> 
                        </div>
                        
                        <div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
                            <label class="label-input100" for="email">Email</label>
                            <input class="input100" type="email" name="email" placeholder="Nhập vào địa chỉ email"
                                   id="email">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                            <label class="form-message" style="color: red; "></label> 
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="Password is required">
                            <label class="label-input100" for="password">Mật khẩu</label>
                            <input class="input100" type="password" name="password" placeholder="Nhập vào mật khẩu"
                                   id="password">
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                            <label class="form-message" style="color: red; "></label> 
                        </div>
                        </br>
                       
                        <div class="wrap-input100 validate-input m-b-23" >
                            <label class="label-input100" for="phonenumber">Số điện thoại </label>
                            <input class="input100" type="text" name="phone" placeholder="Nhập vào số điện thoại"
                                   id="phonenumber">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                            <label class="form-message" style="color: red; "></label> 
                        </div>
                        
                        <div class="wrap-input100 validate-input m-b-23" >
                            <label class="label-input100" for="address">Địa chỉ</label>
                            <input class="input100" type="text" name="address" placeholder="Nhập vào địa chỉ"
                                   id="address">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                            <label class="form-message" style="color: red; "></label> 
                        </div>
                        
                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button class="login100-form-btn" type="submit">
                                    Đăng ký
                                </button>
                            </div>
                        </div>
                    </mvc:form>
                </div>
            </div>
        </div>


        <div id="dropDownSelect1"></div>



        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>


        <jsp:include page="../include/employer/footer.jsp"/>
        <jsp:include page="../include/user-employer-home/js-page.jsp"/>
        
         <script src="${pageContext.request.contextPath}/resources-home/js/validation.js"></script>
         <script>
            // gọi hàm
            Validator({
                form: '#registration-candidate-form',
                rules: [
                    Validator.isNameStaff('#name'),
                    Validator.isEmail('#email'),
                    Validator.isPassword('#password'),
                    Validator.isPhoneNumber('#phonenumber'),
                    Validator.isAddress('#address'),
                ]
            });
          </script>  
    </body>
</html>