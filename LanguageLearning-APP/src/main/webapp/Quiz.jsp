<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Phraseology | Add Quizes</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
  <style>
  .nav-link
  {color:whitesmoke;}
  .nav-link:hover{color:#B1D8B7;}
  .card{margin:0 auto;width:50%;color:#2F5233;padding:20px;border-radius:3rem;}
  .container-fluid{background-color:whitesmoke;}
  .btn{
    padding:3px 5px;
}
.btn:hover {
    font-weight: bold;
    border:2px solid #2F5233;
    background-color:whitesmoke;
    color:#2F5233;
    }
select{border:none;border-bottom:3px solid #2F5233;padding:5px;color:#2F5233;}
  </style>
  
</head>
<body>
<%// if(session.getAttribute("rname")!=null){ %>

<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="com.language.entities.Lesson" %>
<%@page import="com.language.entities.Course" %>
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
   	        %>
        

   <div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0" style="background-color:#76B947;">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline">Welcome,</span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                   <li class="nav-item">
                        <a href="AddContent.jsp" class="nav-link align-middle px-0">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="Exercise.jsp" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-speedometer2"></i> <span class="ms-1 d-none d-sm-inline">Add Exercise</span> </a>
                    
                    </li>
                    <li>
                        <a href="Quiz.jsp" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-clipboard-plus"></i> <span class="ms-1 d-none d-sm-inline">Add Quiz</span></a>
                    </li>
                </ul>
                <hr>
                <div class="dropdown pb-4" >
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/OOjs_UI_icon_logOut-ltr-invert.svg/1200px-OOjs_UI_icon_logOut-ltr-invert.svg.png" alt="hugenerd" width="40" height="40" >
                        <span class="d-none d-sm-inline mx-1"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-light text-small shadow">
                        <li><a class="dropdown-item" href="#">Settings</a></li>
                        <li><a class="dropdown-item" href="#">Profile</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="logout">Sign out</a></li>
                    </ul>
                </div>
            </div>
        </div>
        
         <div class="col py-3">
	        <div class="card shadow text-center">
	        <p class="text-muted">(Make sure to select the course first)</p>
	        <div class="card-body">
	        <h4>Add Quizes</h4><hr><br>
	        <form action="quizes" method="post">
	        <div class="row"><div class="col-md-4">
	        <div class="form-floating mb-3">
  					<input type="text" class="form-control" id="floatingInput" name="title">
  					<label for="floatingInput" class="form-label">Quiz Title</label>
				</div>
				<div class="form-floating mb-3">
  					<input type="text" class="form-control" id="floatingInput" name="Qdesc">
  					<label for="floatingInput" class="form-label">Description</label>
				</div>
				
	        </div><div class="col">
	        	<div class="form-floating mb-3">
  					<input type="text" class="form-control" id="floatingInput" name="quest">
  					<label for="floatingInput" class="form-label">Enter the Question</label>
				</div>
				<div class="row"><div class="col">
	        	<div id="optionsContainer" class="form-floating mb-3">
               		<input type="text" class="form-control" id="option1" name="options">
               		<label for="option1" class="form-label">Option 1:</label>
        		</div>
        		</div><div class="col">
        		<div id="optionsContainer" class="form-floating mb-3">
               		<input type="text" class="form-control" id="option1" name="options">
               		<label for="option1" class="form-label">Option 2:</label>
        		</div>
        		</div></div>
        		
        		<div class="row"><div class="col">
	        	<div id="optionsContainer" class="form-floating mb-3">
               		<input type="text" class="form-control" id="option1" name="options">
               		<label for="option1" class="form-label">Option 3:</label>
        		</div>
        		</div><div class="col">
        		<div id="optionsContainer" class="form-floating mb-3">
               		<input type="text" class="form-control" id="option1" name="options">
               		<label for="option1" class="form-label">Option 4:</label>
        		</div>
        		</div></div>
        		
        		<div class="form-floating mb-3">
  					<input type="text" class="form-control" id="floatingInput" name="ans">
  					<label for="floatingInput" class="form-label">Answer</label>
				</div>
				<div class="form-floating mb-3">
  					<input type="number" class="form-control" id="floatingInput" name="ord">
  					<label for="floatingInput" class="form-label">Order of the lesson</label>
				</div>
        		
        		<button type="submit" class="btn btn-success" style="width:100%;padding:10px 20px;">Submit</button>
        		</div></div>
	        </form>
	        </div>
	      </div>
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