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
        <title>Học vấn</title>
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
                        <img src="<c:url value="/resources/img/user/"/>${candidate.image}" width="100px" height="100px;"  style="margin-left: 65px;
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
                                                href="<c:url value="/user/candidate-job" />"
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
                                                class="nav-link active"
                                                id="ex3-tab-3"
                                                data-mdb-toggle="tab"
                                                href="<c:url value="/user/education" />"
                                                role="tab"
                                                aria-controls="ex3-tabs-3"
                                                aria-selected="true"
                                                >Học vấn</a
                                            >
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <a
                                                class="nav-link"
                                                id="ex3-tab-3"
                                                data-mdb-toggle="tab"
                                                href="<c:url value="/user/skill" />"
                                                role="tab"
                                                aria-controls="ex3-tabs-3"
                                                aria-selected="false"
                                                >Kỹ năng chuyên môn</a
                                            >
                                        </li>
                                    </ul>
                                    <c:if test="${message != null || message !=''}">
                                        <div class="alert alert-${type}">
                                            ${message}
                                        </div>
                                    </c:if>
                                    <h5>HỌC VẤN</h5>
                                    <mvc:form action="${pageContext.request.contextPath}/user/result-update-education"  method="post" modelAttribute="education"
                                              id="update-education-form">
                                        <c:if test="${action == 'update'}">
                                            <input type="text" class="form-control" name="id"
                                                   value="${education.id}" hidden>    
                                        </c:if>
                                        <div class="basic-form">
                                            <div class="card">
                                            </div>
                                            </br>
                                            <div class="row">
                                                <div class="col-12">
                                                    <label class="form" for="degree">Bằng cấp cao nhất</label>
                                                    <span style=color:red;>*</span>
                                                    <select class="form-control" id="degree" name="degree">
                                                        <option></option>
                                                        <c:forEach items="${degrees}" var="degree">
                                                            <c:if test="${degree.name == education.degree}">
                                                                <option selected >${degree.name}</option>
                                                            </c:if>
                                                            <c:if test="${degree.name != education.degree}">
                                                                <option>${degree.name}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="school">Trường</label>
                                                    <span style=color:red;>*</span>
                                                    <input type="text" class="form-control input-default" id="school" name="school"
                                                           value="${education.school}" >
                                                    <label class="form-message" style="color: red; "></label> 
                                                </div>
                                                <div class="col">
                                                    <label class="form" for="graduationTime">Thời gian tốt nghiệp</label>
                                                    <span style=color:red;>*</span>
                                                    <input type="date" class="form-control" name="graduationTime" value="${education.graduationTime}"
                                                           id="graduationTime"> 
                                                    <label class="form-message" style="color: red; "></label> 
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="foreignLanguage">Ngoại ngữ</label>
                                                    <span style=color:red;>*</span>
                                                    <select class="form-control" id="foreignLanguage" name="foreignLanguage">
                                                        <option></option>
                                                        <c:forEach var="language" items="${languages}">
                                                            <c:if test="${language.name == education.foreignLanguage}">
                                                                <option selected>${language.name}</option>
                                                            </c:if>
                                                            <c:if test="${language.name != education.foreignLanguage}">
                                                                <option >${language.name}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                    <label class="form-message" style="color: red; "></label> 
                                                </div>

                                                <div class="col">
                                                    <label class="form" for="level">Trình độ</label>
                                                    <span style=color:red;>*</span>
                                                    <select class="form-control" id="level" name="level">
                                                        <option></option>
                                                        <c:forEach var="level" items="${levels}">
                                                            <c:if test="${level.name == education.level}">
                                                                <option selected>${level.name}</option>
                                                            </c:if>
                                                            <c:if test="${level.name != education.level}">
                                                                <option>${level.name}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                    <label class="form-message" style="color: red; "></label> 
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-12">
                                                    <label class="form" for="description">Mô tả chi tiết</label>
                                                    <textarea style="height: 150px;" class="form-control" id="description"
                                                              placeholder="Nhập thông tin liên hệ" name="description" >${education.description}</textarea>
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-12">
                                                    <input type="text" class="form-control" name="candidate.id" value="${candidate.id}"
                                                           hidden > 
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
                form: '#update-education-form',
                rules: [
                    Validator.isDegree('#degree'),
                    Validator.isSchool('#school'),
                    Validator.isGraduationTime('#graduationTime'),
                    Validator.isForeignLanguage('#foreignLanguage'),
                    Validator.isLevel('#level'),
                    Validator.isDescription('#description'),
                ]
            })
        </script>
    </body>
</html>