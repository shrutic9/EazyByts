<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ZOmo | Orders</title>
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
  .card{margin:0 auto;padding:40px;width:75%;color:#5F0F40;}
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
  
  .tranptext{color:rgba(0,0,0,0.5);font-size:20px;}
  tr,td{padding-top:20px;}
  th{padding-bottom:30px;}
  
  
  </style>
</head>
<body>
<%// if(session.getAttribute("rname")!=null){ %>

<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="com.restaurant.entities.Restaurant" %>
<%@page import="com.restaurant.entities.MenuItem" %>
<%@page import="com.restaurant.entities.Order" %>
<%@page import="com.restaurant.entities.OrderItem" %>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.Query"%>

        <%
           				 Configuration con;
            				SessionFactory sf = null;
            				Session ses = null;
            				Transaction txn = null;
    						try
    	    				{
				    	        con=new Configuration();
        				        con.configure();
   	            				sf = con.buildSessionFactory();
   	            				ses = sf.openSession(); 
   	            				txn = ses.beginTransaction();
   	            				
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
                            <i class="fs-4 bi-clipboard-plus"></i> <span class="ms-1 d-none d-sm-inline">Add New Meal</span></a>
                    </li>
                    <li>
                        <a href="RestOrderInfo.jsp" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-bag-check-fill"></i> <span class="ms-1 d-none d-sm-inline">Orders</span></a>
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
        
         <div class="col">
        <div class="container-fluid"> 
            <br><br>
            
   	         		<h2 class="card-title text-center" style="color:#9A031E;"><%=rest.getRname() %>'s Orders</h2><br>
     	  
     	         	<div class="row">
     	         	
   	         <%
   	       		Set<Order> order=rest.getOrder();
   	       		
   	       		
   	            for(Order or:order)
   	            {  	            	
   	            %>
   	            <div class="col-4">
   	            <div class="card shadow">
   	            <h4 class="card-title">Order ID: #<%=or.getOid()%></h4>
   	            <div class="card-body">
   	            
   	            <p> <i class="fs-4 bi-calendar2-date"></i>&nbsp; <%=or.getDtime().toLocalDate()%></p>
   	            <p><i class="fs-4 bi-clock-history"></i> <%=or.getDtime().toLocalTime()%></p>
   	             <h5>Items: </h5>
   	            	<% Set <OrderItem> oritems=or.getOrderItem();
   	            	for(OrderItem ori:oritems)
   	            	{ MenuItem menu=ori.getMenuItem(); %>
   	            	
	   	            		<p><%=menu.getFname()%></p>
	   	            		<p>Quantity: <b><%=ori.getOquant()%></b></p>
	   	            	<%} %>
	   	           <hr>
	   	         <p><b>Amount: </b>₹<%=or.getoAmt()%></p>
   	            </div>
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
      
</body>
</html>