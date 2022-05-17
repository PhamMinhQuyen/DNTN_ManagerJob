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
        <title>Gửi mail</title>
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
                                    <h3>GỬI MAIL</h3>
                                    <div class="basic-form">
                                        <mvc:form action="${pageContext.request.contextPath}/employer/result-send-mail"  method="post"
                                                  id="send-mail-form" >
                                            <div class="form-group">
                                                <label class="form" for="email">Người nhận</label>
                                                <span style=color:red;>*</span>
                                                <input type="email" class="form-control input-default"
                                                       placeholder="Nhập email người nhận" id="email" value="${user.email}" name="email"> 
                                                <label class="form-message" style="color: red;"></label> 
                                            </div>
                                            <div class="form-group">
                                                <label class="form" for="title">Chủ đề</label>
                                                <span style=color:red;>*</span>
                                                <input type="text" class="form-control input-default" name="title"
                                                       placeholder="Nhập chủ đề" id="title"  >
                                                <label class="form-message" style="color: red;"></label> 
                                            </div>
                                            <label class="form-group" for="contentMail">Nội dung</label>
                                            <div class="form-group" >
                                                <textarea style="height: 100px;" class="form-control" name="content" id ="contentMail"
                                                          placeholder="Nhập nội dưng" ></textarea>
                                                <label class="form-message" style="color: red;"></label> 
                                            </div>
                                            <button type="submit" class="btn btn-success">Gửi</button>
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
                form: '#send-mail-form',
                rules: [
                    Validator.isEmail('#email'),
                    Validator.isTitle('#title'),
                    Validator.isContent('#contentMail'),
                ]
            })
        </script>
    </body>
</html>