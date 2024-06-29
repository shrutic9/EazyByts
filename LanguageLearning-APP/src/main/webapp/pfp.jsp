<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>Phraseology - Exercises</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  <style>
  .card{margin:0 auto;width:50%;color:#2F5233;padding:20px;border-radius:3rem;}
  .card-img-top{
  width:50%; 
  height:50%;
  }
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
<%@page import="java.util.*"%>


        <%					Configuration con;
            				SessionFactory sf = null;
            				Session ses = null;
    						try
    	    				{
				    	        con=new Configuration();
        				        con.configure();
   	            				sf = con.buildSessionFactory();
   	            				ses = sf.openSession();
   	            				int uid=(Integer)session.getAttribute("uid");
   	            				User user=ses.get(User.class,uid);
   	            				
   	            				Set<Course> course=user.getScourse();
   	        %>
   	        <div class="col py-3">
	        <div class="card shadow text-center">
	        <div class="row">
	        
	        <img src="https://cdn.elearningindustry.com/wp-content/uploads/2020/02/how-to-create-an-online-language-learning-platform.jpg" class="card-img-top" >
	        
	        	<div class="col"><h3 class="card-title" style="margin-top:80px;"><%=user.getFirstName() %></h3></div>
	        </div>
	        	
	        		
	        	<hr>
	        	<div class="card-body">
	        		<p><b class="text-muted">Username: </b><%=user.getUsername() %></p>
	        		<p><b class="text-muted">Email: </b><%=user.getEmail() %></p>
	        		<p><b class="text-muted">Date of Birth:</b><%=user.getDateOfBirth() %></p><br>
	        	<hr>
	        	<h3>Languages Chosen</h3><br>
	        	<div class="row">
	        	<%
	        		for(Course c:course)
	        		{
	        			%>
	        			<div class="col">
	        			<img src="<%=c.getFlagimg() %>" class="img-fluid" width=200 height=200>
						<p><%=c.getCourseName() %></p></div>
	        		<% } %>
	        	</div>
	        	   <hr>
	        	   <button class="btn btn-success" onclick="location.href='logout'" style="width:30%;margin:0 auto;">Logout</button> 
	        	   </div>
	        	     </div>
	        	     </div>
</body>
<%
    	    				}
catch(Exception e){e.printStackTrace();}
finally{ses.close();}
%>
</html>