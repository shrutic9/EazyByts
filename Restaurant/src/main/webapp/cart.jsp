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
img{
    width: 3.5rem;
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

</head>
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

<body>
<jsp:include page="header.jsp" />
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
                    %>
<br><br>
<div class="card shadow" style="margin: auto;max-width: 950px;width: 90%;border-radius: 1rem;border: transparent;">
            <div class="row">
                <div class="col-md-8 cart">
                    <div class="title">
                        <div class="row">
                            <div class="col"><h5><b><%=session.getAttribute("cname") %>'s Order Details</b></h5></div>
                            <div class="col-2 align-self-center text-right text-muted"> Quantity</div>
                            <div class="col-2 align-self-center text-right text-muted"> item(s)</div>
                        </div>
                    </div>   
                   
<%
                    int oid=(Integer)session.getAttribute("oid");
                    Order order=(Order)ses.get(Order.class,oid);
                    Set<OrderItem> oi=order.getOrderItem();
                    
                    int tot=0,cnt=0;
                    for(OrderItem ori:oi)
                    {
                    	MenuItem mu = ori.getMenuItem();
                    	tot+=ori.getOamt();
                  %>
                  		<div class="row border-top border-bottom">
                        <div class="row main ">
                            <!-- div class="col-2"><img class="img-fluid" src="https://i.imgur.com/1GrakTl.jpg"></div> -->
                            <div class="col">
                                <div class="row "> <%=mu.getFname()%></div>
                                <div class="row text-muted"><%=mu.getFdesc() %></div>
                            </div>
                            <div class="col-2">
                          <%=ori.getOquant() %>
                                
                            </div>
                            <div class="col-2"> <%=ori.getOamt() %></div>
                            <div class="col-1">
                            <form method="post" action="delete">
                   			<input type="hidden" name="prodId" value="<%=ori.getOrid()%>">
                   			<input type="hidden" name="action" value="remove">
                   			<input type="submit" value="x" style="border:none;font-size:15px;">
               				</form></div>
                        </div>
                         
                    </div>
                  <%cnt++;} %>
                    <div class="back-to-shop"><a href="index.jsp">&leftarrow;</a><span class="text-muted">Back to ZOmo</span></div>
                </div>
                <div class="col-md-4 summary">
                    <div><h5><b>Summary</b></h5></div>
                    <hr>
                    <div class="row">
                        <div class="col" style="padding-left:0;"><%=cnt %> ITEMS </div>
                        <div class="col text-right">₹ <%=tot %></div>
                    </div><hr>
                    <form>
                        <p>SHIPPING:</p>
                        <select><option class="text-muted">Standard-Delivery- ₹50.00</option></select>
                        
                    </form>
                    <div class="row" style="border-top: 1px solid rgba(0,0,0,.3); padding: 2vh 0;">
                        <div class="col"><b>TOTAL PRICE :</b></div>
                        <div class="col text-right">₹ <%=tot+50 %></div>
                    </div>
                    <form action="checkout.jsp">
                   	 	<input type="hidden" name="tot" value="<%=tot+50%>">
                    	<input type="submit" class="btnn" value="CHECKOUT">
		  			</form>
                </div>
            </div>
            
            <%
            /*//String hql = "UPDATE Orders SET oAmt = :amt WHERE oid = :orderId";
            //Query query = ses.createQuery(hql);
            //query.setParameter("amt",tot+50);
            //query.setParameter("orderId", oid);
            //query.executeUpdate();*/
                }
                catch(Exception e){e.printStackTrace();} 
                //397240569172335
            %>
        </div>
</body><br><br>
<jsp:include page="footer.html" />
</html>