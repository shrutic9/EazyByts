<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>Phraseology - Lessons</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
  <style>
  body{
  background-image:url('https://cdn1.vectorstock.com/i/1000x1000/65/55/stone-age-kids-run-with-food-while-mother-grilling-vector-42656555.jpg');
   background-repeat: no-repeat;
   background-size: cover;
 font-weight:bold;
  }
  input:hover{
  color:whitesmoke;
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
<%@page import="com.language.entities.Lesson" %>
<%@page import="com.language.entities.Course" %>
<%@page import="com.language.entities.Quiz" %>
<%@page import="org.hibernate.Query"%>
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
   	            				int langid=(Integer)session.getAttribute("langid");
   	            				Course c=(Course)ses.get(Course.class,langid);
   	            				Query q=ses.createQuery("From Lesson where course_id=:cid ORDER BY seq")
   	            						.setParameter("cid",langid);
   	            				List<Lesson> lesson=q.list(); %>
       							
   	        <div class="row">
   	            			<div class="col-md">	
   	            			<h1 class="text-center text-muted">Lessons in <%=c.getCourseName() %></h1><br><br>
<%        	for(Lesson lsn:lesson)
        	{
        		%>
        			
        				<div class="card text-center" style="background-color:#B1D8B7;padding:20px;border-radius:2rem;border-top-right-radius:2rem;width:50%;margin:0 auto;">
        					<form action="LessonIntro.jsp">
        					<input type="hidden" name="lid" value="<%=lsn.getLessonId()%>">
        					<input type="submit" value="<%=lsn.getSeq() %>" style="border:none;background-color:#B1D8B7;font-size:25px;">
        					</form>
        				</div>
        			<br>
        <%	}  %> 
        	</div>
        	 <div class="col-md-4">
        	 <h1 class="text-center text-muted">Quiz</h1><br>
        <%	List<Quiz> quizes=c.getQuizzes();
			for(Quiz quiz:quizes)
			{
        %>
        	     <div class="card text-center" style="background-color:#B1D8B7;padding:20px;border-radius:30rem;width:50%;margin:0 auto;">
        		 	<form action="Quizes.jsp">
        				<input type="hidden" name="qid" value="<%=quiz.getQuizId()%>">
        				<input type="submit" value="<%=quiz.getQuizTitle() %>" style="border:none;background-color:#B1D8B7;font-size:25px;color:#2F5233;">
        			</form>
        		</div>
       			<br>
        <%} %>
        </div>
        
        </div>
        
        <%for(Lesson l:lesson){ 
        	if((int)request.getAttribute("seq")==l.getSeq()&&request.getAttribute("cs").equals("Completed"))
        	{
        %>
        <style>
        	.card{background-color:#2F5233;}
        </style>
        <%} }%>
</body>
<%
    	}
catch(Exception e){e.printStackTrace();}
finally{ses.close();}
%>
</html>