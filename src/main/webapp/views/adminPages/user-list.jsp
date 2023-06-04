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
    <title><spring:message code="LocaleUsers"/>
    </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="header_admin.jsp"/>
<div class="container" style="padding-top: 100px; width: 80%; max-width: 100%">
    <h3><spring:message code="LocaleUsers"/>
    </h3>
    <a href="${pageContext.request.contextPath}/users?action=ADD" class="btn btn-warning mb-4" style="" role="button"
       data-bs-toggle="button"><spring:message code="LocaleAddUser"/>
    </a>
    <table id="datatable" class="table table-hover">
        <thead>
        <tr class="thead-light">
            <th><spring:message code="LocaleUsername"/>
            </th>
            <th><spring:message code="LocaleName"/>
            </th>
            <th><spring:message code="LocaleSurname"/>
            </th>
            <th><spring:message code="LocaleEmail"/>
            </th>
            <th><spring:message code="LocaleType"/>
            </th>
            <th><spring:message code="LocaleEducationalProgram"/>
            </th>
            <th><spring:message code="LocaleSupportLevel"/>
            </th>
            <th><spring:message code="LocaleAdditionalInfo"/>
            </th>
            <th><spring:message code="LocaleActions"/>
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="user">
            <tr class="${user.type == 'admin' ? 'active' : ''}">
                <td>${user.username}</td>
                <td>${user.name}</td>
                <td>${user.surname}</td>
                <td>${user.email}</td>
                <td>${user.type}</td>
                <td>${user.type == 'admin' ? '' : user.educationalProgram}</td>
                <td>${user.type == 'admin' ? '' : user.supportLevel}</td>
                <td>${user.type == 'admin' ? '' : user.additionalInfo}</td>
                <c:if test="${user.isBlocked eq 'false' && user.type eq 'student'}">
                    <td>
                        <a href="${pageContext.request.contextPath}/users/block?id=${user.id}"
                           class="btn btn-warning" role="button"
                           data-bs-toggle="button"><spring:message code="LocaleBlockUser"/>
                        </a>
                        <a href="${pageContext.request.contextPath}/users?action=view_statistics&id=${user.id}"
                           class="btn btn-warning" role="button"
                           data-bs-toggle="button"><spring:message code="LocaleStatistics"/>
                        </a>
                        <a href="${pageContext.request.contextPath}/users?action=EDIT&id=${user.id}"
                           class="btn btn-warning" style="" role="button" data-bs-toggle="button"><spring:message code="LocaleEdit"/>
                        </a>
                        <a href="${pageContext.request.contextPath}/delete?action=user&id=${user.id}"
                           class="btn btn-danger" style="" role="button" data-bs-toggle="button"><spring:message code="LocaleDelete"/>
                        </a>
                    </td>
                </c:if>
                <c:if test="${user.isBlocked eq 'true' && user.type eq 'student'}">
                    <td>
                        <a href="${pageContext.request.contextPath}/users/unblock?id=${user.id}"
                           class="btn btn-info" style="width: 150px" role="button"
                           data-bs-toggle="button"><spring:message code="LocaleUnblock"/>
                        </a>
                        <a href="${pageContext.request.contextPath}/users?action=EDIT&id=${user.id}"
                           class="btn btn-warning" style="" role="button" data-bs-toggle="button"><spring:message code="LocaleEdit"/>
                        </a>
                        <a href="${pageContext.request.contextPath}/delete?action=user&id=${user.id}"
                           class="btn btn-danger" style="" role="button" data-bs-toggle="button"><spring:message code="LocaleDelete"/>
                        </a>
                    </td>
                </c:if>
                <c:if test="${user.type eq 'admin'}">
                    <td></td>
                </c:if>
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