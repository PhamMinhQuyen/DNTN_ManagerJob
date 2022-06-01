<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin cá nhân</title>
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
                                                class="nav-link active"
                                                id="ex3-tab-1"
                                                data-mdb-toggle="tab"
                                                href="<c:url value="/user/information-user" />"
                                                role="tab"
                                                aria-controls="ex3-tabs-1"
                                                aria-selected="true"
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
                                        <li class="nav-item" role="presentation">
                                            <a
                                                class="nav-link"
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
                                                class="nav-link"
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
                                    <h5>THÔNG TIN CÁ NHÂN</h5>
                                    <mvc:form action="${pageContext.request.contextPath}/user/result-update-information-user"  method="post" modelAttribute="candidate"
                                              enctype="multipart/form-data" id="information-user-form">
                                        <c:if test="${action == 'update'}">
                                            <input type="text" class="form-control" name="id"
                                                   value="${candidate.id}" hidden>  

                                            <input type="text" class="form-control" name="user.id"
                                                   value="${candidate.user.id}" hidden>
                                        </c:if>
                                        <div class="basic-form">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="inline-editor" style="float: right; margin-right: 600px;" >
                                                        <P>Upload hình đại diện cá nhân!</P>
                                                        <input class="form-control form-upload" name="files" type="file" id="image"> 
                                                        <c:if test="${candidate.image == null}">
                                                            <label class="form-message" style="color: red;"></label> 
                                                        </c:if>
                                                    </div>
                                                    <div class="inline-editor">
                                                        <img src="<c:url value="/resources/img/user/"/>${candidate.image}" width="120px;" height="110px;" style="border: 2px solid 
                                                             #ced4da; " />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </br>
                                        <div class="basic-form">
                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="name">Họ và tên</label>
                                                    <span style=color:red;>*</span>
                                                    <input type="text" class="form-control " value="${candidate.name}" name="name"
                                                           placeholder="Nhập họ và tên" id="name">
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                                <div class="col">
                                                    <label class="form" for="email">Email</label>
                                                    <input type="text" class="form-control input-default" id="email" disabled value="${candidate.user.email}"
                                                           >
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="address">Địa chỉ</label>
                                                    <span style=color:red;>*</span>
                                                    <input type="text" class="form-control input-default" value="${candidate.address}" name="address"
                                                           placeholder="Nhập đia chỉ" id="address">
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                                <div class="col">
                                                    <label class="form" for="phoneNumber">Số điện thoại</label>
                                                    <span style=color:red;>*</span>
                                                    <input type="text" class="form-control input-default" value="${candidate.phone}" id="phoneNumber" 
                                                           placeholder="Nhập số điện thoại"  name="phone" >
                                                    <label class="form-message" style="color: red; "></label> 
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="gender">Giới tính</label>
                                                    <select class="form-control" id="gender" name="gender">
                                                        <option></option>
                                                        <c:forEach var="gender" items="${genders}">
                                                            <c:if test="${gender == candidate.gender}">
                                                                <option value="${gender}" selected>${gender}</option>
                                                            </c:if>
                                                            <c:if test="${gender != candidate.gender}">
                                                                <option value="${gender}" >${gender}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                    <label class="form-message" style="color: red; "></label> 
                                                </div>
                                                <div class="col">
                                                    <label class="form" for="birthday">Ngày sinh</label>
                                                    <input type="date" class="form-control" value="${candidate.birthdate}" name="birthdate"
                                                           id="birthday"> 
                                                    <label  class="form-message" style="color: red; "></label> 
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="marriage">Tình trạng hôn nhân</label>
                                                    <select class="form-control" id="marriage" name="marriage">
                                                        <option></option>
                                                        <c:if test="${candidate.marriage == 'Độc thân'}">
                                                            <option selected>Độc thân</option>
                                                        </c:if>
                                                        <c:if test="${candidate.marriage != 'Độc thân'}">
                                                            <option>Độc thân</option>
                                                        </c:if>
                                                        <c:if test="${candidate.marriage == 'Có gia đình'}">
                                                            <option selected>Có gia đình</option>
                                                        </c:if>
                                                        <c:if test="${candidate.marriage != 'Có gia đình'}">
                                                            <option>Có gia đình</option>
                                                        </c:if>
                                                    </select>
                                                    <label class="form-message" style="color: red; "></label> 
                                                </div>
                                                <div class="col">
                                                    <label class="form" for="CCCD">Căn cước công dân</label>
                                                    <input type="text" class="form-control" placeholder="Nhập CCCD"  value="${candidate.CCCD}" name="CCCD"
                                                           id="CCCD"> 
                                                    <label class="form-message" style="color: red; "></label> 
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <input type="text" class="form-control"  value="${candidate.user.password}" name="candidate.user.password" hidden
                                                           > 
                                                </div>
                                                <div class="col">
                                                    <input type="text" class="form-control"  value="${candidate.user.email}" name="candidate.user.email" hidden
                                                           > 
                                                </div>
                                                <div class="col">
                                                    <input type="text" class="form-control"  value="${candidate.image}" name="image" hidden
                                                           > 
                                                </div>
                                                <div class="col">
                                                    <input type="text" class="form-control"  value="${candidate.user.status}" name="candidate.user.status" hidden
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
                form: '#information-user-form',
                rules: [
                    Validator.isNameStaff('#name'),
                    Validator.isAddress('#address'),
                    Validator.isPhoneNumber('#phoneNumber'),
                    Validator.isGender('#gender'),
                    Validator.isBirthday('#birthday'),
                    Validator.isMarriage('#marriage'),
                    Validator.isCCCD('#CCCD'),
                    Validator.isImage('#image'),
                ]
            });
        </script>
    </body>
</html>