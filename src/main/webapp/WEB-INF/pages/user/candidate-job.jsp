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
        <title>Thông tin công việc</title>
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
                                                class="nav-link active"
                                                id="ex3-tab-2"
                                                data-mdb-toggle="tab"
                                                href="<c:url value="/user/candidate-job" />"
                                                role="tab"
                                                aria-controls="ex3-tabs-2"
                                                aria-selected="true"
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
                                    <h5>THÔNG TIN CÔNG VIỆC</h5>
                                    <mvc:form action="${pageContext.request.contextPath}/user/result-update-candidate-job" method="post"
                                              modelAttribute="candidateJob" id="update-candidate-job-form">
                                        <c:if test="${action == 'update'}">
                                            <input type="text" class="form-control input-default" value="${candidateJob.id}" name="id" hidden>
                                        </c:if>
                                        <div class="basic-form">
                                            <div class="card">
                                            </div>
                                            </br>
                                            <div class="row">
                                                <div class="col-12">
                                                    <input type="text" class="form-control input-default" value="${candidateId}" name="candidate.id" hidden>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <label class="form" for="appliedPosition">Nhập vị trí muốn ứng tuyển</label>
                                                    <span style=color:red;>*</span>
                                                    <input type="text" class="form-control input-default" id="appliedPosition" name="appliedPosition" 
                                                           value="${candidateJob.appliedPosition}" >
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <label class="form" for="rank">Cấp bậc mong muốn</label>
                                                    <select class="form-control" id="rank" name="rank">
                                                        <option></option>
                                                        <c:forEach var="rank" items="${ranks}">
                                                            <c:if test="${rank.name == candidateJob.rank}">
                                                                <option value="${rank.name}" selected>${rank.name}</option>
                                                            </c:if>
                                                            <c:if test="${rank.name != candidateJob.rank}">
                                                                <option value="${rank.name}" >${rank.name}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="salaryMin">Mức lương tối thiểu</label>
                                                    <span style=color:red;>*</span>
                                                    <input type="text" class="form-control "  name="salaryMin"
                                                           placeholder="Nhập họ và tên" id="salaryMin" value="${candidateJob.salaryMin}">
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                                <div class="col">
                                                    <label class="form" for="salaryMax" >Mức lương tối đa</label>
                                                    <span style=color:red;>*</span>
                                                    <input type="text" class="form-control input-default" id="salaryMax"  
                                                           name="salaryMax" value="${candidateJob.salaryMax}">
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="careers">Ngành nghề</label>
                                                    <span style=color:red;>*</span>
                                                    <select class="form-control" id="careers" name="careers.id">
                                                         <option></option>
                                                        <c:forEach var="careers" items="${careerses}">
                                                            <c:if test="${candidateJob.careers.name == careers.name}">
                                                                <option value="${careers.id}" selected>${careers.name}</option>
                                                            </c:if>
                                                            <c:if test="${candidateJob.careers.name != careers.name}">
                                                                <option value="${careers.id}" >${careers.name}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                                <div class="col">
                                                    <label class="form" for="formOfWorking" >Hình thức làm việc</label>
                                                    <span style=color:red;>*</span>
                                                    <select class="form-control" id="formOfWorking" name="formOfWorking">
                                                        <option></option>
                                                        <c:forEach var="working" items="${workings}">
                                                            <c:if test="${candidateJob.formOfWorking == working}">
                                                                <option value="${working}" selected>
                                                                    <c:choose>
                                                                        <c:when test="${working eq 'CONTRACT'}">
                                                                            Hợp đồng
                                                                        </c:when>
                                                                        <c:when test="${working eq 'ALL_THE_TIME'}">
                                                                            Toàn thời gian
                                                                        </c:when>
                                                                        <c:when test="${working eq 'PART_TIME'}">
                                                                            Bán thời gian
                                                                        </c:when>
                                                                        <c:when test="${working eq 'TEMPORARY'}">
                                                                            Tạm thời
                                                                        </c:when>
                                                                    </c:choose>
                                                                </option>
                                                            </c:if>
                                                            <c:if test="${candidateJob.formOfWorking != working}">
                                                                <option value="${working}" >
                                                                    <c:choose>
                                                                        <c:when test="${working eq 'CONTRACT'}">
                                                                            Hợp đồng
                                                                        </c:when>
                                                                        <c:when test="${working eq 'ALL_THE_TIME'}">
                                                                            Toàn thời gian
                                                                        </c:when>
                                                                        <c:when test="${working eq 'PART_TIME'}">
                                                                            Bán thời gian
                                                                        </c:when>
                                                                        <c:when test="${working eq 'TEMPORARY'}">
                                                                            Tạm thời
                                                                        </c:when>
                                                                    </c:choose>
                                                                </option>
                                                            </c:if>

                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <label class="form" for="target">Mục tiêu nghề nghiệp</label>
                                                    <textarea style="height: 200px;" class="form-control" placeholder="Nhập mục tiêu" 
                                                              id="target" name="target">${candidateJob.target}</textarea>
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                            </div>
                                        </div>
                                        </br>
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
                form: '#update-candidate-job-form',
                rules: [
                    Validator.isAppliedPosition('#appliedPosition'),
                    Validator.isRank('#rank'),
                    Validator.isCareers('#careers'),
                    Validator.isSalaryMin('#salaryMin'),
                    Validator.isSalaryMax('#salaryMax'),
                    Validator.isFormOfWorking('#formOfWorking'),
                    Validator.isTarget('#target'),
                ]
            })
        </script>
    </body>
</html>