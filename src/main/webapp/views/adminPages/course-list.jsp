<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"
         language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<link rel="stylesheet" href="../../css/courses.css">

<html>


<head>
    <title><spring:message code="LocaleCourses"/>
    </title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="header_admin.jsp"/>
<div class="container" style="padding-top: 100px; padding-bottom: 100px; width: 80%; max-width: 100%">
    <h3><spring:message code="LocaleCourses"/>
    </h3>
    <a href="${pageContext.request.contextPath}/courses?action=add_course"
       class="btn btn-warning mb-4"
       style="" role="button"
       data-bs-toggle="button"><spring:message code="LocaleAddCourse"/>
    </a>
    <table id="datatable" class="table table-hover">
        <thead>
        <tr class="thead-light">
            <th><spring:message code="LocaleName"/>
            </th>
            <th><spring:message code="LocaleComplexity"/>
            </th>
            <th><spring:message code="LocaleEducationalProgram"/>
            </th>
            <th><spring:message code="LocaleAssignedStudents"/>
            </th>
            <th><spring:message code="LocaleActions"/>
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="course">
            <tr>
                <td>${course.name}</td>
                <td>${course.complexity}</td>
                <td>${course.educationalProgram}</td>
                <td>${course.getAssignedStudentNames()}</td>
                <td>
                    <div style="inline-size: max-content">
                        <a href="${pageContext.request.contextPath}/courses?action=view&id=${course.id}"
                           class="btn btn-warning" role="button"
                           data-bs-toggle="button"><spring:message code="LocaleViewContent"/>
                        </a>
                        <a href="${pageContext.request.contextPath}/courses?action=edit_course&id=${course.id}"
                           class="btn btn-warning" style="" role="button"
                           data-bs-toggle="button"><spring:message code="LocaleEdit"/>
                        </a>
                        <a href="${pageContext.request.contextPath}/courses?action=delete_course&id=${course.id}"
                           class="btn btn-danger" style="" role="button"
                           data-bs-toggle="button"><spring:message code="LocaleDelete"/>
                        </a>
                    </div>

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
<jsp:include page="../publicPages/footer.jsp"/>
</body>
</html>
<%request.getSession().removeAttribute("message");%>