<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"
         language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>


<head>
    <title><spring:message code="LocaleCourses"/>
    </title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header_user.jsp"/>
<div class="container" style="padding-top: 10px; width: 80%; max-width: 100%">
    <h3><spring:message code="LocaleCourses"/>
    </h3>
    <table id="datatable" class="table table-hover">
        <thead>
        <tr class="thead-light">
            <th><spring:message code="LocaleName"/>
            </th>
            <th><spring:message code="LocaleStartedDate"/>
            </th>
            <th><spring:message code="LocaleCompletedDate"/>
            </th>
            <th><spring:message code="LocaleActions"/>
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="course">
            <tr>
                <td>${course.name}</td>
                <td>${course.startedDate}</td>
                <td>${course.completedDate}</td>
                <td>
                    <c:if test="${course.startedDate == null}">
                        <a href="${pageContext.request.contextPath}/courses?action=begin_course&id=${course.id}"
                           class="btn btn-warning" role="button"
                           data-bs-toggle="button"><spring:message code="LocaleBeginCourse"/>
                        </a>
                    </c:if>
                    <c:if test="${course.startedDate != null}">
                        <a href="${pageContext.request.contextPath}/courses?action=view&id=${course.id}"
                           class="btn btn-warning" role="button"
                           data-bs-toggle="button"><spring:message code="LocaleViewContent"/>
                        </a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot></tfoot>
    </table>

</div>
<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
<script type="text/javascript"
        src="https://cdn.datatables.net/v/bs4/dt-1.10.23/datatables.min.js"></script>
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