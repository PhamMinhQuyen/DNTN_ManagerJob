<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="img/fav.png">
        <meta name="author" content="codepixer">
        <!-- Meta Keyword -->
        <meta name="keywords" content="">
        <meta charset="UTF-8">
        <title>Chi tiết hồ sơ ứng viên</title>
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
                                    <div class="basic-form">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="inline-editor" style="float: right; margin-right: 660px;" >
                                                    <table>
                                                        <tr>
                                                            <th>Ứng viên:</th>
                                                            <td style="padding-left: 12px;">${file.candidate.name}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Vị trí ứng tuyển:</th>
                                                            <td style="padding-left: 12px;">${file.post.name}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Số năm kinh nghiệm:</th>
                                                                <c:forEach items="${experiences}" var="experience">
                                                                <td style="padding-left: 12px;">${experience.yearNumber} năm</td>
                                                            </c:forEach>
                                                        </tr>
                                                        <tr>
                                                            <th>File CV:</th>
                                                            <td style="padding-left: 12px;"><a href="<c:url value="/resources-home/CV/"/>${file.fileCV}">Tải file</a></td>
                                                        </tr>
                                                    </table>

                                                </div>

                                                <div class="inline-editor">
                                                    <img src="<c:url value="/resources/img/user/"/>${file.candidate.user.image}" width="120px;" height="120px;"/>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </br>
                                    <h6>THÔNG TIN CÁ NHÂN</h6>
                                    <div class="basic-form">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="inline-editor">
                                                    <table>
                                                        <tr>
                                                            <th>Email:</th>
                                                            <td style="padding-left: 12px;">${file.candidate.user.email}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Ngày sinh:</th>
                                                            <td style="padding-left: 12px;">
                                                                <fmt:formatDate pattern="dd/MM/yyyy" value="${file.candidate.birthdate}" /></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Giới tính:</th>
                                                            <td style="padding-left: 12px;">${file.candidate.gender}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Tình trạng hôn nhân:</th>
                                                            <td style="padding-left: 12px;">${file.candidate.marriage}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Địa chỉ:</th>
                                                            <td style="padding-left: 12px;">${file.candidate.address}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Số diện thoại:</th>
                                                            <td style="padding-left: 12px;">${file.candidate.phone}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>CCCD:</th>
                                                            <td style="padding-left: 12px;">${file.candidate.CCCD}</td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </br>
                                    <h6>MỤC TIÊU NGHỀ NGHIỆP</h6>
                                    <div class="basic-form">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="inline-editor">
                                                    <table>
                                                        <tr>
                                                            
                                                        </tr>

                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </br>
                                    <h6>THÔNG TIN NGHỀ NGHIỆP</h6>
                                    <div class="basic-form">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="inline-editor">
                                                    <table>
                                                        <tr>
                                                            <th>Cấp bậc:</th>
                                                            <td style="padding-left: 12px;">PHP</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Mức lương:</th>
                                                            <td style="padding-left: 12px;">PHP</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Ngành nghề:</th>
                                                            <td style="padding-left: 12px;">PHP</td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </br>
                                    <h6>KINH NGHIỆM LÀM VIỆC</h6>
                                    <c:if test="${experiences != null && fn:length(experiences) > 0}">
                                        <c:forEach items="${experiences}" var="experience">
                                            <div class="basic-form">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="inline-editor">
                                                            <table>
                                                                <tr>
                                                                    <th>Số năm kinh nghiệm:</th>
                                                                    <td style="padding-left: 12px;">${experience.yearNumber} năm</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Chức vụ:</th>
                                                                    <td style="padding-left: 12px;">${experience.position}, ${experience.nameCity}</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Thời gian làm việc:</th>
                                                                    <td style="padding-left: 12px;"> 
                                                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${experience.startTime}"/> - 
                                                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${experience.endTime}"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Mô tả:</th>
                                                                    <td style="padding-left: 12px;">${experience.jobDescription}</td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    </br>
                                    <h6>HỌC VẤN</h6>

                                    <div class="basic-form">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="inline-editor">
                                                    <c:if test="${educations != null && fn:length(educations) > 0}">
                                                        <c:forEach items="${educations}" var="education">
                                                            <table>
                                                                <tr>
                                                                    <th>Bằng cấp:</th>
                                                                    <td style="padding-left: 12px;">${education.degree}</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Trường:</th>
                                                                    <td style="padding-left: 12px;">${education.school}</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Tốt nghiệp:</th>
                                                                    <td style="padding-left: 12px;">
                                                                        <fmt:formatDate pattern="dd-MM-yyyy" value="${education.graduationTime}"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Ngoại ngữ:</th>
                                                                    <td style="padding-left: 12px;">${education.foreignLanguage}</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Mô tả:</th>
                                                                    <td style="padding-left: 12px;">${education.description}</td>
                                                                </tr>
                                                            </table>
                                                        </c:forEach>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </br>
                                    <h6>KỸ NĂNG</h6>

                                    <div class="basic-form">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="inline-editor">
                                                    <c:if test="${skills != null && fn:length(skills) > 0}">
                                                        <c:forEach items="${skills}" var="skill">
                                                            <table>
                                                                <tr>
                                                                    <th>Kỹ năng chuyên môn:</th>
                                                                    <td style="padding-left: 12px;">${skill.name}</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Mức độ:</th>
                                                                    <td style="padding-left: 12px;">${skill.level}</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Mô tả:</th>
                                                                    <td style="padding-left: 12px;">${skill.description}</td>
                                                                </tr>
                                                            </table>
                                                        </c:forEach>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </br>
                                    <button class="btn btn-success" onclick="location.href = '<c:url value="/employer/mail/${file.candidate.user.id}"/>'">Chấp nhận</button>
                                    <button type="submit" class="btn btn-danger" style="margin-left: 10px;">Từ chối</button>
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