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
        <title>Thêm mới công việc</title>
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
                        <img src="<c:url value="/resources-home/img/company/"/>${employer.logo}" width="100px" height="100px;"  style="margin-left: 65px;
                             margin-top: 10px; margin-bottom:10px; "/>
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
                                    <c:if test="${action == 'add'}">
                                        <h3>ĐĂNG TIN TUYỂN DỤNG</h3>
                                    </c:if>
                                    <c:if test="${action == 'update'}">
                                        <h3>CHỈNH SỬA TIN TUYỂN DỤNG</h3>
                                    </c:if>
                                    </br>
                                    <div class="basic-form">
                                        <mvc:form id="job-form" action="${pageContext.request.contextPath}/employer/result-add-job"  method="post" modelAttribute="job">
                                            <c:if test="${action == 'update'}">
                                                <input type="text" class="form-control" name="id"
                                                       value="${job.id}" hidden>
                                            </c:if>
                                            <div class="form-group">
                                                <label class="form" for="title">Tiêu đề</label>
                                                <span style=color:red;>*</span>
                                                <input type="text" class="form-control input-default"
                                                       placeholder="Nhập tiêu đề" name="name" value="${job.name}" id="title">
                                                <label class="form-message" style="color: red;"></label> 
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="rank">Cấp bậc</label>
                                                    <select class="form-control" id="rank" name="rank.id">
                                                        <option></option>
                                                        <c:forEach var="rank" items="${ranks}">
                                                            <c:if test="${rank.id == job.rank.id}">
                                                                <option value="${rank.id}" selected>${rank.name}</option>
                                                            </c:if>
                                                            <c:if test="${rank.id != job.rank.id}">
                                                                <option value="${rank.id}">${rank.name}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                                <div class="col">
                                                    <label class="form" for="gender">Giới tính</label>
                                                    <span style=color:red;>*</span>
                                                    <select class="form-control" id="gender" name="gender"> 
                                                        <option></option>
                                                        <option>Không yêu cầu</option>
                                                        <c:if test="${job.gender == 'Nam'}">
                                                            <option selected>Nam</option>
                                                        </c:if>
                                                        <c:if test="${job.gender != 'Nam'}">
                                                            <option >Nam</option>
                                                        </c:if>
                                                        <c:if test="${job.gender == 'Nữ'}">
                                                            <option selected>Nữ</option>
                                                        </c:if>
                                                        <c:if test="${job.gender != 'Nữ'}">
                                                            <option >Nữ</option>
                                                        </c:if>
                                                    </select>
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="experience">Kinh nghiệm</label>
                                                    <select class="form-control" id="experience" name="experience">
                                                        <option></option>
                                                        <option>Không yêu cầu</option>
                                                        <c:if test="${job.experience == 'Có kinh nghiệm'}">
                                                            <option selected>Có kinh nghiệm</option>
                                                        </c:if>
                                                        <c:if test="${job.experience != 'Có kinh nghiệm'}">
                                                            <option >Có kinh nghiệm</option>
                                                        </c:if>
                                                        <c:if test="${job.experience == 'Chưa có kinh nghiệm'}">
                                                            <option selected>Chưa có kinh nghiệm</option>
                                                        </c:if>
                                                        <c:if test="${job.experience != 'Chưa có kinh nghiệm'}">
                                                            <option >Chưa có kinh nghiệm</option>
                                                        </c:if>
                                                    </select>
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                                <div class="col">
                                                    <label class="form" for="quantity">Số lượng cần tuyển</label>
                                                    <span style=color:red;>*</span>
                                                    <input class="form-control" type="number" min="0" name="quantity" id="quantity" value="${job.quantity}"/>
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="form" for="careers">Ngành nghề</label>
                                                <span style=color:red;>*</span>
                                                <select class="form-control" id="careers" name="careers.id">
                                                    <option></option>
                                                    <c:forEach var="careers" items="${careerses}">
                                                        <c:if test="${careers.id == job.careers.id}">
                                                            <option value="${careers.id}" selected>${careers.name}</option>
                                                        </c:if>
                                                        <c:if test="${careers.id != job.careers.id}">
                                                            <option value="${careers.id}" >${careers.name}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                                <label class="form-message" style="color: red;"></label> 
                                            </div>
                                            <div class="form-group">
                                                <label class="form" for="wage">Lương hàng tháng</label>
                                                <span style=color:red;>*</span>
                                                <input type="text" class="form-control input-default" id="wage"
                                                       placeholder="Nhập lương hàng tháng" name="wage" value="${job.wage}">
                                                <label class="form-message" style="color: red;"></label> 
                                            </div>
                                            <label class="form" for="description">Mô tả công việc</label>
                                            <span style=color:red;>*</span>
                                            <div class="form-group">
                                                <textarea class="form-control" id="description"
                                                          placeholder="Nhập mô tả công việc" name="description">${job.description}</textarea>
                                                <label class="form-message" style="color: red;"></label> 
                                            </div>
                                            <label class="form" for="right">Quyền lợi được hưởng</label>
                                            <div class="form-group">
                                                <textarea class="form-control" placeholder="Nhập quyền lợi" id="right" name="right">${job.right}</textarea>
                                                <label class="form-message" style="color: red;"></label> 
                                            </div>
                                            <label class="form" for="request">Yêu cầu công việc</label>
                                            <span style=color:red;>*</span>
                                            <div class="form-group">
                                                <textarea class="form-control" id="request"
                                                          placeholder="Nhập yêu cầu công việc" name="request">${job.request}</textarea>
                                                <label class="form-message" style="color: red;"></label> 
                                            </div>
                                            <label class="form" for="contactInfo">Thông tin liên hệ</label>
                                            <div class="form-group">
                                                <textarea class="form-control" id="contactInfo"
                                                          placeholder="Nhập thông tin liên hệ" name="contactInfo" >${job.contactInfo}</textarea>
                                                <label class="form-message" style="color: red;"></label> 
                                            </div>
                                            <c:if test="${action == 'add'}">
                                                <button type="submit" class="btn btn-success">Thêm mới tin tuyển dụng</button>
                                            </c:if>
                                            <c:if test="${action == 'update'}">
                                                <button type="submit" class="btn btn-success">Chỉnh sửa tin tuyển dụng</button>
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

        <jsp:include page="../include/employer/footer.jsp"/>
        <jsp:include page="../include/user-employer-home/js-page.jsp"/>
        <script src="${pageContext.request.contextPath}/resources-home/js/validation.js"></script>
        <script>
            // gọi hàm
            Validator({
                form: '#job-form',
                rules: [
                    Validator.isTitle('#title'),
                    Validator.isRank('#rank'),
                    Validator.isGender('#gender'),
                    Validator.isExperience('#experience'),
                    Validator.isQuantity('#quantity'),
                    Validator.isCareers('#careers'),
                    Validator.isWage('#wage'),
                    Validator.isWage('#description'),
                    Validator.isWage('#right'),
                    Validator.isWage('#request'),
                    Validator.isWage('#contactInfo'),
                ]
            })
        </script>
    </body>
</html>