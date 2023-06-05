<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"
         language="java" %>

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
    <table class="table table-hover">
        <tr class="thead-light">
            <th><spring:message code="LocaleUsername"/>
            </th>
            <th><spring:message code="LocaleName"/>
            </th>
            <th><spring:message code="LocaleSurname"/>
            </th>
            <th><spring:message code="LocaleEmail"/>
            </th>
            <th><spring:message code="LocaleType"/>
            </th>
        </tr>
        <tr>
            <td>${user.username}</td>
            <td>${user.name}</td>
            <td>${user.surname}</td>
            <td>${user.email}</td>
            <td>${user.type}</td>
        </tr>
    </table>
</div>
</body>
<jsp:include page="../publicPages/chat.jsp"/>
<jsp:include page="../publicPages/footer.jsp"/>
</html>
<%request.getSession().removeAttribute("message");%>