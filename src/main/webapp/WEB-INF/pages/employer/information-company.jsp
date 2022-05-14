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
        <title>Thông tin công ty</title>
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
                                    <mvc:form action="${pageContext.request.contextPath}/employer/result-information-company"  method="post" modelAttribute="employer"
                                              enctype="multipart/form-data" id="information-company-form">
                                        <c:if test="${action == 'update'}">
                                            <input type="text" class="form-control" name="id"
                                                   value="${employer.id}" hidden>    
                                        </c:if>
                                        <h6>ẢNH ĐẠI DIỆN CÔNG TY</h6>
                                        <div class="basic-form">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="inline-editor" style="float: right; margin-right: 600px;" >
                                                        <P>Upload hình đại diện của công ty!</P>
                                                        <input class="form-control form-upload" name="files" type="file"> 
                                                    </div>
                                                    <div class="inline-editor">
                                                        <img src="<c:url value="/resources-home/img/company/"/>${employer.logo}" width="120px;" height="110px;" style="border: 2px solid 
                                                             #ced4da;" />
                                                        <input value="${employer.logo}" name="logo" hidden/>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </br>
                                        <h6>THÔNG TIN CƠ BẢN</h6>
                                        <div class="basic-form">
                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="name">Tên công ty</label>
                                                    <input type="text" class="form-control input-default" value="${employer.name}" name="name"
                                                           placeholder="Nhập tên công ty" id="name">
                                                    <label class="form-message" style="color: red;"></label> 
                                                </div>
                                                <div class="col">
                                                    <label class="form" for="phone">Số điện thoại</label>
                                                    <input type="text" class="form-control input-default" value="${employer.phoneNumber}" id="phone" 
                                                           placeholder="Nhập số điện thoại"  name="phoneNumber" >
                                                    <label class="form-message" style="color: red; "></label> 
                                                </div>
                                            </div>
                                            </br>
                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="scale">Số lượng nhân viên</label>
                                                    <select class="form-control" id="scale" name="scale">
                                                        <option></option>
                                                        <c:forEach items="${scales}" var="scale">
                                                            <c:if  test="${scale.name == employer.scale}">
                                                                <option value="${scale.name}" selected>${scale.name}</option>
                                                            </c:if>
                                                            <c:if  test="${scale.name != employer.scale}">
                                                                <option value="${scale.name}">${scale.name}</option>
                                                            </c:if>
                                                        </c:forEach> 
                                                    </select>
                                                    <label class="form-message" style="color: red;"></label>
                                                </div>

                                                <div class="col">
                                                    <label class="form" for="website">Website</label>
                                                    <input type="text" class="form-control input-default" value="${employer.website}" id="website"
                                                           placeholder="Nhập email"  name="website">
                                                    <label class="form-message" style="color: red;"></label>
                                                </div>
                                            </div>
                                            </br>
                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="career">Lĩnh vực</label>
                                                    <select class="form-control" id="career" name="career">
                                                        <option></option>
                                                        <c:forEach items="${careerses}" var="careers">
                                                            <c:if test="${careers.name == employer.career}">
                                                                <option value="${careers.name}" selected>${careers.name}</option>
                                                            </c:if>
                                                            <c:if test="${careers.name != employer.career}">
                                                                <option value="${careers.name}">${careers.name}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                    <label class="form-message" style="color: red; "></label> 
                                                </div>
                                                <div class="col">
                                                    <label class="form" for="address">Địa chỉ</label>
                                                    <input type="text" class="form-control input-default" value="${employer.address}" id="address"
                                                           placeholder="Nhập địa chỉ" name="address">
                                                    <label class="form-message" style="color: red; "></label> 
                                                </div>
                                            </div>
                                            </br>
                                            <div class="row">
                                                <div class="col">
                                                    <label class="form" for="taxCode">Mã số thuế</label>
                                                    <input type="text" class="form-control input-default" value="${employer.taxCode}" name="taxCode" id="taxCode"
                                                           placeholder="Nhập mã số thuế" >
                                                    <label class="form-message" style="color: red; "></label>
                                                </div>
                                            </div>
                                        </div>
                                        </br>
                                        <button type="submit" class="btn btn-success">CẬP NHẬT</button>
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