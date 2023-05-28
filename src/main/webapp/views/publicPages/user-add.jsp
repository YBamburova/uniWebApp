<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<head>
    <title><spring:message code="LocaleSignUp"/></title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
<jsp:include page="header_public.jsp"/>
<div class="container" style="width: 450px; padding-top: 70px">
    <div class="card">
        <div class="card-body">

            <form action="${pageContext.request.contextPath}/users" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label"><spring:message code="LocaleUsername"/>
                    </label>
                    <input minlength="3" maxlength="45" id="username" class="form-control"
                           placeholder="<spring:message code="LocaleUsername"/>" type="text" name="username" required><br>
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label"><spring:message code="LocaleName"/>
                    </label>
                    <input minlength="3" maxlength="45" id="name" class="form-control" placeholder="<spring:message code="LocaleName"/>"
                           type="text" name="name" required><br>
                </div>
                <div class="mb-3">
                    <label for="surname" class="form-label"><spring:message code="LocaleSurname"/>
                    </label>
                    <input minlength="3" maxlength="45" id="surname" class="form-control"
                           placeholder="<spring:message code="LocaleSurname"/>" type="text" name="surname" required><br>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label"><spring:message code="LocaleEmail"/>
                    </label>
                    <input pattern="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" maxlength="45" id="email" class="form-control"
                           placeholder="<spring:message code="LocaleEmail"/>" type="text" name="email" required><br>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label"><spring:message code="LocalePassword"/>*</label>
                    <input pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" maxlength="45" minlength="8"
                           id="password" class="form-control" placeholder="<spring:message code="LocalePassword"/>"
                           value="<%=session.getAttribute("password")%>" type="password" name="password" required><br>
                    <p class="text-info">*<spring:message code="LocalePassDescription"/>
                    </p>
                </div>
                <input type="hidden" name="id">
                <button type="submit" class="btn btn-primary"><spring:message code="LocaleSubmit"/>
                </button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
