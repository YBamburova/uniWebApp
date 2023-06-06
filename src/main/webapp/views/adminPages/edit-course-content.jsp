<%--
  Created by IntelliJ IDEA.
  User: oyelis
  Date: 5/27/2023
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<link rel="stylesheet" href="../../css/courses.css">

<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
<script type="text/javascript"
        src="https://cdn.datatables.net/v/bs4/dt-1.10.23/datatables.min.js"></script>
<script>
  $(document).ready(function () {
    $('#reviewCourse').click(function () {
      var html = $('#courseHtml').val();
      $('#reviewCourseArea').empty()
      if (html == '') {
        $('#reviewCourseArea').html('Please set "html" content to review')
      } else {
        $('#reviewCourseArea').html($.parseHTML(html))
      }
    });
  })
</script>

<html>
<head>
    <title><spring:message code="LocaleViewContent"/>
    </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="header_admin.jsp"/>
<div class="container" style="padding-top: 100px; width: 80%; max-width: 100%;">
    <div class="row">
        <div class="col-md-6">
            <a href="${pageContext.request.contextPath}/courses" class="btn btn-primary mb-4"
               style="" role="button"><spring:message code="LocaleBack"/>
            </a>
            <button type="submit" form="course-form" class="btn btn-warning mb-4"
                    role="button"><spring:message code="LocaleUpdate"/>
            </button>
        </div>
        <div class="col-md-6">
            <button type="button" class="btn btn-primary mb-4" id="reviewCourse">
                Preview
            </button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <form id="course-form" action="${pageContext.request.contextPath}/courses/content"
                  method="post">
                <textarea style="min-height: 500px" id="courseHtml" class="form-control"
                          rows="25" name="content">${course.content}</textarea>
                <input type="hidden" name="id" value="${course.id}">
            </form>
        </div>
        <div class="col-md-6" style="background-color: aliceblue; border-radius: 10px">
            <div id="reviewCourseArea">${course.content}</div>
        </div>
    </div>
</div>
<jsp:include page="../publicPages/footer.jsp"/>
</body>
</html>
