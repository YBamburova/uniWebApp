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
<jsp:include page="header_user.jsp"/>
<div class="container" style="padding-top: 100px; padding-bottom: 100px; width: 80%; max-width: 100%">
    <h3><spring:message code="LocaleCourses"/>
    </h3>
    <div class="row">
        <c:forEach items="${list}" var="course">
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img src="../../images/book_${course.educationalProgram}.png" alt="...">
                        <div class="caption">
                            <h3>${course.name}</h3>
                            <p><spring:message code="LocaleStartedDate"/>: ${course.startedDate}</p>
                            <p><spring:message
                                    code="LocaleCompletedDate"/>: ${course.completedDate}</p>
                            <p>
                                <c:if test="${course.startedDate == null}">
                                    <a href="${pageContext.request.contextPath}/courses?action=begin_course&id=${course.id}"
                                       class="btn btn-warning" role="button"
                                       data-bs-toggle="button"><spring:message
                                            code="LocaleBeginCourse"/>
                                    </a>
                                </c:if>
                                <c:if test="${course.startedDate != null}">
                                    <a href="${pageContext.request.contextPath}/courses?action=view&id=${course.id}"
                                       class="btn btn-warning" role="button"
                                       data-bs-toggle="button"><spring:message
                                            code="LocaleViewContent"/>
                                    </a>
                                </c:if>
                            </p>
                        </div>
                    </div>
                </div>
        </c:forEach>
    </div>


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
<nav class="navbar navbar-default navbar-fixed-bottom">
    <jsp:include page="../publicPages/chat.jsp"/>
</nav>
<jsp:include page="../publicPages/footer.jsp"/>
</body>
</html>
<%request.getSession().removeAttribute("message");%>