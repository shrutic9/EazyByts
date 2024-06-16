<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<title>TEACHER | course details</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
  <style>
  .nav-link
  {color:black;}
  
  .card{margin: 0 auto; padding:40px;}
  
  .tranptext{color:rgba(0,0,0,0.5);font-size:20px;}
  tr,td{padding:8px;}
  th{padding-bottom:10px;}
  </style>
</head>
<body>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="com.eLearn.entities.Teacher" %>
<%@page import="com.eLearn.entities.Student" %>
<%@page import="com.eLearn.entities.Course" %>
<%@page import="java.util.Set" %>

<% if(session.getAttribute("uname")!=null){ %>
   <div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-light">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-black min-vh-100">
                <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-black text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline">Welcome, <%=session.getAttribute("uname")%></span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li class="nav-item">
                        <a href="profile.jsp" class="nav-link align-middle px-0">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="teacherDashb.jsp" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-speedometer2"></i> <span class="ms-1 d-none d-sm-inline">Dashboard</span> </a>
                        
                    </li>
                    <li>
                        <a href="addCourse.jsp" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-table"></i> <span class="ms-1 d-none d-sm-inline">Add New Course</span></a>
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
        <div class="col">
         <div class="container-fluid"> 
            <br><br>
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
   	            int cid=(Integer.parseInt(request.getParameter("cid")));
   	         	Course cr=ses.get(Course.class,cid);
   	         	int cnt=1;
   	         %>
   	         	<div class="card bg-secondary shadow text-white">
   	         		<h4><%=cr.getTitle() %></h4>
   	         		<p><%=cr.getDesc() %></p><br>
   	         		<p><b>Start Date:</b><%=cr.getStartDate() %>&nbsp;&nbsp;
   	         		<b>End Date:</b><%=cr.getEndDate() %></p>
   	         	</div>
<br>
   	         <div class="card shadow">
   	         <table class="text-center">
   	         <tr><th>Sr.no</th><th>Name</th><th>Email</th><th>Class</th><th>College</th></tr>
   	         <%
   	            
    	        //int sid=(int)session.getAttribute("sid");    
   	         	//Student student=ses.get(Student.class,sid);
   	       		Set<Student> student=cr.getStudent();
   	       		
   	            for(Student stud:student)
   	            {  	            	
   	            %>
   	            
   	            <tr>
   	            <td><%=cnt %></td>
   	            <td><%=stud.getName() %></td>
   	            <td><%=stud.getSemail() %></td>
   	            <td><%=stud.getSclass() %></td>
   	            <td><%=stud.getCollege() %></td>
   	            </tr>
   	     <%
   	           cnt++; }
   	        }
    		catch(Exception e)
    		{
    			e.printStackTrace();
    		}
    	  %>
    	  </table>
    	  </div>
    </div>
    
   	     </div>
   	     </div>
</div>
<% } %>
</body>
</html>