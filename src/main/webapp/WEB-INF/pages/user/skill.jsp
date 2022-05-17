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
        <title>Kỹ năng chuyên môn</title>
        <jsp:include page="../include/employer/css-page.jsp"/>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value="/sidebar/css/style.css" />">
    </head>
    <body>
        <jsp:include page="../include/user-employer-home/header-user.jsp"/>
        <section class="banner-area relative" id="home">
            <div class="overlay overlay-bg"></div>
        </section>
        <div class="wrapper d-flex align-items-stretch">
            <nav id="sidebar">
                <div class="avatar">
                    <div class="w-24 rounded-full ring ring-primary ring-offset-base-100 ring-offset-2">
                        <img src="<c:url value="/resources/img/user/"/>${candidate.user.image}" width="100px" height="100px;"  style="margin-left: 65px;
                             margin-top: 10px; margin-bottom:10px;"/>
                    </div>
                </div>
                <jsp:include page="../include/user-employer-home/sidebar-user.jsp"/>
            </nav>
            <div id="content" class="p-4 p-md-5 pt-5">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <ul class="nav nav-tabs nav-justified mb-3" id="ex1" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <a
                                                class="nav-link "
                                                id="ex3-tab-1"
                                                data-mdb-toggle="tab"
                                                href="<c:url value="/user/information-user" />"
                                                role="tab"
                                                aria-controls="ex3-tabs-1"
                                                aria-selected="false"
                                                >Thông tin cá nhân</a
                                            >
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <a
                                                class="nav-link"
                                                id="ex3-tab-2"
                                                data-mdb-toggle="tab"
                                                href="#ex3-tabs-2"
                                                role="tab"
                                                aria-controls="ex3-tabs-2"
                                                aria-selected="false"
                                                >Thông tin công việc</a
                                            >
                                        </li>
                                        <li class="nav-item " role="presentation">
                                            <a
                                                class="nav-link "
                                                id="ex3-tab-3"
                                                data-mdb-toggle="tab"
                                                href="<c:url value="/user/experience" />"
                                                role="tab"
                                                aria-controls="ex3-tabs-3"
                                                aria-selected="false"
                                                >Kinh nghiệm làm việc</a
                                            >
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <a
                                                class="nav-link "
                                                id="ex3-tab-3"
                                                data-mdb-toggle="tab"
                                                href="<c:url value="/user/education" />"
                                                role="tab"
                                                aria-controls="ex3-tabs-3"
                                                aria-selected="false"
                                                >Học vấn</a
                                            >
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <a
                                                class="nav-link active"
                                                id="ex3-tab-3"
                                                data-mdb-toggle="tab"
                                                href="<c:url value="/user/skill" />"
                                                role="tab"
                                                aria-controls="ex3-tabs-3"
                                                aria-selected="true"
                                                >Kỹ năng chuyên môn</a
                                            >
                                        </li>
                                    </ul>
                                    </br>
                                    <mvc:form action="${pageContext.request.contextPath}/user/result-update-skill"  method="post" modelAttribute="skill"
                                              id="information-company-form">
                                        <c:if test="${action == 'update'}">
                                            <input type="text" class="form-control" name="id"
                                                   value="${skill.id}" hidden>    
                                        </c:if>
                                        <h5>KỸ NĂNG CHUYÊN MÔN</h5>
                                        <div class="basic-form">
                                            <div class="card">
                                            </div>
                                            </br>
                                            <div class="row">
                                                <div class="col-12">
                                                    <label class="form" for="name">Kỹ năng chuyên môn</label>
                                                    <span style=color:red;>*</span>
                                                    <input type="text" class="form-control input-default" id="name" name="name" value="${skill.name}"
                                                           >
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-12">
                                                    <label class="form" for="description">Mô tả kỹ năng</label>
                                                    <span style=color:red;>*</span>
                                                    <textarea style="height: 150px;" class="form-control" id="description"
                                                              placeholder="Nhập mô tả kỹ năng" name="description" >${skill.description}"</textarea>
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-12">
                                                    <input type="text" class="form-control input-default"  name="candidate.id" value="${candidate.id}" hidden
                                                           >
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-info">CẬP NHẬT</button>
                                    </mvc:form>
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
                form: '#information-company-form',
                rules: [
                    Validator.isName('#name'),
                    Validator.isPhoneNumber('#phone'),
                    Validator.isScale('#scale'),
                    Validator.isWebsite('#website'),
                    Validator.isCareer('#career'),
                    Validator.isAddress('#address'),
                    Validator.isTaxCode('#taxCode'),
                ]
            })
        </script>
    </body>
</html>