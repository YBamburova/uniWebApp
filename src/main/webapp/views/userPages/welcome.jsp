<%--
  Created by IntelliJ IDEA.
  User: oyelis
  Date: 6/3/2023
  Time: 2:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/cover.css">
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

<html>
<head>
    <title><spring:message code="LocaleWelcome"/></title>
</head>
<body data-new-gr-c-s-check-loaded="14.1111.0" data-gr-ext-installed="">

<div class="site-wrapper">

    <div class="site-wrapper-inner">

        <div class="cover-container">

            <div class="masthead clearfix">
                <div class="inner">
                    <h3 class="masthead-brand"><img src="../../images/Equali-removebg-preview.png" width="200" height="40" alt="" ></h3>
                    <nav>
                        <ul class="nav masthead-nav">
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
                    </nav>
                </div>
            </div>

            <div class="inner cover">
                <h1 class="cover-heading"><spring:message code="LocaleWelcome"/>, ${user.name} ${user.surname}</h1>
                <p class="lead"><spring:message code="LocaleWelcomeMotivation"/></p>
                <p class="lead">
                    <a href="${pageContext.request.contextPath}/users?action=INFO" class="btn btn-lg btn-default"><spring:message
                            code="LocaleWelcomeStudy"/></a>
                </p>
            </div>

            <div class="mastfoot">
                <div class="inner">
                    <p>Developed by Y. Bamburova.</p>
                </div>
            </div>

        </div>

    </div>

</div>
</body>
<grammarly-desktop-integration data-grammarly-shadow-root="true"></grammarly-desktop-integration>
</html>
