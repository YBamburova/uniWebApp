<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: RyzenPC--%>
<%--  Date: 09.02.2021--%>
<%--  Time: 17:25--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%--    <%--%>

<%--String username = (String) session.getAttribute("username");--%>

<%--    System.out.println(session.getAttribute("userID"));--%>
<%--if (username == null){--%>
<%--    response.sendRedirect("login");--%>
<%--}--%>
<%--%>--%>
<head>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="//cdn.rawgit.com/hilios/jQuery.countdown/2.2.0/dist/jquery.countdown.min.js"></script>
    <title>Redirecting</title>
</head>
<body>
    <%
if (request.getSession().getAttribute("type") == null){
response.sendRedirect("login");
}
else if (request.getSession().getAttribute("type").equals("admin")){
    response.sendRedirect(request.getContextPath()+"/users?action=LIST");

}else if (request.getSession().getAttribute("type").equals("student")){
   response.sendRedirect(request.getContextPath()+"/users");
}
%>


Please wait for redirection or: <br>

<div class="container" style="width: 450px; padding-top: 70px">
    <a href="${pageContext.request.contextPath}/users?action=LIST" class="btn btn-info btn-block" style="width: 200px"
       role="button" data-bs-toggle="button">users</a>
    <a href="${pageContext.request.contextPath}/webapp/jsps/views/publicPages/user-add.jsp" class="btn btn-info btn-block"
       style="width: 200px" role="button" data-bs-toggle="button">users</a>
    <a href="${pageContext.request.contextPath}/tests" class="btn btn-info btn-block" style="width: 200px" role="button"
       data-bs-toggle="button">tests</a>
    <a href="${pageContext.request.contextPath}/tests?action=add" class="btn btn-info btn-block" style="width: 200px"
       role="button" data-bs-toggle="button">test-add</a>
    <a href="${pageContext.request.contextPath}/questions" class="btn btn-info btn-block" style="width: 200px"
       role="button" data-bs-toggle="button">question-add</a>
    <a href="${pageContext.request.contextPath}/login" class="btn btn-info btn-block" style="width: 200px" role="button"
       data-bs-toggle="button">login</a>
</div>

<%--<div class="container">--%>
<%--    <div style="position: sticky; width: 300px; top: 0" class="card align-items-center">--%>


<%--                <h3>Time left:</h3>--%>
<%--                <div class="badge" style="font-size: 35px; margin-bottom: 20px" id="clock"></div>--%>
<%--        <button type="submit" form="form" class="btn btn-warning align-self-end" style="width: 100%">Submit test</button>--%>


<%--    </div>--%>
<%--    <form action="${pageContext.request.contextPath}/pass" method="post" id="form">--%>
<%--        <div class="mb-3">--%>
<%--            <label for="username" class="form-label" >Username</label>--%>
<%--            <input minlength="3" maxlength="45" id="username" class="form-control" placeholder="username" type="text" name="username" value="${user.username}" required><br>--%>
<%--        </div>--%>


<%--    </form>--%>
<%--</div>--%>


<%--<script type="text/javascript">--%>
<%--    const testTimeMs = <%out.print(Integer.parseInt(request.getParameter("time")));%> * 60;--%>
<%--    const timerBlock = document.querySelector('#clock');--%>

<%--    function timer (seconds, tick, result) {--%>
<%--        if (seconds > 0) {--%>
<%--            tick(seconds);--%>
<%--            seconds -= 1;--%>
<%--            setTimeout(function () {--%>
<%--                timer(seconds, tick, result);--%>
<%--            }, 1000);--%>
<%--        } else {--%>
<%--            result();--%>
<%--        }--%>
<%--    }--%>

<%--    timer(testTimeMs, function (secondsLeft) {--%>
<%--        const minutes = Math.floor(secondsLeft / 60).toFixed(0);--%>
<%--        const seconds = secondsLeft % 60;--%>
<%--        const modifiedSeconds = seconds < 10 ? '0' + seconds : seconds;--%>
<%--        timerBlock.innerHTML = minutes + ':' + modifiedSeconds;--%>
<%--    }, function () {--%>
<%--        const form = document.querySelector('#form');--%>

<%--        form.submit();--%>
<%--    });--%>

<%--</script>--%>


<%--<script src="jquery.countdown.js"></script>--%>
<%--</body>--%>
<%--</html>--%>
