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
    String LocaleAboutUs = getResource(resource, "LocaleAboutUs");
    String LocaleResourses = getResource(resource, "LocaleResourses");

%>
<html>
<head>
    <title><%=LocaleResourses%>
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
    <h4><%=LocaleResourses%></h4> 
    <h5 style="padding-top: 10px">HTML</h5> 
    <div class="list-group list-group-flush ">
        <a href="https://www.w3schools.com/html/default.asp" class="list-group-item   ">W3Schools</a>
        <a href="https://www.tutorialspoint.com/html5/index.htm" class="list-group-item ">Tutorials Point</a>
        <a href="https://developer.mozilla.org/en-US/docs/Web/HTML" class="list-group-item  ">Developer Mozilla</a>
    </div>
    <h5 style="padding-top: 10px">CSS</h5> 
    <div class="list-group list-group-flush">
        <a href="https://www.w3schools.com/css/default.asp" class="list-group-item  ">W3Schools</a>
        <a href="https://www.tutorialspoint.com/css/index.htm" class="list-group-item ">Tutorials Point</a>
        <a href="https://developer.mozilla.org/en-US/docs/Web/CSS" class="list-group-item  ">Developer Mozilla</a>
    </div>
    <h5 style="padding-top: 10px">JavaScript</h5> 
    <div class="list-group list-group-flush">
        <a href="https://www.w3schools.com/js/default.asp" class="list-group-item ">W3Schools</a>
        <a href="https://www.tutorialspoint.com/javascript/index.htm" class="list-group-item ">Tutorials Point</a>
        <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript" class="list-group-item  ">Developer Mozilla</a>
    </div>
    <h5 style="padding-top: 10px">Java</h5> 
    <div class="list-group list-group-flush">
        <a href="https://www.w3schools.com/java/default.asp" class="list-group-item  ">W3Schools</a>
        <a href="https://www.tutorialspoint.com/java/index.htm" class="list-group-item ">Tutorials Point</a>
        <a href="https://docs.oracle.com/javase/tutorial/" class="list-group-item ">Java Documentation</a>
    </div>
    <h5 style="padding-top: 10px">React</h5> 
    <div class="list-group list-group-flush">
        <a href="https://www.w3schools.com/react/default.asp" class="list-group-item  ">W3Schools</a>
        <a href="https://www.tutorialspoint.com/reactjs/index.htm" class="list-group-item ">Tutorials Point</a>
        <a href="https://uk.reactjs.org" class="list-group-item ">React Documentation</a>
    </div> 
</div>
</div>
</body>
</html>
<%request.getSession().removeAttribute("message");%>