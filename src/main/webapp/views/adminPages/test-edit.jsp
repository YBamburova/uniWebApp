<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" language="java" %>

<html>
<%

    String username = (String) session.getAttribute("username");

    System.out.println(session.getAttribute("userID"));
    if (username == null) {
        response.sendRedirect("login");
    }
%>
<head>
    <title><spring:message code="LocaleAddTest"/>
    </title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
<div class="container" style="width: 450px; padding-top: 70px">
    <div class="card">
        <div class="card-body">

            <form action="${pageContext.request.contextPath}/tests?action=EDIT&testID=${test.id}"
                  method="post">

                <div class="mb-3">
                    <label for="name" class="form-label"><spring:message code="LocaleTestName"/>
                    </label>
                    <input minlength="3" maxlength="45" id="name" class="form-control"
                           placeholder="<spring:message code="LocaleTestName"/>"
                           value="${test.name}" type="text" name="name" required><br>
                </div>


                <div class="mb-3">
                    <label for="complexity" class="form-label"><spring:message code="LocaleComplexity"/>
                    </label>
                    <input id="complexity" class="form-control-range" type="range"
                           value="${test.complexity}"
                           name="complexity" min="1" max="10" step="1">
                    1_____2_____3_____4_____5____6_____7_____8____9____10
                </div>

                <div class="mb-3">
                    <label for="timeForTest" class="form-label"><spring:message code="LocaleTimeForTest"/>
                    </label>
                    <input minlength="1" pattern="[0-9]*" maxlength="10" id="timeForTest"
                           value="${test.timeForTest}"
                           class="form-control" placeholder="<spring:message code="LocaleTimeForTest"/>" type="text"
                           name="timeForTest"
                           required><br>
                </div>

                <div class="mb-3">
                    <label for="topic" class="form-label"><spring:message code="LocaleTopic"/>
                    </label>
                    <input minlength="1" maxlength="10" id="topic" class="form-control"
                           placeholder="<spring:message code="LocaleTopic"/>"
                           value="${test.topic}" type="text" name="topic" required><br>
                </div>

                <button type="submit" class="btn btn-primary"><spring:message code="LocaleSubmit"/>
                </button>
            </form>
        </div>

    </div>
</div>

</body>
</html>
