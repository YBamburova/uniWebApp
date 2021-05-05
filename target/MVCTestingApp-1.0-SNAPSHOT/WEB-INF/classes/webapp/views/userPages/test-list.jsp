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
<html>
<%
    String username = (String) session.getAttribute("username");
    System.out.println(session.getAttribute("userID"));
    if (username == null) {
        response.sendRedirect("login");
    }
%>
<head>
    <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title><%=LocaleTests%>
    </title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.23/datatables.min.css"/>
</head>
<body>
<jsp:include page="header_user.jsp"/>
<div class="container" style="padding-top: 10px; margin-bottom: 100px">
    <h3><%=LocaleTests%>
    </h3>
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
                        <th><%=LocaleTopic%></th>
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
                <td>${test.name}</td>
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
                    <c:set scope="request" var="flag" value="false"/>
                    <c:set scope="request" var="result" value=""/>
                    <c:forEach items="${listpassed}" var="passedTest">
                        <c:if test="${test.id == passedTest.testID}">
                            <c:set scope="request" var="flag" value="true"/>
                            <c:set scope="request" var="result" value="${passedTest.result}"/>
                        </c:if>
                    </c:forEach>
                    <c:if test="${flag == 'false'&& test.questions.size() !=0}">
                        <a href="${pageContext.request.contextPath}/pass?time=${test.timeForTest}&testID=${test.id}&userID=${userID}"
                           class="btn btn-warning" style="" role="button" data-bs-toggle="button">pass</a>
                    </c:if>
                    <c:if test="${flag == 'true'}">
                        Result:${result}%
                    </c:if>
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
