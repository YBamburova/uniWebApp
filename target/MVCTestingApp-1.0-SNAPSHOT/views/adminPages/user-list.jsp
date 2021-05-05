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
    String LocaleUnblock = getResource(resource, "LocaleUnblock");

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
    <title><%=LocaleUsers%>
    </title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header_admin.jsp"/>
<div class="container" style="padding-top: 10px">
    <h3><%=LocaleUsers%>
    </h3>
    <a href="${pageContext.request.contextPath}/users?action=ADD" class="btn btn-warning mb-4" style="" role="button"
       data-bs-toggle="button"><%=LocaleAddUser%>
    </a>
    <table id="datatable" class="table table-hover">
        <thead>
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
        </thead>
        <tbody>
        <c:forEach items="${list}" var="user">
            <tr>
                <td>${user.username}</td>
                <td>${user.name}</td>
                <td>${user.surname}</td>
                <td>${user.email}</td>
                <td>${user.type}</td>
                <c:if test="${user.isBlocked eq 'false' && user.type eq 'student'}">
                    <td>
                        <a href="${pageContext.request.contextPath}/users/block?userName=${user.username}"
                           class="btn btn-warning" style="width: 150px" role="button"
                           data-bs-toggle="button"><%=LocaleBlockUser%>
                        </a>
                        <a href="${pageContext.request.contextPath}/users?action=EDIT&id=${user.id}"
                           class="btn btn-warning" style="" role="button" data-bs-toggle="button"><%=LocaleEdit%>
                        </a>
                        <a href="${pageContext.request.contextPath}/delete?action=user&id=${user.id}"
                           class="btn btn-danger" style="" role="button" data-bs-toggle="button">delete user
                        </a>
                    </td>
                </c:if>
                <c:if test="${user.isBlocked eq 'true' && user.type eq 'student'}">
                    <td>
                        <a href="${pageContext.request.contextPath}/users/unblock?userName=${user.username}"
                           class="btn btn-info" style="width: 150px" role="button"
                           data-bs-toggle="button"><%=LocaleUnblock%>
                        </a>
                        <a href="${pageContext.request.contextPath}/users?action=EDIT&id=${user.id}"
                           class="btn btn-warning" style="" role="button" data-bs-toggle="button"><%=LocaleEdit%>
                        </a>
                        <a href="${pageContext.request.contextPath}/delete?action=user&id=${user.id}"
                           class="btn btn-danger" style="" role="button" data-bs-toggle="button">delete user
                        </a>
                    </td>
                </c:if>
                <c:if test="${user.type eq 'admin'}">
                    <td></td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot></tfoot>
    </table>

</div>
<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.23/datatables.min.js"></script>
<script>
    $(document).ready(function () {
        $('#datatable').DataTable({
            "lengthChange": false
        });
    })
</script>
</body>
</html>
<%request.getSession().removeAttribute("message");%>