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
    String LocaleAddTest = getResource(resource, "LocaleAddTest");
    String LocaleTestName = getResource(resource, "LocaleTestName");
    String LocaleComplexity = getResource(resource, "LocaleComplexity");
    String LocaleTimeForTest = getResource(resource, "LocaleTimeForTest");
    String LocaleTopic = getResource(resource, "LocaleTopic");
    String LocaleSubmit = getResource(resource, "LocaleSubmit");

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
    <title><%=LocaleAddTest%>
    </title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
<div class="container" style="width: 450px; padding-top: 70px">
    <div class="card">
        <div class="card-body">

            <form action="${pageContext.request.contextPath}/tests" method="post">

                <div class="mb-3">
                    <label for="name" class="form-label"><%=LocaleTestName%>
                    </label>
                    <input minlength="3" maxlength="45" id="name" class="form-control" placeholder="<%=LocaleTestName%>"
                           type="text" name="name" required><br>
                </div>


                <div class="mb-3">
                    <label for="complexity" class="form-label"><%=LocaleComplexity%>
                    </label>
                    <input id="complexity" class="form-control-range" type="range" name="complexity" min="1" max="10"
                           step="1">
                    1_____2_____3_____4_____5____6_____7_____8____9____10
                </div>

                <div class="mb-3">
                    <label for="timeForTest" class="form-label"><%=LocaleTimeForTest%>
                    </label>
                    <input minlength="1" pattern="[0-9]*" maxlength="10" id="timeForTest" class="form-control"
                           placeholder="<%=LocaleTimeForTest%>" type="text" name="timeForTest" required><br>
                </div>



                <div class="mb-3">
                    <label for="topic" class="form-label"><%=LocaleTopic%>
                    </label>

                    <select class="form-control" id="topic" name="topic">
                        <c:forEach var="topic" items="${topics}">
                            <option value="${topic.id}"><c:out value="${topic.name}"></c:out></option>
                        </c:forEach>
                    </select>

                </div>

                <button type="submit" class="btn btn-primary"><%=LocaleSubmit%>
                </button>


            </form>
        </div>

    </div>
</div>

</body>
</html>
