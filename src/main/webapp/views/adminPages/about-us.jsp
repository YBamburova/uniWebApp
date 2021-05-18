<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"
         language="java" %>

<%!
    public String getResource(ResourceBundle resourceBundle, String resName) throws UnsupportedEncodingException, UnsupportedEncodingException {
        return new String(resourceBundle.getString(resName).getBytes("ISO-8859-1"), "UTF-8");
    }
%>
<% Locale currentLocale = new Locale((String) session.getAttribute("language"), (String) session.getAttribute("country"));
    ResourceBundle resource = ResourceBundle.getBundle("main", currentLocale);

    String LocaleAddUser = getResource(resource, "LocaleAddUser");
    String LocaleUsername = getResource(resource, "LocaleUsername");
    String LocaleName = getResource(resource, "LocaleName");
    String LocaleSurname = getResource(resource, "LocaleSurname");
    String LocaleEmail = getResource(resource, "LocaleEmail");
    String LocaleUsers = getResource(resource, "LocaleUsers");
    String LocaleType = getResource(resource, "LocaleType");
    String LocaleActions = getResource(resource, "LocaleActions");
    String LocaleBlockUser = getResource(resource, "LocaleBlockUser");
    String LocaleEdit = getResource(resource, "LocaleEdit");
    String LocaleWelcome = getResource(resource, "LocaleWelcome");
    String LocaleAboutUs = getResource(resource, "LocaleAboutUs");

%>
<html>
<head>
    <title><%=LocaleAboutUs%>
    </title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">


</head>

<body>
<jsp:include page="header_user.jsp"/>
<div class="" style="position: absolute; right:20px" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
    </div>
    <div class="toast-body">
        <p class="lead">${message}</p>
    </div>
</div>


<div class="container" style="padding-top: 10px">
    <h4><%=LocaleAboutUs%></h4>
    <h5>About Project</h5>
    <p class="col-12 col-md-7">Our project helps people to create online tests and use them for studying purposes. Mostly tests and learning materials are about programming but in future we plan to make it for as more fields as possible. We also plan to create certificates that can prove you knowledge</p>
    <h5>Our Team</h5>
    <div class="row">
        <div class="col-md-4">
            <div class="card mb-4 box-shadow">
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22208%22%20height%3D%22226%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20208%20226%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_17980b486cb%20text%20%7B%20fill%3A%23eceeef%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A11pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_17980b486cb%22%3E%3Crect%20width%3D%22208%22%20height%3D%22226%22%20fill%3D%22%2355595c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2266.9296875%22%20y%3D%22118.04375%22%3EThumbnail%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="height: 225px; width: 100%; display: block;">

              <div class="card-body">
                  <p class="card-header">Yuliana Bamburova - Team Leader</p> 
                <h6 class="card-text">Back-End Developer & DevOps Engineer</h6>
              
              </div>
            </div>
          </div> <div class="col-md-4">
            <div class="card mb-4 box-shadow">
              <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22208%22%20height%3D%22226%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20208%20226%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_17980b486cb%20text%20%7B%20fill%3A%23eceeef%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A11pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_17980b486cb%22%3E%3Crect%20width%3D%22208%22%20height%3D%22226%22%20fill%3D%22%2355595c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2266.9296875%22%20y%3D%22118.04375%22%3EThumbnail%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="height: 225px; width: 100%; display: block;">
              <div class="card-body">
                  <p class="card-header">Solomia Zhuromska</p>
                <h6 class="card-text">Database Architect & Business Analyst</h6>
              
              </div>
            </div>
          </div>
      <div class="col-md-4">
        <div class="card mb-4 box-shadow">
          <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22208%22%20height%3D%22226%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20208%20226%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_17980b486cb%20text%20%7B%20fill%3A%23eceeef%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A11pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_17980b486cb%22%3E%3Crect%20width%3D%22208%22%20height%3D%22226%22%20fill%3D%22%2355595c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2266.9296875%22%20y%3D%22118.04375%22%3EThumbnail%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="height: 225px; width: 100%; display: block;">
          <div class="card-body">
              <p class="card-header">Oleh Deneka</p>
            <h6 class="card-text">Front-End Developer & SCRUM Master</h6>
          
          </div>
        </div>
      </div>
      
    </div> 

</div>
</body>
</html>
<%request.getSession().removeAttribute("message");%>