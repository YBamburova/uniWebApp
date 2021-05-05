<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!
    public String getResource(ResourceBundle resourceBundle, String resName) throws UnsupportedEncodingException, UnsupportedEncodingException {
        return new String(resourceBundle.getString(resName).getBytes("ISO-8859-1"), "UTF-8");
    }
%>

<% Locale currentLocale = new Locale((String) session.getAttribute("language"), (String) session.getAttribute("country"));
    ResourceBundle resource = ResourceBundle.getBundle("main", currentLocale);
    String LocaleTestInProgress = getResource(resource, "LocaleTestInProgress");
    String LocaleTimeLeft = getResource(resource, "LocaleTimeLeft");

%>
<html>
<%
    String username = (String) session.getAttribute("username");
    System.out.println(session.getAttribute("userID"));
    if (username == null) {
        response.sendRedirect("login");
    }
    request.setAttribute("testID", request.getParameter("testID"));
%>
<head>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">

    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="//cdn.rawgit.com/hilios/jQuery.countdown/2.2.0/dist/jquery.countdown.min.js"></script>
    <title><%=LocaleTestInProgress%>
    </title>
</head>
<body>
<div class="container pt-5">
    <div style="position: sticky; top: 0; z-index: 2; width: 100%" class="card align-items-center bg-white mb-5">
        <h3><%=LocaleTimeLeft%>
        </h3>
        <div class="badge" style="font-size: 35px; margin-bottom: 20px" id="clock"></div>
        <button form="testForm" class="btn btn-warning align-self-end" style="width: 100%">Submit test</button>
    </div>

    <form style="font-size: 16px; font-family: 'Montserrat'" method="post" id="testForm">
        <c:forEach varStatus="loop" items="${list}" var="question">
            <input type="hidden" name="questions" value="${question.id}">
            <div class="card question mb-5">
                <strong class="card-header border-0 mb-2" id="${question.id}">
                        ${loop.index + 1}.
                        ${question.text}
                </strong>
                <div class="form-check d-flex align-items-center mb-2">
                    <input class="form-check-input position-static mt-0 mr-2" value="true" type="checkbox"
                           name="${question.id}1">
                        ${question.option1}
                </div>

                <div class="form-check d-flex align-items-center mb-2">
                    <input class="form-check-input position-static mt-0 mr-2" type="checkbox" value="true"
                           name="${question.id}2">
                        ${question.option2}
                </div>

                <div class="form-check d-flex align-items-center mb-2">
                    <input class="form-check-input position-static mt-0 mr-2" type="checkbox" value="true"
                           name="${question.id}3">
                        ${question.option3}
                </div>

                <div class="form-check d-flex align-items-center mb-2">
                    <input class="form-check-input position-static mt-0 mr-2" type="checkbox" value="true"
                           name="${question.id}4">
                        ${question.option4}
                </div>
            </div>

        </c:forEach>
    </form>
</div>

<script type="text/javascript">
    const testTimeMs =
    <%
       if (request.getParameter("time")!=null){
           out.print(Integer.parseInt(request.getParameter("time")));
       }else {out.print(10);}%> *
    60;
    const timerBlock = document.querySelector('#clock');

    function timer(seconds, tick, result) {
        if (seconds > 0) {
            tick(seconds);
            seconds -= 1;
            setTimeout(function () {
                timer(seconds, tick, result);
            }, 1000);
        } else {
            result();
        }
    }

    timer(testTimeMs, function (secondsLeft) {
        const minutes = Math.floor(secondsLeft / 60).toFixed(0);
        const seconds = secondsLeft % 60;
        const modifiedSeconds = seconds < 10 ? '0' + seconds : seconds;
        timerBlock.innerHTML = minutes + ':' + modifiedSeconds;
    }, function () {
        const form = document.querySelector('#testForm');
        form.submit();
    });
</script>
</body>
</html>