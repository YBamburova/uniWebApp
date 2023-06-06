<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<link rel="stylesheet" href="../../css/tests.css">

<html>
<%
    String username = (String) session.getAttribute("username");
    System.out.println(session.getAttribute("userID"));
    if (username == null) {
        response.sendRedirect("login");
    }
    request.setAttribute("testID", request.getParameter("testID"));
%>
<head>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">

    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="//cdn.rawgit.com/hilios/jQuery.countdown/2.2.0/dist/jquery.countdown.min.js"></script>
    <title><spring:message code="LocaleTestDetails"/>
    </title>
</head>
<body>
<div class="container pt-5">

    <form style="font-size: 16px; font-family: 'Montserrat'">
        <c:forEach varStatus="loop" items="${list}" var="question">
            <input type="hidden" name="questions" value="${question.id}">
            <div class="container card question mb-5">
                <a href="${pageContext.request.contextPath}/delete?action=question&id=${question.id}"
                   class="btn btn-warning" style="" role="button" data-bs-toggle="button">delete question
                </a>
                <strong class="card-header mb-2" id="${question.id}">
                        ${loop.index + 1}.
                        ${question.text}
                </strong>

                <div class="form-check d-flex align-items-center mb-2">
                    <input class="form-check-input position-static mt-0 mr-2" type="checkbox" disabled>
                        ${question.option1}
                </div>

                <div class="form-check d-flex align-items-center mb-2">
                    <input class="form-check-input position-static mt-0 mr-2" type="checkbox" disabled>
                        ${question.option2}
                </div>

                <div class="form-check d-flex align-items-center mb-2">
                    <input class="form-check-input position-static mt-0 mr-2" type="checkbox" disabled>
                        ${question.option3}
                </div>

                <div class="form-check d-flex align-items-center mb-2">
                    <input class="form-check-input position-static mt-0 mr-2" type="checkbox" disabled>
                        ${question.option4}
                </div>
            </div>
        </c:forEach>
    </form>
</div>
</body>
</html>