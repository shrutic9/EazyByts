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
  .card{margin:0 auto;width:50%;color:#2F5233;padding:20px;border-radius:3rem;}
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
<%@page import="com.language.entities.QuizQuestion" %>
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
   	            				int qid=(Integer.parseInt(request.getParameter("qid")));
   	            				Quiz quiz=(Quiz)ses.get(Quiz.class,qid);
   	            				Query q=ses.createQuery("From QuizQuestion where quiz_id=:qid ORDER BY seq")
   	            						.setParameter("qid",qid);
   	            				List<QuizQuestion> qq=q.list();
   	            				int cnt=1;
   	            				int quizid;
   	            				%>
   	            				
   	        <div class="col py-3">
	        	<div class="card shadow ">
	        		<h3 class="card-title text-center"><%=quiz.getQuizTitle() %></h3>
	        		<p class="text-muted text-center"><%=quiz.getDescription() %></p>
	        	<div class="card-body">
	        	<hr><br>
	        	
	        	<form action="Quizsol" method="post">
	        	<div class="row">
	        		<div class="col">
	        		<% for(QuizQuestion quizq:qq)
	        			{
	        				quizid=quizq.getQuizQuestionId();
	        			%>
	        		<h4><%=cnt %>. <%=quizq.getQuestionText() %></h4>
	        		<%String[] optiona=quizq.getOptions().split(",\\s*"); %>
	        		
	        			<div class="form-check">
  							<input class="form-check-input" type="radio" name="opt<%=cnt%>" id="exampleRadios1" value="<%=optiona[0] %>">
  							<label class="form-check-label" for="exampleRadios1">
    							<%=optiona[0] %>
  							</label>
						</div>
        			
        				<div class="form-check">
  							<input class="form-check-input" type="radio" name="opt<%=cnt%>" id="exampleRadios2" value="<%=optiona[1] %>">
  							<label class="form-check-label" for="exampleRadios2">
    							<%=optiona[1] %>
  							</label>
						</div>
        			
	        	<div class="form-check">
  							<input class="form-check-input" type="radio" name="opt<%=cnt%>" id="exampleRadios3" value="<%=optiona[2] %>">
  							<label class="form-check-label" for="exampleRadios3">
    							<%=optiona[2] %>
  							</label>
						</div>
        		
        		<div class="form-check">
  							<input class="form-check-input" type="radio" name="opt<%=cnt%>" id="exampleRadios4" value="<%=optiona[3] %>">
  							<label class="form-check-label" for="exampleRadios4">
    							<%=optiona[3] %>
  							</label>
						</div>
        		<br><input type="hidden" name="seq<%=cnt %>" value="<%=quizid%>">
        		<%cnt++;} %>
        		<input type="hidden" name="cnt" value="<%=cnt-1%>">
        		<button type="submit" class="btn btn-success" style="width:100%;padding:10px 20px;">Submit</button>
        		</div></div>
	        </form>
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