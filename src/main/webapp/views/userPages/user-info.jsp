<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"
         language="java" %>
<link rel="stylesheet" href="../../css/profile.css">

<html>
<%

    String username = (String) session.getAttribute("username");

    System.out.println(session.getAttribute("userID"));
    if (username == null) {
        response.sendRedirect("login");
    }
%>
<head>
    <title><spring:message code="LocaleStudentInfo"/>
    </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>

<body>
<jsp:include page="header_user.jsp"/>
<div class="" style="position: absolute; right:20px" role="alert" aria-live="assertive"
     aria-atomic="true">
    <div class="toast-header">
    </div>
    <div class="toast-body">
        <p class="lead">${message}</p>
    </div>
</div>

<div class="container" style="padding-top: 100px">
    <h4><spring:message code="LocaleWelcome"/>, ${user.name} ${user.surname}</h4>
    <div class="row py-5 px-4">
        <div class="col-md-12 mx-auto"> <!-- Profile widget -->
            <div class="bg-white shadow rounded overflow-hidden">
                <div class="px-4 pt-0 pb-4 cover">
                    <div class="media align-items-end profile-head">
                        <div class="profile mr-3"><img
                                src="../../images/hat.jpg"
                                alt="..." width="130" class="rounded mb-2 img-thumbnail"></div>
                    </div>
                </div>
                <div style="margin-top: 50px" class="px-4 py-3"><h5 class="mb-0"><b>About</b></h5>
                    <table class="table table-hover">
                        <tr>
                            <td><b><spring:message code="LocaleName"/></b></td>
                            <td>${user.name}</td>
                        </tr>
                        <tr>
                            <td><b><spring:message code="LocaleSurname"/></b></td>
                            <td>${user.surname}</td>
                        </tr>
                        <tr>
                            <td><b><spring:message code="LocaleEmail"/></b></td>
                            <td>${user.email}</td>
                        </tr>
                        <tr>
                            <td><b><spring:message code="LocaleAssignedCourses"/></b></td>
                            <td>${user.courses.size()}</td>
                        </tr>
                        <tr>
                            <td><b><spring:message code="LocaleTests"/></b></td>
                            <td>${user.tests.size()}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
<jsp:include page="../publicPages/chat.jsp"/>
<jsp:include page="../publicPages/footer.jsp"/>
</html>
<%request.getSession().removeAttribute("message");%>