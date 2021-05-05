<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!
    public String getResource(ResourceBundle resourceBundle, String resName) throws UnsupportedEncodingException, UnsupportedEncodingException {
        return new String(resourceBundle.getString(resName).getBytes("ISO-8859-1"), "UTF-8");
    }
%>

<% Locale currentLocale = new Locale((String) session.getAttribute("language"), (String) session.getAttribute("country"));
    ResourceBundle resource = ResourceBundle.getBundle("main", currentLocale);
    String LocaleTestDetails = getResource(resource, "LocaleTestDetails");

%>
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
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="//cdn.rawgit.com/hilios/jQuery.countdown/2.2.0/dist/jquery.countdown.min.js"></script>
    <title><%=LocaleTestDetails%>
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