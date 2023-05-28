<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"
         language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>

<%
    String[] educationalPrograms = new String[]{"typical", "modified", "adaptive"};
    pageContext.setAttribute("educationalPrograms", educationalPrograms);
%>

<head>
    <title><spring:message code="LocaleAddCourse"/>
    </title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="container" style="width: 450px; padding-top: 70px">
    <div class="card">
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/courses/update" method="post">

                <div class="mb-3">
                    <label for="name" class="form-label"><spring:message code="LocaleName"/>
                    </label>
                    <input value="${course.name}" minlength="3" maxlength="45" id="name" class="form-control"
                           placeholder="<spring:message code="LocaleName"/>"
                           type="text" name="name" required><br>
                </div>
                <div class="mb-3">
                    <label for="complexity" class="form-label"><spring:message code="LocaleComplexity"/>
                    </label>
                    <input value="${course.complexity}" id="complexity" class="form-control-range" type="range" name="complexity"
                           min="1" max="10"
                           step="1">
                    1_____2_____3_____4_____5____6_____7_____8____9____10
                </div>
                <div class="mb-3">
                    <label for="educationalProgram" class="form-label"><spring:message code="LocaleEducationalProgram"/>
                    </label>
                    <select id="educationalProgram" name="educationalProgram" class="form-control">
                        <c:forEach var="program" items="${educationalPrograms}">
                            <option value="${program}" ${course.educationalProgram == program ? 'selected="selected"' : ''}>${program}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="assignedStudents" class="form-label"><spring:message code="LocaleAssignedStudents"/>
                    </label>
                    <select id="assignedStudents" name="assignedStudents" class="form-control" multiple>
                        <c:forEach var="st" items="${students}">
                            <option value="${st.id}" ${course.hasAssignedStudent(st.id) ? 'selected="selected"' : ''}>${st.name}, ${st.surname}</option>
                        </c:forEach>
                    </select>
                </div>
                <input type="hidden" name="id" value="${course.id}">
                <button type="submit" class="btn btn-primary"><spring:message code="LocaleSubmit"/>
                </button>
            </form>
        </div>

    </div>
</div>

</body>
</html>
