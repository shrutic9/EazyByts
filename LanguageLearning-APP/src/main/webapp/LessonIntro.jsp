<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>Phraseology - Introduction</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
  <style>
  body{
  background-image:url('');
   background-repeat: no-repeat;
   background-size: cover;
 font-weight:bold;
  }
  input:hover{
  color:whitesmoke;
  }
    
  .card{margin:0 auto;width:50%;color:#2F5233;padding:20px;border-radius:3rem;}
You have to work with the kit of HTML5 progress bar.These are currently the entire selectors for styling HTML5 progress bar:


  </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<br>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="com.language.entities.Lesson" %>
<%@page import="java.util.List"%>


        <%					Configuration con;
            				SessionFactory sf = null;
            				Session ses = null;
    						try
    	    				{
				    	        con=new Configuration();
        				        con.configure();
   	            				sf = con.buildSessionFactory();
   	            				ses = sf.openSession();
   	            				int lid=(Integer.parseInt(request.getParameter("lid")));
   	            				session.setAttribute("lid",lid);
   	            				Lesson lsn=(Lesson)ses.get(Lesson.class,lid);
   	           %>
   	           <div class="col">
	        	<div class="card shadow ">
	        		<h3 class="card-title text-center"><%=lsn.getLessonTitle() %></h3> <hr>
	        		<p class="text-muted text-center"><%=lsn.getContent() %></p>
   	          
   	           <br>
   	           	<div class="embed-responsive embed-responsive-16by9" style="margin:0 auto;">
            		<iframe class="embed-responsive-item" width="500" height="350" src="https://www.youtube.com/embed/<%=lsn.getVideoURL() %>" allowfullscreen></iframe>
        		</div><br>
        		<button class="btn btn-success" onclick="location.href='PlayExercise.jsp'" style="width:50%;padding:10px 20px;margin:0 auto;">Proceed to Exercises</button>
			</div>
		</div><br><br>
</body>
<%
    	}
catch(Exception e){e.printStackTrace();}
finally{ses.close();}
%>
</html>