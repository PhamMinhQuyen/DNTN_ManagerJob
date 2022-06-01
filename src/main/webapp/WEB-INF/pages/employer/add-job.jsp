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
                                    <h3>ĐĂNG TIN TUYỂN DỤNG</h3>
                                    </br>
                                    <div class="basic-form">
                                        <mvc:form id="job-form" action="${pageContext.request.contextPath}/employer/result-add-job"  method="post" modelAttribute="job">
                                            <div class="form-group">
                                                <label class="form" for="title">Tiêu đề</label>
                                                <span style=color:red;>*</span>
                                                <input type="text" class="form-control input-default"
                                                       placeholder="Nhập tiêu đề" name="name" id="title">
                                                <label class="form-message" style="color: red;"></label> 
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="rank">Cấp bậc</label>
                                                    <select class="form-control" id="rank" name="rank.id">
                                                        <option></option>
                                                        <c:forEach var="rank" items="${ranks}">
                                                            <option value="${rank.id}">${rank.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                                <div class="col">
                                                    <label class="form" for="gender">Giới tính</label>
                                                    <span style=color:red;>*</span>
                                                    <select class="form-control" id="gender" name="gender"> 
                                                        <option></option>
                                                        <option >Không yêu cầu</option>
                                                        <option >Nam</option>
                                                        <option >Nữ</option>
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
                                                        <option>Có kinh nghiệm</option>
                                                        <option>Chưa có kinh nghiệm</option>
                                                    </select>
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                                <div class="col">
                                                    <label class="form" for="quantity">Số lượng cần tuyển</label>
                                                    <span style=color:red;>*</span>
                                                    <input class="form-control" type="number" min="0" name="quantity" id="quantity" />
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
                                                            <option value="${careers.id}" >${careers.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <label class="form-message" style="color: red;"></label>  
                                                </div>
                                                <div class="col">
                                                    <label class="form" for="workingform">Hình thức làm việc</label>
                                                    <select class="form-control" id="workingform" name="workingFormEnum">
                                                        <c:forEach var="working" items="${workings}">
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
                                                        </c:forEach>
                                                    </select>
                                                    <label class="form-message" style="color: red;"></label>  
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="form" for="wage">Lương hàng tháng</label>
                                                <span style=color:red;>*</span>
                                                <input type="text" class="form-control input-default" id="wage"
                                                       placeholder="Nhập lương hàng tháng" name="wage">
                                                <label class="form-message" style="color: red;"></label> 
                                            </div>
                                            <label class="form" for="description">Mô tả công việc</label>
                                            <span style=color:red;>*</span>
                                            <div class="form-group">
                                                <textarea class="form-control" id="description" style="height: 150px;"
                                                          placeholder="Nhập mô tả công việc" name="description"></textarea>
                                                <label class="form-message" style="color: red;"></label> 
                                            </div>
                                            <label class="form" for="right">Quyền lợi được hưởng</label>
                                            <div class="form-group">
                                                <textarea class="form-control" placeholder="Nhập quyền lợi" style="height: 150px;" id="right" name="right"></textarea>
                                                <label class="form-message" style="color: red;"></label> 
                                            </div>
                                            <label class="form" for="request">Yêu cầu công việc</label>
                                            <span style=color:red;>*</span>
                                            <div class="form-group">
                                                <textarea class="form-control" id="request" style="height: 150px;"
                                                          placeholder="Nhập yêu cầu công việc" name="request"></textarea>
                                                <label class="form-message" style="color: red;"></label> 
                                            </div>
                                            <label class="form" for="contactInfo">Thông tin liên hệ</label>
                                            <div class="form-group">
                                                <textarea class="form-control" id="contactInfo" style="height: 150px;"
                                                          placeholder="Nhập thông tin liên hệ" name="contactInfo" ></textarea>
                                                <label class="form-message" style="color: red;"></label> 
                                            </div>
                                            <button type="submit" class="btn btn-success">Thêm mới tin tuyển dụng</button>
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