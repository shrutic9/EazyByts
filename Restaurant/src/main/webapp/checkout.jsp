<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>ZOmo | Basket</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	body{font-family:arial;}
	.jumbotron
{
	height: 650px;
	background:linear-gradient( rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(https://img.freepik.com/premium-photo/colorful-vase-with-red-yellow-pattern-yellow-bowl-with-rice-it_948735-151165.jpg?size=626&ext=jpg&ga=GA1.1.386372595.1697846400&semt=ais);
	background-repeat: no-repeat;
	background-size: cover;
	padding: 250px;
	margin: 20px 0;
}
.butt
{
	text-decoration: none;
	border: 2px solid wheat;
	padding:20px 30px;
	margin-top: 40px;
	color: wheat;
	border-radius: 10px;
}
.butt:hover
{
	background-color: wheat;
	color: black;
}
.cart{
    background-color: #fff;
    padding: 4vh 5vh;
    border-bottom-left-radius: 1rem;
    border-top-left-radius: 1rem;
}
@media(max-width:767px){
    .cart{
        padding: 4vh;
        border-bottom-left-radius: unset;
        border-top-right-radius: 1rem;
    }
}
.summary{
    background-color: #E8D8C4;
    border-top-right-radius: 1rem;
    border-bottom-right-radius: 1rem;
    padding: 4vh;
    color: black;
}
@media(max-width:767px){
    .summary{
    border-top-right-radius: unset;
    border-bottom-left-radius: 1rem;
    }
}
.summary .col-2{
    padding: 0;
}
.summary .col-10
{
    padding: 0;
}.row{
    margin: 0;
}
.title b{
    font-size: 1.5rem;
}
.main{
    margin: 0;
    padding: 2vh 0;
    width: 100%;
}
.col-2, .col{
    padding: 0 1vh;
}
a{
    padding: 0 1vh;
}
.close{
    margin-left: auto;
    font-size: 0.7rem;
}
.back-to-shop{
    margin-top: 4.5rem;
}
h5{
    margin-top: 4vh;
}
hr{
    margin-top: 1.25rem;
}
form{
    padding: 2vh 0;
}
select{
    border: 1px solid rgba(0, 0, 0, 0.137);
    padding: 1.5vh 1vh;
    margin-bottom: 4vh;
    outline: none;
    width: 100%;
    background-color: rgb(247, 247, 247);
}
input{
    border: 1px solid rgba(0, 0, 0, 0.137);
    padding: 1vh;
    margin-bottom: 4vh;
    outline: none;
    width: 100%;
    background-color: rgb(247, 247, 247);
}
input:focus::-webkit-input-placeholder
{
      color:transparent;
}
.btnn{
    background-color: #000;
    border-color: #000;
    color: white;
    width: 100%;
    font-size: 0.7rem;
    margin-top: 4vh;
    padding: 2vh;
    border-radius: 0;
}
.btnn:focus{
    box-shadow: none;
    outline: none;
    box-shadow: none;
    color: white;
    -webkit-box-shadow: none;
    -webkit-user-select: none;
    transition: none; 
}
.btnn:hover{
    color: white;
}
 #code{
    background-image: linear-gradient(to left, rgba(255, 255, 255, 0.253) , rgba(255, 255, 255, 0.185)), url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
    background-repeat: no-repeat;
    background-position-x: 95%;
    background-position-y: center;
}
a
{
text-decoration:none;
}
</style>
<body>
<%@page import="java.util.*" %>
<%@page import="java.time.LocalDateTime" %>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="com.restaurant.entities.Restaurant" %>
<%@page import="com.restaurant.entities.MenuItem" %>
<%@page import="com.restaurant.entities.OrderItem" %>
<%@page import="com.restaurant.entities.Order" %>

<jsp:include page="header.jsp" />
<br><br>
<%

Configuration con;
SessionFactory sf = null;
Session ses = null;
Transaction txn = null;

try {
    con = new Configuration().configure();
    sf = con.buildSessionFactory();
    ses = sf.openSession();
    txn = ses.beginTransaction();
    
				    int oid=(Integer)session.getAttribute("oid");
                    Order order=(Order)ses.get(Order.class,oid);
                    Set<OrderItem> oi=order.getOrderItem();
                    %>
<div class="card shadow" style="width:50%;margin:auto;padding:30px;">
<img src="https://tlr.stripocdn.email/content/guids/CABINET_75694a6fc3c4633b3ee8e3c750851c02/images/67611522142640957.png" alt style="display: block;margin:auto;" width="120">
 <br>
 <div class="esd-block-text es-p10b" align="center">
      <h2>Thank You For Stopping by!</h2>
 </div>
  
    <p class="text-center" style="font-size: 16px; color: #777777;">Yay! Your Order has been confirmed! We cannot wait to deliver your order to you.</p>
<hr>
 <div class="title" style="background-color:#E8D8C4;margin-bottom:5px;">
       <div class="row" style="padding:13px;">
             <div class="col"> <h5><b>Order ID #<%=oid %></b></h5></div>
       </div>
 </div>   
		                  <p>
<%
                    int tot=(Integer.parseInt(request.getParameter("tot")));
                    for(OrderItem ori:oi)
                    {
                    	MenuItem mu=ori.getMenuItem();
                  %>

<div class="row" style="padding-left:12px;">
<div class="col-9"><b><%=mu.getFname()%></b>
<div ><%=mu.getFdesc() %></div>
</div>
<div class="col-3"><b>₹ <%=ori.getOamt() %></b></div>
</div>
      
<p>
<%} %>
<div class="row"  style="padding-left:12px;">
	<div class="col-9"><b>Shipping Charges</b>
	</div>
	<div class="col-3"><b>₹ 50</b></div>
	</div>

<hr>
<div class="row" style="padding-left:12px;">
<div class="col-9"><b>TOTAL: </b></div>
<div class="col-3"><b>₹ <%=tot%></b></div>

</div>
<hr>
<div class="row">
    <div class="col-3"><b>Delivery by:</b> </div>
    	<div class="col">
    	<p>Your order will be delivered to you in next 45 minutes. Stay tuned! </p>
    	</div>
   
</div>
<hr><br>

<div class="row">
<button class="btn btn-success" style="background-color:#5F0F40;width:50%;height:60px;margin:auto;"><a href="index.jsp" style="color:white;text-decoration:none;">Continue Shopping</a></button>
</div>
</div>
<%
String hql = "UPDATE Orders SET oAmt = :amt WHERE oid = :orderId";
Query query = ses.createQuery(hql);
query.setParameter("amt",tot);
query.setParameter("orderId", oid);
query.executeUpdate();
}
                    catch(Exception e){e.printStackTrace();} 
                %>
 <br><br>
</body>
<jsp:include page="footer.html" />
</html>