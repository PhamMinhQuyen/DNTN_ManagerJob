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
            <jsp:include page="../include/employer/sidebar.jsp"/>
            <div id="content" class="p-4 p-md-5 pt-5">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h3>GỬI MAIL</h3>
                                    <div class="basic-form">
                                        <mvc:form action="${pageContext.request.contextPath}/employer/result-send-mail"  method="post" >
                                            <div class="form-group">
                                                <label class="form" style="font-weight: bold;">To:</label>
                                                <input type="text" class="form-control input-default"
                                                       placeholder="Nhập email người nhận" value="${user.email}" name="to">
                                            </div>
                                             <div class="form-group">
                                                <label class="form" style="font-weight: bold;">From:</label>
                                                <input type="text" class="form-control input-default"
                                                       placeholder="Nhập email người gửi" value="${staff.user.email}" name="from">
                                            </div>
                                            <label class="form" style="font-weight: bold;">Body:</label>
                                            <div class="input-group" >
                                                <textarea style="height: 100px;" class="form-control" name="content"
                                                          placeholder="Nhập nội dưng" ></textarea>
                                            </div>
                                            </br>
                                            <div class="form-group">
                                                 <button type="submit" class="btn btn-success">Gửi mail</button>
                                            </div>
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
    </body>
</html>