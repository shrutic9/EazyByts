<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>ZOmo | Manage Restaurant</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
  <style>
  .nav-link
  {color:whitesmoke;}
  .nav-link:hover{color:#FB8B24;}
  .card{margin:0 auto;width:75%;color:#5F0F40;}
  .container-fluid{background-color:#E8D8C4;}
  .btn{
    padding:20px;
    width:100%;
    background-color:#9A031E;
    color:whitesmoke;
    border:none;
     margin:0 auto;
}
.btn:hover {
    font-weight: bold;
    border:3px solid #9A031E;;
    background-color:whitesmoke;
    color:#9A031E;;
    }
    .custom-file-input {
            display: none;
        }
 .custom-file-label, .upload-btn {
            cursor: pointer;
            padding: 6px 7px;
            color: white;
            background-color: #9A031E;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            display: inline-block;
            margin: 5px;
        }

        .custom-file-label:hover, .upload-btn:hover {
            background-color:whitesmoke;
            color: #9A031E;
            border-bottom:2px solid #9A031E;
            font-weight:bold;
  
  </style>
</head>
<body>
<%// if(session.getAttribute("rname")!=null){ %>

<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="com.restaurant.entities.Restaurant" %>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>


        <%
           				 Configuration con;
            				SessionFactory sf = null;
            				Session ses = null;
    						try
    	    				{
				    	        con=new Configuration();
        				        con.configure();
   	            				sf = con.buildSessionFactory();
   	            				ses = sf.openSession(); 
    	            			int rid=(Integer)session.getAttribute("rid");
   	            				Restaurant rest=(Restaurant) ses.get(Restaurant.class,rid);
   	            				
   	        %>
        

   <div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0" style="background-color:#9A031E;">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline">Welcome, <%=rest.getRname()%></span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li class="nav-item">
                        <a href="Restpfp.jsp" class="nav-link align-middle px-0">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="Dashb.jsp" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-speedometer2"></i> <span class="ms-1 d-none d-sm-inline">Menu</span> </a>
                    
                    </li>
                    <li>
                        <a href="addMenu.jsp" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-table"></i> <span class="ms-1 d-none d-sm-inline">Add New Meal</span></a>
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
        
        <div class="col py-5">
        <h1 class="text-center">Restaurant Administration</h1><br>
            <div class="card text-center shadow">
            <div class="row g-0 ">
            	<div class="col-md-4" style="background-color:#9A031E;color:whitesmoke;border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
            	<img src="https://logowik.com/content/uploads/images/restaurant1769.logowik.com.webp"
                alt="Avatar" class="card-img py-2" style="width:100%;" /><br><br>
            		 <h5><%=rest.getRname()%></h5>
              			<p><%=rest.getRtype()%></p>
              			<i class="fa fa-edit fa-2x mb-5"></i>
            	</div>
            	<div class="col-md-8" style="padding:25px;">
            		<h2>Details</h2><br>
            		<hr class="mt-0 mb-4">
            		
                <div class="row pt-1">
                <div class="col-6 mb-3">
                    <h6> Location</h6>
                    <p class="text-muted"><%=rest.getRadd() %>, <%=rest.getRcity() %></p>
                  </div>
                  <div class="col-6 mb-3">
                    <h6>Email</h6>
                    <p class="text-muted"><%=rest.getRmail() %></p>
                  </div>
                </div>
                <div class="row pt-1">
                <div class="col-6 mb-3">
                    <h6> Opening Time</h6>
                    <p class="text-muted"><%=rest.getOtime() %></p>
                  </div>
                  <div class="col-6 mb-3">
                    <h6>Closing Time</h6>
                    <p class="text-muted"><%=rest.getCtime() %></p>
                  </div>
                </div>
                <hr class="mt-0 mb-4">
                <div class="row pt-1">

                  <div class="col mb-3">
                  <h6>Welcome to the Restaurant admin portal. 
                  Kindly update menu of your restaurant, if not already updated.</h6><br>
                  
                  </div>
                </div>
            	</div>
            </div>
        </div>
        </div>
        <%
    	    				}
    						catch(Exception e)
    						{
    							e.printStackTrace();
    						}
        %>
        </div>
      </div>
      
</body>
</html>