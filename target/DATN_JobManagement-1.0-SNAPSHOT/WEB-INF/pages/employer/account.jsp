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
        <title>Tài khoản</title>
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
                                    <h3>THÔNG TIN TÀI KHOẢN</h3>
                                    </br>
                                    <div class="basic-form">
                                        <mvc:form action="${pageContext.request.contextPath}/employer/update-account"  method="post" modelAttribute="staff"
                                                  id="account-form">
                                            <c:if test="${action == 'update'}">
                                                <input type="text" class="form-control" name="id"
                                                       value="${staff.id}" hidden>  
                                            </c:if>
                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="name">Họ và tên</label>
                                                    <input type="text" class="form-control input-default" value="${staff.name}"
                                                           placeholder="Nhập họ và tên" name="name" id="name">
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                                <div class="col">
                                                    <label class="form" for="email">Email</label>
                                                    <input type="text" class="form-control input-default" value="${staff.user.email}"
                                                           placeholder="Nhập email" disabled name="user.email">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="rank">Giới tính</label>
                                                    <select class="form-control" id="gender" name="gender">
                                                        <option></option>
                                                        <c:forEach var="gender" items="${genders}">
                                                            <c:if test="${staff.gender == gender}">
                                                                <option value="${gender}" selected>${gender}</option>
                                                            </c:if>
                                                            <c:if test="${staff.gender != gender}">
                                                                <option value="${gender}">${gender}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                                <div class="col">
                                                    <label class="form" for="birthday">Ngày sinh</label>
                                                    <input type="date" class="form-control input-default" value="${staff.birthday}"
                                                           name="birthday" id="birthday"> 
                                                    <label class="form-message" style="color: red;"></label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="CCCD">Căn cước công dân</label>
                                                    <input type="text" class="form-control input-default" value="${staff.CCCD}"
                                                           placeholder="Nhập CCCD" name="CCCD" id="CCCD">
                                                    <label class="form-message" style="color: red;"></label>
                                                </div>
                                                <div class="col">
                                                    <label class="form" for="phoneNumber">Số điện thoại</label>
                                                    <input type="text" class="form-control input-default" value="${staff.phone}"
                                                           placeholder="Nhập số điện thoại" name="phone" id="phoneNumber">
                                                    <label class="form-message" style="color: red;"></label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="address">Địa chỉ</label>
                                                    <input type="text" class="form-control input-default" value="${staff.address}" name="address"
                                                           placeholder="Nhập địa chỉ" id="address">
                                                    <label class="form-message" style="color: red;"></label>
                                                </div>
                                                <div class="col">
                                                    <input type="text" class="form-control" name="user.id"
                                                           value="${staff.user.id}" hidden>  
                                                </div>
                                            </div>
                                            <div class="col">
                                                <input type="text" class="form-control" name="employer.id"
                                                       value="${staff.employer.id}" hidden>  
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
                form: '#account-form',
                rules: [
                    Validator.isNameStaff('#name'),
                    Validator.isGender('#gender'),
                    Validator.isBirthday('#birthday'),
                    Validator.isCCCD('#CCCD'),
                    Validator.isPhoneNumber('#phoneNumber'),
                    Validator.isAddress('#address'),
                ]
            })
        </script>
    </body>
</html>