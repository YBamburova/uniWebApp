<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%

    String username = (String) session.getAttribute("username");

    System.out.println(session.getAttribute("userID"));
    if (username == null) {
        response.sendRedirect("login");
    }
%>
<%!
    public String getResource(ResourceBundle resourceBundle, String resName) throws UnsupportedEncodingException {
        return new String(resourceBundle.getString(resName).getBytes("ISO-8859-1"), "UTF-8");
    }
%>

<% Locale currentLocale = new Locale((String) session.getAttribute("language"), (String) session.getAttribute("country"));
    ResourceBundle resource = ResourceBundle.getBundle("main", currentLocale);
    String LocaleAddQuestion = getResource(resource, "LocaleAddQuestion");
    String LocaleRightAnswer = getResource(resource, "LocaleRightAnswer");
    String LocaleOption = getResource(resource, "LocaleOption");
    String LocaleQuestion = getResource(resource, "LocaleQuestion");
    String LocaleSubmit = getResource(resource, "LocaleSubmit");

%>
<head>
    <title><%=LocaleAddQuestion%>></title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container" style="width: 450px">
    <h1><span class="badge badge-secondary"><%=LocaleAddQuestion%></span></h1>
    <div class="card">
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/questions" method="post" id="form">
                <input type="hidden" name="testID" value="<%= request.getParameter("testID")%>">
                <div class="mb-3">
                    <label for="Question" class="form-label"><%=LocaleQuestion%>
                    </label>
                    <input minlength="1" maxlength="1900" id="Question" class="form-control"
                           placeholder="<%=LocaleQuestion%>" type="text" name="text" required>
                    <br>
                </div>
                <div class="mb-3">
                    <label for="option1" class="form-label"><%=LocaleOption%>1</label>
                    <input minlength="1" maxlength="1400" id="option1" class="form-control"
                           placeholder="<%=LocaleOption%>1" type="text" name="option1" required>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="true" name="option1IsCorrect"
                               id="flexCheckDefault1">
                        <label class="form-check-label" for="flexCheckDefault1">
                            <%=LocaleRightAnswer%>
                        </label>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="option2" class="form-label"><%=LocaleOption%>2</label>
                    <input minlength="1" maxlength="1400" id="option2" class="form-control"
                           placeholder="<%=LocaleOption%>2" type="text" name="option2" required>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="true" name="option2IsCorrect"
                               id="flexCheckDefault2">
                        <label class="form-check-label" for="flexCheckDefault2">
                            <%=LocaleRightAnswer%>
                        </label>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="option3" class="form-label"><%=LocaleOption%>3</label>
                    <input minlength="1" maxlength="1400" id="option3" class="form-control"
                           placeholder="<%=LocaleOption%>3" type="text" name="option3" required>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="true" name="option3IsCorrect"
                               id="flexCheckDefault3">
                        <label class="form-check-label" for="flexCheckDefault3">
                            <%=LocaleRightAnswer%>
                        </label>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="option4" class="form-label"><%=LocaleOption%>4</label>
                    <input minlength="1" maxlength="1400" id="option4" class="form-control"
                           placeholder="<%=LocaleOption%>4" type="text" name="option4" required>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="true" name="option4IsCorrect"
                               id="flexCheckDefault4">
                        <label class="form-check-label" for="flexCheckDefault4">
                            <%=LocaleRightAnswer%>
                        </label>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary"><%=LocaleSubmit%>
                </button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
