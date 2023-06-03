<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"
         language="java" %>

<html>
<%
    String username = (String) session.getAttribute("username");
    System.out.println(session.getAttribute("userID"));
    if (username == null) {
        response.sendRedirect("login");
    }
%>
<head>
    <title><spring:message code="LocaleStatisticsName"/>
    </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="header_admin.jsp"/>
<div class="container" style="padding-top: 100px; width: 80%; max-width: 100%">
    <h3><spring:message code="LocaleStatisticsName"/>
    </h3>
    <table id="datatable" class="table table-hover">
        <thead>
        <tr class="thead-light">
            <th><spring:message code="LocaleAttribute"/>
            </th>
            <th><spring:message code="LocaleValue"/>
            </th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><spring:message code="LocaleName"/></td>
            <td>${userStatistics.name}</td>
        </tr>
        <tr>
            <td><spring:message code="LocaleSurname"/></td>
            <td>${userStatistics.surname}</td>
        </tr>
        <tr>
            <td><spring:message code="LocaleAssignedCourses"/></td>
            <td>${userStatistics.assignedCourses}</td>
        </tr>
        <tr>
            <td id="started_courses_name_id"><spring:message code="LocaleStartedCourses"/></td>
            <td id="started_courses_id">${userStatistics.startedCourses}</td>
        </tr>
        <tr>
            <td id="completed_courses_name_id"><spring:message code="LocaleCompletedCourses"/></td>
            <td id="completed_courses_id">${userStatistics.completedCourses}</td>
        </tr>
        <tr>
            <td><spring:message code="LocaleTakenTests"/></td>
            <td>${userStatistics.takenTests}</td>
        </tr>
        <tr>
            <td id="failed_tests_name_id"><spring:message code="LocaleFailedTests"/></td>
            <td id="failed_tests_id">${userStatistics.failedTests}</td>
        </tr>
        <tr>
            <td id="passed_tests_name_id"><spring:message code="LocalePassedTests"/></td>
            <td id="passed_tests_id">${userStatistics.passedTests}</td>
        </tr>
        </tbody>
        <tfoot></tfoot>
    </table>

</div>


<div class="row">
    <div id="content1" style="height: 400px" class="col-md-6">
        <canvas style="margin: auto" id="courseChart"></canvas>
    </div>
    <div id="content2" style="height: 400px" class="col-md-6">
        <canvas style="margin: auto" id="testChart"></canvas>
    </div>
</div>

<div>


</div>

<label id="tests_statistics_id" hidden="hidden"><spring:message code="LocaleTestsStatistics"/></label>
<label id="course_statistics_id" hidden="hidden"><spring:message code="LocaleCourseStatistics"/></label>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
  $(document).ready(function () {
    const ctx = document.getElementById('courseChart');
    var startedCourses = parseInt(document.getElementById("started_courses_id").innerText);
    var startedCoursesName = document.getElementById("started_courses_name_id").innerText;
    var completedCourses = parseInt(document.getElementById("completed_courses_id").innerText);
    var completedCoursesName = document.getElementById("completed_courses_name_id").innerText;
    var tests_statistics_name = document.getElementById("tests_statistics_id").innerText;
    var course_statistics_name = document.getElementById("course_statistics_id").innerText;
    if (startedCourses === 0 && completedCourses === 0) {
      document.getElementById('content1').setAttribute('hidden', 'hidden')
    }
    const data = {
      labels: [startedCoursesName, completedCoursesName],
      datasets: [
        {
          label: '',
          data: [startedCourses, completedCourses],
          backgroundColor: [
            'rgb(250,171,0)',
            'rgba(58,252,0,0.97)'
          ],
        }
      ]
    };
    const config = {
      type: 'pie',
      data: data,
      options: {
        responsive: true,
        plugins: {
          legend: {
            position: 'top',
          },
          title: {
            display: true,
            text: course_statistics_name
          }
        }
      },
    };
    new Chart(ctx, config);
    const ctx2 = document.getElementById('testChart');
    var failed_tests = parseInt(document.getElementById("failed_tests_id").innerText);
    var failed_tests_name = document.getElementById("failed_tests_name_id").innerText;
    var passed_tests = parseInt(document.getElementById("passed_tests_id").innerText);
    var passed_tests_name = document.getElementById("passed_tests_name_id").innerText;
    if (failed_tests === 0 && passed_tests === 0) {
      document.getElementById('content2').setAttribute('hidden', 'hidden');
    }
    const data2 = {
      labels: [failed_tests_name, passed_tests_name],
      datasets: [
        {
          label: '',
          data: [failed_tests, passed_tests],
          backgroundColor: [
            'rgb(250,0,53)',
            'rgba(58,252,0,0.97)'
          ],
        }
      ]
    };
    const config2 = {
      type: 'pie',
      data: data2,
      options: {
        responsive: true,
        plugins: {
          legend: {
            position: 'top',
          },
          title: {
            display: true,
            text: tests_statistics_name
          }
        }
      },
    };
    new Chart(ctx2, config2);
  })
</script>
</body>
</html>
<%request.getSession().removeAttribute("message");%>