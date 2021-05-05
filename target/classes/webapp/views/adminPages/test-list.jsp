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
    String LocaleTests = getResource(resource, "LocaleTests");
    String LocaleAddTest = getResource(resource, "LocaleAddTest");
    String LocaleTestName = getResource(resource, "LocaleTestName");
    String LocaleComplexity = getResource(resource, "LocaleComplexity");
    String LocaleNumberOfRequests = getResource(resource, "LocaleNumberOfRequests");
    String LocaleTimeForTest = getResource(resource, "LocaleTimeForTest");
    String LocaleTopic = getResource(resource, "LocaleTopic");
    String LocaleQuestion = getResource(resource, "LocaleQuestion");
    String LocaleAddQuestion = getResource(resource, "LocaleAddQuestion");
%>
<%
    String username = (String) session.getAttribute("username");
    System.out.println(session.getAttribute("userID"));
    if (username == null) {
        response.sendRedirect("login");
    }
%>
<html>
<head>
    <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title><%=LocaleTests%>
    </title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.23/datatables.min.css"/>

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
</head>
<body>
<jsp:include page="header_admin.jsp"/>

<div class="container" style="padding-top: 10px; margin-bottom: 100px">
    <h3><%=LocaleTests%>
    </h3>
    <a href="${pageContext.request.contextPath}/tests?action=add" class="btn btn btn-warning mb-0" style="width: 200px"
       role="button" data-bs-toggle="button"><%=LocaleAddTest%>
    </a>
    <table id="datatable" class="table table-hover">
        <thead>
        <tr class="thead-light">
            <th>ID</th>
            <th><%=LocaleTestName%>
            </th>
            <th><%=LocaleComplexity%>
            </th>
            <th><%=LocaleNumberOfRequests%>
            </th>
            <th><%=LocaleTimeForTest%>
            </th>
            <th><%=LocaleTopic%>
            </th>
            <th><%=LocaleQuestion%>
            </th>
            <th><%=LocaleAddQuestion%>
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="test">
            <tr>
                <td>${test.id}</td>

                <td>
                    <a href="${pageContext.request.contextPath}/pass?time=${test.timeForTest}&testID=${test.id}&userID=${userID}">${test.name}</a>
                </td>
                <td>${test.complexity}</td>
                <td>${test.numberOfRequests}</td>
                <td>${test.timeForTest}</td>

                <td>
                    <c:forEach items="${topics}" var="topic">
                        <c:if test="${topic.id == test.topic}">
                            <c:out value="${topic.name}"/>
                        </c:if>

                    </c:forEach>
                </td>
                <td>${test.questions.size()}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/questions?testID=${test.id}" class="btn btn-warning"
                       style="" role="button" data-bs-toggle="button">+</a>

                    <a href="${pageContext.request.contextPath}/tests?action=EDIT&testID=${test.id}"
                       class="btn btn-warning" style="" role="button" data-bs-toggle="button">Edit</a>
                    <a href="${pageContext.request.contextPath}/delete?action=test&id=${test.id}"
                       class="btn btn-warning" style="" role="button" data-bs-toggle="button">delete test
                    </a>
                </td>
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