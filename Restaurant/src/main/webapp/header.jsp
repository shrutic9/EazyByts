<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
.nav-link
{
	color:whitesmoke;
}
.nav-item{padding:25px;}
.navbar, .navbar-item, .navbar-brand
{
	margin:auto;

}
.nav-link:hover
{	color:#E8D8C4;border-bottom:3px solid #E8D8C4;}
.navbar-brand:hover{color:white;}
</style>
</head>
<body>
<div class="container-fluid" style="padding:30px;background-color:#5F0F40;color:#E8D8C4;">
  <nav class="navbar navbar-expand-lg ">
  
  <a class="navbar-brand" href="index.jsp" style="color:#FB8B24;"><h1>ZOmo</h1></a>
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
        <a class="nav-link" href="#">Features</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Contact Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" <%if(session.getAttribute("cid")!=null){ %> href="cart.jsp"<%}else{%>href="userLog.jsp"<% }%>><i class="fa fa-shopping-cart fa-lg"></i></a>
      </li>
      <li class="nav-item dropdown">
         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fa fa-user fa-lg"></i>
         </a>
        
         <ul class="dropdown-menu" aria-labelledby="navbarDropdown"> <% if(session.getAttribute("cid")==null){ %>
            <li><a class="dropdown-item" href="userLog.jsp">User Login</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="restLog.jsp">Restaurant Login</a></li></ul><%}
            else{%><li><a class="dropdown-item" href="logout">Logout</a></li>
         </ul><%} %>
      </li>   
    </ul>
  </div>
</nav>

</div>
</body>
</html>