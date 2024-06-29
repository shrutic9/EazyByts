<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>Phraseology - Language Dashboard</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.card{
	width:75%;
	margin:0 auto;
}
.card-body{padding:20px;}
.img-fluid{height:180px;border-radius:.4rem;}
.btn:hover{border:none;}
.btn{padding:0 20px;font-size:20px;font-weight:bold;}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<br>

<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="com.language.entities.User" %>
<%@page import="com.language.entities.Course" %>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>


        <%					Configuration con;
            				SessionFactory sf = null;
            				Session ses = null;
            				Transaction tx;
    						try
    	    				{
				    	        con=new Configuration();
        				        con.configure();
   	            				sf = con.buildSessionFactory();
   	            				ses = sf.openSession();
   	            				tx=ses.beginTransaction();
   	            				Query q=ses.createQuery("From Course");
   	            				List<Course> course=q.list();
   	        %>
        

<h1 class="text-center" style="color:#76B947;">Choose your language</h1>
<div class="row" style="padding:30px;">
<% for(Course c:course){ %>
	<div class="col-3">
		<div class="card shadow" style="margin-top:30px;">
		<img class="img-fluid" src="<%=c.getFlagimg() %>"><br>
		<div class="card-body text-center">
			<form>	
				<input type="hidden" name="lang" value="<%=c.getCourseId() %>">
				<button type="submit" class="btn btn-default"><%=c.getCourseName() %></button>
			</form></div>
		</div>
	</div>
	<%} %>
</div>

<%  int langid=(Integer.parseInt(request.getParameter("lang")));
	Course c=(Course)ses.get(Course.class,langid);

	int uid=(Integer)session.getAttribute("uid");
	User u=(User)ses.get(User.class,uid);
	
	c.getUsers().add(u);
	u.getScourse().add(c);
	ses.save(c);
	ses.save(u);
	tx.commit();
	
session.setAttribute("langid",langid);
response.sendRedirect("LessonsInfo.jsp");
    	    				}
catch(Exception e){e.printStackTrace();}
finally{ses.close();}
%>
</body>
</html>