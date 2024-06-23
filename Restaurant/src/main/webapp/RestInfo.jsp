<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ZOmo - Food Delivery</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
body{font-family:arial;}
.btn{border:none;background-color:#5F0F40;color:whitesmoke;padding:10px 25px;}
.btn:hover{border:3px solid #5F0F40;background-color:whitesmoke;color:#5F0F40;}
</style>
</head>
<body>

<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="com.restaurant.entities.Restaurant" %>
<%@page import="com.restaurant.entities.MenuItem" %>
<%@page import="java.util.Set"%>

<jsp:include page="header.jsp" /><br>
<div class="container-fluid" style="height:100%;background-color:whitesmoke;padding:50px;">
<%
int res_id=(Integer.parseInt(request.getParameter("res_id")));
Configuration con;
SessionFactory sf = null;
Session ses = null;
try
{
    con=new Configuration();
    con.configure();
       sf = con.buildSessionFactory();
       ses = sf.openSession(); 
       
       Restaurant rest=(Restaurant)ses.get(Restaurant.class,res_id);
      
%>
<div class="card text-white" style="margin:0 auto;width:55%;padding:60px 30px;background-color:#5F0F40;">
<h1 class="text-center"><%=rest.getRname() %></h1>
</div>
<div class="card shadow" style="margin:0 auto;width:55%;padding:30px;">
    <div class="card-title"><h3 class="text-center">Recommended for you</h3></div>
      <hr>
   	     <div class="card-body " >
   	    
   	          <%
   	       		Set<MenuItem> mu=rest.getMenuItem();
   	       		
   	            for(MenuItem menu:mu)
   	            {  	            	
   	            %>
   	             <div class="row">
   	             <div class="col-7" style="padding-left:30px;">
   	            	<h4><%=menu.getFname() %></h4>
   	            	<h5>₹<%=menu.getFamt() %></h5>
   	            	<p><%=menu.getFdesc() %></p>
   	             </div>
   	             <div class="col">
   	             <form action="Oitems" method="get">
   	              <select name="quant" style="padding:8px 13px;">
                      <option value="1" selected>1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option> 
                  </select>
   	             	&nbsp;&nbsp;&nbsp;
   	             		<input type="hidden" name="mid" value="<%=menu.getFid()%>">
   	             		<input type="hidden" name="rid" value="<%=res_id%>">
   	             		<input type="submit" class="btn btn-primary" value="ADD">
   	             	</form>
   	             </div>
   	             </div>
   	             <hr>
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
</body>
<jsp:include page="footer.html" />
</html>