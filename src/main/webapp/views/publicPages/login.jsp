<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html>
<head>
    <title><spring:message code="LocaleSignIn"/>
    </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="header_public.jsp"/>
<div class="container" style="width: 400px; padding-top: 70px">
    <form action="${pageContext.request.contextPath}/login" method="post" class="form-signin">
        <h2 class="form-signin-heading"><spring:message code="LocaleSignIn" /></h2>

        <label for="username" class="sr-only">
            <spring:message code="LocaleUsername" />
        </label>
        <input id="username" minlength="3" maxlength="45" name="username" class="form-control" placeholder="<spring:message code="LocaleUsername" />" required="" autofocus="">
        <label for="password" class="sr-only">
            <spring:message code="LocalePassword" />
        </label>
        <input maxlength="45" minlength="1" type="password" name="password" id="password" class="form-control" placeholder="<spring:message code="LocalePassword" />" required="">
        <button class="btn btn-lg btn-primary btn-block" type="submit"><spring:message code="LocaleSignIn" /></button>
    </form>
</div>
<div class="toast-header">
</div>
<div class="toast-body">
    <p class="lead">
        <%
            String username = (String) request.getSession().getAttribute("username");
            if (username != null) {
                response.sendRedirect("tests");
            }
        %>
    </p>
</div>
</body>
</html>

