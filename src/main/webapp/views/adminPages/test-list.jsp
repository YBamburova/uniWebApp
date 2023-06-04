<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"
         language="java" %>

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
    <title><spring:message code="LocaleTests"/>
    </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.23/datatables.min.css"/>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
</head>
<body>
<jsp:include page="header_admin.jsp"/>

<div class="container" style="padding-top: 100px; margin-bottom: 100px">
    <h3><spring:message code="LocaleTests"/>
    </h3>
    <a href="${pageContext.request.contextPath}/tests?action=add" class="btn btn btn-warning mb-0" style="width: 200px"
       role="button" data-bs-toggle="button"><spring:message code="LocaleAddTest"/>
    </a>
    <table id="datatable" class="table table-hover">
        <thead>
        <tr class="thead-light">
            <th>ID</th>
            <th><spring:message code="LocaleTestName"/>
            </th>
            <th><spring:message code="LocaleComplexity"/>
            </th>
            <th><spring:message code="LocaleNumberOfRequests"/>
            </th>
            <th><spring:message code="LocaleTimeForTest"/>
            </th>
            <th><spring:message code="LocaleTopic"/>
            </th>
            <th><spring:message code="LocaleQuestion"/>
            </th>
            <th><spring:message code="LocaleAssignedStudents"/>
            </th>
            <th><spring:message code="LocaleAddQuestion"/>
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
                <td>${test.getAssignedStudentNames()}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/questions?testID=${test.id}" class="btn btn-warning"
                       style="" role="button" data-bs-toggle="button">+</a>
                    <a href="${pageContext.request.contextPath}/tests?action=EDIT&testID=${test.id}"
                       class="btn btn-warning" style="" role="button" data-bs-toggle="button"><spring:message code="LocaleEdit"/></a>
                    <a href="${pageContext.request.contextPath}/delete?action=test&id=${test.id}"
                       class="btn btn-warning" style="" role="button" data-bs-toggle="button"><spring:message code="LocaleDelete"/>
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
<jsp:include page="../publicPages/footer.jsp"/>
</body>
</html>
<%request.getSession().removeAttribute("message");%>