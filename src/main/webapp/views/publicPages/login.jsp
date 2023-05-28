<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html>
<head>
    <title><spring:message code="LocaleSignIn"/>
    </title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header_public.jsp"/>
<div class="container" style="width: 450px; padding-top: 70px">
    <div class="card">
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">
                        <spring:message code="LocaleUsername" />
                    </label>
                    <input minlength="3" maxlength="45" id="username" class="form-control"
                           placeholder="<spring:message code="LocaleUsername" />" type="text" name="username" value="${user.username}"
                           required><br>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">
                        <spring:message code="LocalePassword" />
                    </label>
                    <input maxlength="45" minlength="1" id="password" class="form-control"
                           placeholder="<spring:message code="LocalePassword" />" type="password" name="password"><br>
                </div>
                <input type="hidden" name="id" value="${user.id}">
                <button type="submit" class="btn btn-primary">
                    <spring:message code="LocaleSignIn" />
                </button>
            </form>
        </div>
    </div>
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

