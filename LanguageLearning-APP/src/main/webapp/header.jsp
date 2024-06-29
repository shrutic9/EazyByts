<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
.nav-link
{
	color:#2F5233;
}
.nav-item{margin-left:10px;padding:25px;}

.nav-link:hover
{	color:#76B947;border-bottom:3px solid #76B947;}
.navbar-brand:hover{color:#94C973;}
</style>
</head>
<body>
<div class="container-fluid">
  <nav class="navbar navbar-expand-lg ">
  
  <a class="navbar-brand" href="index.jsp" style="background: -webkit-linear-gradient(#2F5233,#76B947);-webkit-background-clip: text;-webkit-text-fill-color: transparent;"><h1>Phraseology</h1></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ms-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#about">About</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" <%if(session.getAttribute("langid")!=null){ %>href="LessonsInfo.jsp"<%}else{ %>href="LangaugeDasb.jsp"<%} %>>Lessons</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Contact Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link"<% if(session.getAttribute("uid")==null){ %>href="Register.jsp"<%} else { %>href="pfp.jsp" <%} %>><i class="fa fa-user fa-lg"></i></a>
      </li>
    </ul>
  </div>
</nav>
</div>

</body>
</html>