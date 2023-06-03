<%--
  Created by IntelliJ IDEA.
  User: oyelis
  Date: 5/27/2023
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
<script type="text/javascript"
        src="https://cdn.datatables.net/v/bs4/dt-1.10.23/datatables.min.js"></script>

<html>
<head>
    <title><spring:message code="LocaleViewContent"/>
    </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="header_user.jsp"/>
<div class="container" style="padding-top: 100px; width: 80%; max-width: 100%;">
    <a href="${pageContext.request.contextPath}/courses" class="btn btn-primary mb-4" style=""
       role="button"><spring:message code="LocaleBack"/>
    </a>
    <div class="row" style="background-color: aliceblue; border-radius: 15px">
        <div id="content" class="col-md-12">${course.content}</div>
    </div>
    <c:if test="${completedDate == null}">
        <a href="${pageContext.request.contextPath}/courses?action=finish_course&id=${course.id}"
           style="margin-top: 10px"
           class="btn btn-warning mb-4" role="button"><spring:message code="LocaleCompleteCourse"/>
        </a>
    </c:if>
</div>
</body>
</html>
