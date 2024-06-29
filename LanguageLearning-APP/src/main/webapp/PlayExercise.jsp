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
  body{
  background-image:url('');
   background-repeat: no-repeat;
   background-size: cover;
 font-weight:bold;
 }

.card:hover{ box-shadow: 0 8px 16px rgba(0, 0, 0, 0.5);}
.progress{height:30px;}
.progress-bar{background-color:#76B947;}
input[type=submit]
{
	border:none;
	background-color:#76B947;
	padding:10px;
	border-radius:3rem;
	font-size:30px;
	color:whitesmoke;
}
input[type=text]:hover{border:none;border-bottom:3px solid yellow;}
  </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<br>
 <div class="progress mt-3" style="width:50%;margin:0 auto;">
        <div class="progress-bar" role="progressbar" style="width:20%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
        </div>
    </div>
    <br><br>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="com.language.entities.Lesson" %>
<%@page import="com.language.entities.Exercise" %>
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
   	            				int lid=(Integer)session.getAttribute("lid");
   	            				Lesson lsn=(Lesson)ses.get(Lesson.class,lid);
   	            				List<Exercise> exe=lsn.getExercises();
   	            				if (exe == null || exe.isEmpty()) {
   	            		            out.println("<p>No exercises found for this lesson.</p>");
   	            		        } else {
   	            		            int cnt = 0;
   	            				
   	         %>
   	        <div id="carouselExampleIndicators" class="carousel slide" >
    			<ol class="carousel-indicators">
            <%
                for (int i = 0; i < exe.size(); i++) {
            %>
                <li data-target="#carouselExampleIndicators" data-slide-to="<%=i %>" class="<%= (i == 0) ? "active" : "" %>"></li>
            <%
                }
            %>
        </ol>
   	 			 <div class="carousel-inner">
            <%
                for (int i = 0; i < exe.size(); i++) {
                    Exercise e = exe.get(i);
            %>
                <div class="carousel-item <%= (i == 0) ? "active" : "" %>">
                 <h4 class="text-center"><%=e.getQuestion() %></h4><br><br>
                    <div class="d-flex justify-content-center ">
                                    <% if (e.getExerciseType().equals("trueorfalse") || e.getExerciseType().equals("multichoice") ) { 
                                        String[] options = e.getOptions().split(",\\s*");
                                        for (String opt : options) { %>
                                         <div class="col">
                                           <div class="card text-center" style="margin:0 auto;width:70%;background-color:#76B947;padding:20px;border-radius:3rem;">
                           					 <div class="card-body">
                                            <form onsubmit="return checkAnswer(event, '<%= e.getAnswer() %>');">
                                                <input type="submit" value="<%=opt %>">
                                            </form>
                                            </div>
                           				 </div>  
                        				</div>
                                        <% }
                                    } else if (e.getExerciseType().equals("flashcard")) { %>
                                        <div class="card shadow" style="height:270px;width:40%;background-color:#76B947;color:white;">
										    <div class="card-body d-flex flex-column justify-content-center align-items-center">
    										    <h1 id="ans<%= e.getExerciseId() %>"></h1>
        										<button id="showBtn<%= e.getExerciseId() %>" class="btn btn-default" onclick="showAnswer('<%= e.getExerciseId() %>', '<%= e.getAnswer() %>')">Show</button>
    										</div>
										</div>
                                    <% } else if (e.getExerciseType().equals("fillblanks")) { %>
                                      
                                        <form class="form-inline d-flex" onsubmit="return checkFillInTheBlank(event, '<%= e.getAnswer() %>');">
										    <input type="text" name="fib" class="form-control" style="border:none;border-bottom:3px solid #76B947;width:100vh; flex-grow: 1; margin-right: 10px;">
										    <button type="submit" class="btn btn-success" style="padding:10px 20px;">Check</button>
										</form>
                                       
                                    <% }  %>
                    </div>
                </div>
            <%
                }
            %>
        </div>

</div>
<br>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $('#carouselExampleIndicators').on('slid.bs.carousel', function () {
    	   let totalItems = $('.carousel-item').length;
           let currentIndex = 0;

           $('#carouselExampleIndicators').on('slid.bs.carousel', function () {
               currentIndex = $('.carousel-item.active').index() + 1;
               let progressPercentage = (currentIndex / totalItems) * 100;

               $('.progress-bar').css('width', progressPercentage + '%').attr('aria-valuenow', progressPercentage);

               if (currentIndex === 1) {
                   window.location.href = "progress";
               }
           });
       });
    
    function checkAnswer(event, correctAnswer) {
        event.preventDefault();
        const selectedAnswer = event.target.querySelector('input[type="submit"]').value;
        if (selectedAnswer === correctAnswer) {
            $('#carouselExampleIndicators').carousel('next');
        } else {
            alert('Incorrect answer. Try again!');
        }
    }

    function showAnswer(exerciseId, correctAnswer) {
        var answerElement = document.getElementById('ans' + exerciseId);
        var showBtn = document.getElementById('showBtn' + exerciseId);
        if (answerElement && showBtn) {
            answerElement.innerHTML = correctAnswer;
            showBtn.style.display = 'none';
        } else {
            console.error('Element not found:', answerElement, showBtn);
        }
        $('#carouselExampleIndicators').carousel('next');
    }
    function checkFillInTheBlank(event, correctAnswer) {
        event.preventDefault();
        const enteredAnswer = event.target.querySelector('input[name="fib"]').value.trim();
        if (enteredAnswer === correctAnswer) {
            $('#carouselExampleIndicators').carousel('next');
        } else {
            alert('Incorrect answer. Try again!');
        }
    }
   
</script>
</body>
<% 	}}
    	    		catch(Exception e){e.printStackTrace();}
    	    		finally{ses.close();}
    	    		%>
</html>