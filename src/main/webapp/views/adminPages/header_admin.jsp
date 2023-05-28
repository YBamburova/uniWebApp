<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script type="text/javascript">
  $(document).ready(function () {
    $("#en-lang").click(function () {
      window.location.replace('?lang=en');
    });
    $("#ua-lang").click(function () {
      window.location.replace('?lang=ua');
    });
  });
</script>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><spring:message code="LocaleAppName"/>
            </a>
        </div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light rounded"
             aria-label="Eleventh navbar example">
            <div class="container-fluid">
                <span class="navbar-brand"><spring:message code="LocaleNavigation"/></span>


                <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                    <li class="nav-item">
                        <a id="usersTab" class="nav-link"
                           href="${pageContext.request.contextPath}/users?action=LIST"><spring:message
                                code="LocaleUsers"/>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a id="testsTab" class="nav-link" aria-current="page"
                           href="${pageContext.request.contextPath}/tests"><spring:message
                                code="LocaleTests"/>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a id="coursesTab" class="nav-link"
                           href="${pageContext.request.contextPath}/courses"><spring:message
                                code="LocaleCourses"/>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link"
                           href="${pageContext.request.contextPath}/logout.jsp"><spring:message
                                code="LocaleLogout"/>
                        </a>
                    </li>
                    <li class="nav-item" id="en-lang">
                        <a class="nav-link btn btn-light ml-5 pl-3 pr-3">en</a>
                    </li>

                    <li class="nav-item" id="ua-lang">
                        <a class="nav-link btn btn-light ml-1 pl-3 pr-3">ua</a>
                    </li>
                </ul>
            </div>
        </nav>
            <%
    if (session.getAttribute("message") != null){
        out.print("<div class=\"alert alert-success\" role=\"alert\">\n" +
                  session.getAttribute("message") +
                "</div>");
    }
    session.removeAttribute("message");
    %>
</nav>


