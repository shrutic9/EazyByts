<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>STUDENT | Enrolled Courses</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
  <style>
  .nav-link
  {color:black;}
  
  .card{margin: 0 auto; padding:40px;background-color:#C2BFDD;}
  
  .tranptext{color:rgba(0,0,0,0.5);font-size:20px;}
  
  .btn{margin:0 auto;text-decoration:none;border:none;}
  .btn:hover
  {padding:10px;border-bottom:2px solid black;}
  </style>
</head>
<body>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="com.eLearn.entities.Course" %>
<%@page import="com.eLearn.entities.Teacher" %>
<%@page import="com.eLearn.entities.Student" %>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.Set"%>

<% if(session.getAttribute("sname")!=null){ %>
   <div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-light">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-black min-vh-100">
                <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-black text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline">Welcome, <%=session.getAttribute("sname")%></span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li class="nav-item">
                        <a href="Studprofile.jsp" class="nav-link align-middle px-0">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="studDashb.jsp" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-speedometer2"></i> <span class="ms-1 d-none d-sm-inline">Courses</span> </a>
                        
                    </li>
                    <li>
                        <a href="enCourse.jsp" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-table"></i> <span class="ms-1 d-none d-sm-inline">Enrolled Courses</span></a>
                    </li>
                    
                  
                </ul>
                <hr>
                <div class="dropdown pb-4">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="https://www.svgrepo.com/show/132889/logout.svg" alt="hugenerd" width="40" height="40" >
                        <span class="d-none d-sm-inline mx-1"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                        <li><a class="dropdown-item" href="#">Settings</a></li>
                        <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="logout">Sign out</a></li>
                    </ul>
                </div>
            </div>
        </div>
        
         <div class="col py-5">
        <h2 class="text-center">Enrolled Courses</h2>
            <br><br>
             <div class="container "> 
   	      <div class="row">
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
   	         	Teacher teacher;
   	         	
    	        int cid=(int)session.getAttribute("sid");    
   	         	Student student=ses.get(Student.class,cid);
   	       		Set<Course> course=student.getScourse();
   	       		
   	            for(Course c: course)
   	            {
   	            	teacher=c.getTeacher();
   	            	String str=String.valueOf(c.getCid());
   	            %>
   	     
   	     	<div class="col-md-4">
   	     	<div class="card shadow"  style="margin-top:10px;">
   	     	<h4><%=c.getTitle()%></h4><hr>
   	     	<p><%=c.getDesc()%></p><br>
   	     	<h5>Mentor: <%=teacher.getTname() %></h5>
   	     	<p><b>Starts: </b><%=c.getStartDate()%>  &nbsp;&nbsp;
   	     	<b>Ends: </b><%=c.getEndDate()%></p>
   	     	
   	     	<hr>
   	     	<p><form action="enrolCourse" method="post">
   	     	<input type="hidden" name="cid" value="<%=str%>">
   	     	<button class="btn btn-default" >View Details</button>
   	     	</form></p>
   	     </div>
   	     </div>
   	     
   	     <%
   	            }
   	        }
    		catch(Exception e)
    		{
    			e.printStackTrace();
    		}
    	            %>
        </div>
          </div>
   	     </div>
    </div>
</div>
<% } %>
</body>
</html>