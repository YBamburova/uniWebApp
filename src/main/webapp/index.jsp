<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="//cdn.rawgit.com/hilios/jQuery.countdown/2.2.0/dist/jquery.countdown.min.js"></script>
    <title>Redirecting</title>
</head>
<body>
    <%
if (request.getSession().getAttribute("type") == null){
response.sendRedirect("login");
}
else if (request.getSession().getAttribute("type").equals("admin")){
    response.sendRedirect(request.getContextPath()+"/users?action=LIST");

}else if (request.getSession().getAttribute("type").equals("student")){
   response.sendRedirect(request.getContextPath()+"/users");
}
%>


Please wait for redirection or: <br>

<div class="container" style="width: 450px; padding-top: 70px">
    <a href="${pageContext.request.contextPath}/users?action=LIST" class="btn btn-info btn-block"
       style="width: 200px"
       role="button" data-bs-toggle="button">users</a>
    <a href="${pageContext.request.contextPath}/webapp/jsps/views/publicPages/user-add.jsp"
       class="btn btn-info btn-block"
       style="width: 200px" role="button" data-bs-toggle="button">users</a>
    <a href="${pageContext.request.contextPath}/tests" class="btn btn-info btn-block"
       style="width: 200px" role="button"
       data-bs-toggle="button">tests</a>
    <a href="${pageContext.request.contextPath}/tests?action=add" class="btn btn-info btn-block"
       style="width: 200px"
       role="button" data-bs-toggle="button">test-add</a>
    <a href="${pageContext.request.contextPath}/questions" class="btn btn-info btn-block"
       style="width: 200px"
       role="button" data-bs-toggle="button">question-add</a>
    <a href="${pageContext.request.contextPath}/login" class="btn btn-info btn-block"
       style="width: 200px" role="button"
       data-bs-toggle="button">login</a>
</div>

