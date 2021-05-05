<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"
         language="java" %>

<%!
    public String getResource(ResourceBundle resourceBundle, String resName) throws UnsupportedEncodingException, UnsupportedEncodingException {
        return new String(resourceBundle.getString(resName).getBytes("ISO-8859-1"), "UTF-8");
    }
%>
<% Locale currentLocale = new Locale((String) session.getAttribute("language"), (String) session.getAttribute("country"));
    ResourceBundle resource = ResourceBundle.getBundle("main", currentLocale);

    String LocaleAddUser = getResource(resource, "LocaleAddUser");
    String LocaleUsername = getResource(resource, "LocaleUsername");
    String LocaleName = getResource(resource, "LocaleName");
    String LocaleSurname = getResource(resource, "LocaleSurname");
    String LocaleEmail = getResource(resource, "LocaleEmail");
    String LocaleUsers = getResource(resource, "LocaleUsers");
    String LocaleType = getResource(resource, "LocaleType");
    String LocaleActions = getResource(resource, "LocaleActions");
    String LocaleBlockUser = getResource(resource, "LocaleBlockUser");
    String LocaleEdit = getResource(resource, "LocaleEdit");
    String LocaleWelcome = getResource(resource, "LocaleWelcome");
    String LocaleStudentInfo = getResource(resource, "LocaleStudentInfo");

%>
<html>
<%

    String username = (String) session.getAttribute("username");

    System.out.println(session.getAttribute("userID"));
    if (username == null) {
        response.sendRedirect("login");
    }
%>
<head>
    <title><%=LocaleStudentInfo%>
    </title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">


</head>

<body>
<jsp:include page="header_user.jsp"/>
<div class="" style="position: absolute; right:20px" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
    </div>
    <div class="toast-body">
        <p class="lead">${message}</p>
    </div>
</div>


<div class="container" style="padding-top: 10px">
    <h4><%=LocaleWelcome%>, ${user.name} ${user.surname}</h4>
    <table class="table table-hover">
        <tr class="thead-light">
            <th><%=LocaleUsername%>
            </th>
            <th><%=LocaleName%>
            </th>
            <th><%=LocaleSurname%>
            </th>
            <th><%=LocaleEmail%>
            </th>
            <th><%=LocaleType%>
            </th>
            <th><%=LocaleActions%>
            </th>
        </tr>
        <tr>
            <td>${user.username}</td>
            <td>${user.name}</td>
            <td>${user.surname}</td>
            <td>${user.email}</td>
            <td>${user.type}</td>
            <td><a href="${pageContext.request.contextPath}/users?action=EDIT" class="btn btn-warning"><%=LocaleEdit%>
            </a></td>
        </tr>
    </table>
</div>
</body>
</html>
<%request.getSession().removeAttribute("message");%>