<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"
         language="java" %>

<%
    String[] levels = new String[]{"0", "1", "2", "3", "4", "5"};
    pageContext.setAttribute("supportLevels", levels);
    String[] educationalPrograms = new String[]{"typical", "modified", "adaptive"};
    pageContext.setAttribute("educationalPrograms", educationalPrograms);
%>

<html>

<head>
    <title><spring:message code="LocaleAddUser"/>
    </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>

<body>

<div class="container" style="width: 450px; padding-top: 70px">
    <div class="card">
        <div class="card-body">

            <form action="${pageContext.request.contextPath}/users" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label"><spring:message code="LocaleUsername"/>
                    </label>
                    <input minlength="3" maxlength="45" id="username" class="form-control"
                           placeholder="<spring:message code="LocaleUsername"/>" type="text"
                           name="username" value="${user.username}"
                           required><br>
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label"><spring:message code="LocaleName"/>
                    </label>
                    <input minlength="3" maxlength="45" id="name" class="form-control"
                           placeholder="<spring:message code="LocaleName"/>"
                           type="text" name="name" value="${user.name}" required><br>
                </div>
                <div class="mb-3">
                    <label for="surname" class="form-label"><spring:message code="LocaleSurname"/>
                    </label>
                    <input minlength="3" maxlength="45" id="surname" class="form-control"
                           placeholder="<spring:message code="LocaleSurname"/>" type="text"
                           name="surname" value="${user.surname}" required><br>
                </div>
                <div class="mb-3">
                    <label for="educationalProgram" class="form-label"><spring:message
                            code="LocaleEducationalProgram"/>
                    </label>
                    <select id="educationalProgram" name="educationalProgram" class="form-control">
                        <c:forEach var="program" items="${educationalPrograms}">
                            <option value="${program}" ${user.educationalProgram == program ? 'selected="selected"' : ''}>${program}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="supportLevel" class="form-label"><spring:message
                            code="LocaleSupportLevel"/>
                    </label>
                    <select id="supportLevel" name="supportLevel" class="form-control">
                        <c:forEach var="level" items="${supportLevels}">
                            <option value="${level}" ${user.supportLevel == level ? 'selected="selected"' : ''}>${level}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="additionalInfo" class="form-label"><spring:message
                            code="LocaleAdditionalInfo"/>
                    </label>
                    <textarea maxlength="255" id="additionalInfo" class="form-control" rows="3"
                              placeholder="<spring:message code="LocaleAdditionalInfo"/>"
                              name="additionalInfo">${user.additionalInfo}</textarea>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label"><spring:message code="LocaleEmail"/>
                    </label>
                    <input pattern="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" maxlength="45" id="email"
                           class="form-control"
                           placeholder="<spring:message code="LocaleEmail"/>" type="text"
                           name="email" value="${user.email}" required><br>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label"><spring:message code="LocalePassword"/>*</label>
                    <input pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" maxlength="45"
                           minlength="8"
                           id="password" class="form-control"
                           placeholder="<spring:message code="LocalePassword"/>"
                           value="<%=session.getAttribute("password")%>" type="password"
                           name="password" required><br>
                    <p class="text-info">*<spring:message code="LocalePassDescription"/>
                    </p>
                </div>
                <input type="hidden" name="id" value="${user.id}">
                <button type="submit" class="btn btn-lg btn-primary btn-block"><spring:message code="LocaleSubmit"/>
                </button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
