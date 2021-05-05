<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %>

<%!
    public String getResource(ResourceBundle resourceBundle, String resName) throws UnsupportedEncodingException {
        return new String(resourceBundle.getString(resName).getBytes("ISO-8859-1"), "UTF-8");
    }
%>

<% Locale currentLocale = new Locale((String) session.getAttribute("language"), (String) session.getAttribute("country"));
    ResourceBundle resource = ResourceBundle.getBundle("main", currentLocale);
    String LocaleUsername = getResource(resource, "LocaleUsername");
    String LocalePassword = getResource(resource, "LocalePassword");
    String LocaleSignIn = getResource(resource, "LocaleSignIn");
%>


<html>
<head>
    <title><%=LocaleSignIn%>
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
                    <label for="username" class="form-label"><%=LocaleUsername%>
                    </label>
                    <input minlength="3" maxlength="45" id="username" class="form-control"
                           placeholder="<%=LocaleUsername%>" type="text" name="username" value="${user.username}"
                           required><br>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label"><%=LocalePassword%>
                    </label>
                    <input maxlength="45" minlength="1" id="password" class="form-control"
                           placeholder="<%=LocalePassword%>" type="password" name="password"><br>
                    <%--                    <p class="text-info">*Minimum eight characters, at least one uppercase letter, one lowercase letter and one number</p>--%>
                </div>
                <input type="hidden" name="id" value="${user.id}">
                <button type="submit" class="btn btn-primary"><%=LocaleSignIn%>
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

