<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<%!
    public String getResource(ResourceBundle resourceBundle, String resName) throws UnsupportedEncodingException {
        return new String(resourceBundle.getString(resName).getBytes("ISO-8859-1"), "UTF-8");
    }
%>

<% Locale currentLocale = new Locale((String) session.getAttribute("language"), (String) session.getAttribute("country"));
    ResourceBundle resource = ResourceBundle.getBundle("main", currentLocale);
    String LocaleAppName = getResource(resource, "LocaleAppName");
    String LocaleNavigation = getResource(resource, "LocaleNavigation");
    String LocaleStudentInfo = getResource(resource, "LocaleStudentInfo");
    String LocaleTests = getResource(resource, "LocaleTests");
    String LocaleLogout = getResource(resource, "LocaleLogout");
    String LocaleSignIn = getResource(resource, "LocaleSignIn");
    String LocaleSignUp = getResource(resource, "LocaleSignUp");
    String LocaleUsers = getResource(resource, "LocaleUsers");
    String LocaleAboutUs = getResource(resource, "LocaleAboutUs");

%>


<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><%=LocaleAppName%>
            </a>
        </div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light rounded" aria-label="Eleventh navbar example">
            <div class="container-fluid">
                <span class="navbar-brand"><%=LocaleNavigation%></span>


                <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                    <li class="nav-item">
                        <a class="nav-link active"
                           href="${pageContext.request.contextPath}/users?action=LIST"><%=LocaleUsers%>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page"
                           href="${pageContext.request.contextPath}/tests"><%=LocaleTests%>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/about-us.jsp"><%=LocaleAboutUs%>
                        </a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/logout.jsp"><%=LocaleLogout%>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link btn btn-light ml-5 pl-3 pr-3"
                           href="${pageContext.request.contextPath}/langSwitch?lang=en">en</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link btn btn-light ml-1 pl-3 pr-3"
                           href="${pageContext.request.contextPath}/langSwitch?lang=ua">ua</a>
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


