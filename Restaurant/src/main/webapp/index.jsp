<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
.jumbotron
{
	padding: 0;
            height: 100vh;
            color: #FB8B24;

}
 .navbar {
            position: absolute;
            top: 0;
            width: 100%;
            z-index: 1000;
            padding:50px;
        }
        .nav-link {
            color: #E8D8C4;
        }
        .nav-item {
            padding: 25px;
        }
        .navbar, .navbar-item, .navbar-nav, .navbar-brand
{
	margin:auto;
}
        .navbar-brand {
            color: #FB8B24;
        }
        .nav-link:hover {
            color: #E8D8C4;
            border-bottom: 3px solid #E8D8C4;
        }
 .carousel-inner img {
            width: 100%;
            height:100%; /* Adjust as needed */
             object-fit: cover; 
             background:linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7));
        }
         .carousel-item::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.5)); /* Adjust gradient colors and opacity as needed */
            z-index: 1;
        }
        .carousel-caption {
            position: absolute;
            top: 60%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 2;
            text-align: center;
            color:#E8D8C4;
        }
        
        .btn{border:none;background-color:#5F0F40;}
        .btn:hover{font-weight:bold;border:2px solid #5F0F40;background-color:whitesmoke;color:#5F0F40;}
        
        .card:hover{ box-shadow: 0 8px 16px rgba(0, 0, 0, 0.5);}
</style>
</head>
<body>

<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="com.restaurant.entities.Restaurant" %>
<%@page import="com.restaurant.entities.Customer" %>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>

 <div class="jumbotron text-center ">
 <nav class="navbar navbar-expand-lg ">
  
  <a class="navbar-brand" href="index.jsp" style="color:#FB8B24;"><h1>ZOmo</h1></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#about">About</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Features</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Contact Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" <%if(session.getAttribute("cid")!=null){ %> href="cart.jsp"<%}else{%>href="userLog.jsp"<% }%>><i class="fa fa-shopping-cart fa-lg"></i></a>
      </li>
      <li class="nav-item dropdown">
         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fa fa-user fa-lg"></i>
         </a>
        
         <ul class="dropdown-menu" aria-labelledby="navbarDropdown"> <% if(session.getAttribute("cid")==null){ %>
            <li><a class="dropdown-item" href="userLog.jsp">User Login</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="restLog.jsp">Restaurant Login</a></li></ul><%}
            else{%><li><a class="dropdown-item" href="logout">Logout</a></li>
         </ul><%} %>
      </li>
    </ul>
  </div>
</nav>
<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://upload.wikimedia.org/wikipedia/commons/9/91/Pizza-3007395.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block text-center">
         <h2>Restaurants at your fingertips!</h2>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://www.tastingtable.com/img/gallery/20-japanese-dishes-you-need-to-try-at-least-once/l-intro-1664219638.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block text-center">
         <h2>Restaurants at your fingertips!</h2>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?cs=srgb&dl=pexels-ash-122861-376464.jpg&fm=jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block text-center">
         <h2>Restaurants at your fingertips!</h2>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?cs=srgb&dl=pexels-chanwalrus-958545.jpg&fm=jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block text-center">
         <h2>Restaurants at your fingertips!</h2>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://www.washingtonpost.com/resizer/E4Zygqr-5dBR09mfDV1WZ2TVioc=/arc-anglerfish-washpost-prod-washpost/public/HJRCQ6AIMT54I3ONNQLAPOZA2Y.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block text-center">
         <h2>Restaurants at your fingertips!</h2>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://cdn.foodaciously.com/static/recipes/ee9fd204-25cf-4e97-be5a-d7626470d420/easy-vegan-momos-recipe-7ab341154a5c13d6d9642300e7e2c92d-2560.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block text-center">
         <h2>Restaurants at your fingertips!</h2>
      </div>
    </div>
  </div>
</div>

 </div>	
 
<div class="container-fluid" style="margin:30px 0;padding:20px;">
<h3 class="text-center">Trending blogs of the month</h3><br><br>
<div class="row">
  <div class="col-sm-3">
    <div class="card shadow">
    <img class="card-img-top" src="https://foodtank.com/wp-content/uploads/2024/06/U.S.-Department-of-Agriculture-USDA-Health-Future-Students-and-Earth-Coalition-climate-friendly-school-meals.jpg" >
      <div class="card-body">
        <h5 class="card-title">Op-Ed | USDA Opens the Door to Climate-Friendly School Meals</h5>
        <p class="card-text">School cafeterias are notorious for serving up chicken nuggets and pizza that resemble fast food more than nutrition, but millions of schoolchildren across the nation will soon have a better chance of eating healthy, sustainable meals. 
        New nutrition standards for child nutrition programs just released by the U.S. Department of Agriculture (USDA) will help schools improve menus.</p>
        <a href="https://foodtank.com/news/2024/06/op-ed-usda-opens-the-door-to-climate-friendly-school-meals/" class="btn btn-primary">Read Full Blog</a>
      </div>
    </div>
  </div>
  <div class="col-sm-3">
    <div class="card shadow">
    <img class="card-img-top" src="https://www.lylesgoldensyrup.com/wp-content/uploads/2023/07/raspberry-crumble-bars.png" >
      <div class="card-body">
        <h5 class="card-title">Raspberry Crumble Bars</h5>
        <p class="card-text">Sweet, soft, wonderfully juicy raspberry crumble bars.

With a soft oat-brown-sugar-butter cookie-like base, and a thick, sweet, and tart but not overwhelming layer of raspberries in the middle, tucked in by a light dusting of those subtle streusel-like crumbs on top.

You’re gonna need to be making these.</p>
        <a href="https://pinchofyum.com/raspberry-crumble-bars" class="btn btn-primary">Read Full Blog</a>
      </div>
    </div>
  </div>

    <div class="col-sm-3">
    <div class="card shadow">
    <img class="card-img-top" src="https://foodtank.com/wp-content/uploads/2024/06/Food-Wine-Game-Changers-Culinary-Institute-of-America-chefs-Bronzeville.jpg">
      <div class="card-body">
        <h5 class="card-title">Food & Wine Celebrates 2024 Game Changers: Visionaries Transforming the Culinary World</h5>
        <p class="card-text">Food & Wine released its list of 17 Game Changers, which recognizes individuals and companies changing the future of cooking, dining, and drinking.</p>
        <a href="https://foodtank.com/news/2024/06/food-wine-celebrates-game-changers/" class="btn btn-primary">Read Full Blog</a>
      </div>
    </div>
  </div>
        <div class="col-sm-3">
    <div class="card shadow">
    <img class="card-img-top" src="https://www.cuddlesfoundation.org/wp-content/uploads/2022/05/food-junk-jewels.jpg">
      <div class="card-body">
        <h5 class="card-title">Food Junk to Food Jewels</h5>
        <p class="card-text">Food prices are approaching an all-time high. Climate change affecting food production has aided this increase over time. 
        However, the covid pandemic and, more recently, the war in Ukraine have precipitated an almost overnight surge in food prices and pushed global food inflation sharply. 
        With no end seen to the war and with steep rises in fertiliser prices, it is anticipated that food prices may increase even further.</p>
        <a href="https://www.cuddlesfoundation.org/food-junk-to-food-jewels/?gad_source=1&gclid=CjwKCAjwydSzBhBOEiwAj0XN4OT6eC-5TsofL8U703p-FntUyMfiuI0cDMxqwyHDQJj-zsadm0G1RxoChwsQAvD_BwE" class="btn btn-primary">Read Full Blog</a>
      </div>
    </div>
  </div>
</div>

</div>

	<!--Login form-->
	<% if(session.getAttribute("cid")==null){%>
<section style="background-color:#5F0F40;color:#E8D8C4;">
  <div class="container py-4">
    <div class="row d-flex justify-content-center align-items-center ">
      <div class="col col-xl-8">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-7 col-lg-5 d-none d-md-block">
              <img src="https://creativeseatings.com/wp-content/uploads/2023/06/2a56867ed57228d3dd1495acdbde80f5.jpg"
                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;height: 100%;" />
            </div>
            <div class="col-md-5 col-lg-6 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                <form action="userLog" method="post">

                  <div class="d-flex align-items-center mb-3 pb-1">
                    <span class="h1 fw-bold mb-0" style="color:#FB8B24;">ZOmo</span>
                  </div>

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>

                  <div class="form-outline mb-4">
                    <input type="email" id="form2Example17" name="email" class="form-control form-control-lg" placeholder="Email Address"/>
                  </div>

                  <div class="form-outline mb-4">					
                    <input type="password" id="form2Example27" name="password" class="form-control form-control-lg" placeholder="Password"/>
                  </div>

                  <div class="pt-1 mb-4">
                     <input class="btn btn-dark btn-lg btn-block" type="submit" value="Login">
                  </div>

                  <a class="small text-muted" href="#!">Forgot password?</a>
                  <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a href="userReg.jsp"
                      style="color: #393f81;">Register here</a></p>
                  <a href="#!" class="small text-muted">Terms of use.</a>
                  <a href="#!" class="small text-muted">Privacy policy</a>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section><br>
	<%}else{ %>
<div class="container-fluid" style="margin:20px 0 ;padding:20px;">
<h1 class="text-center" style="color:#5F0F40;padding:30px;">Explore your Cravings</h1>
<div class="container"> 
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
    	        
   	            int cid=(Integer)session.getAttribute("cid");
   	            Customer cust=ses.get(Customer.class,cid);
   	            
   	            
   	            Query q1=ses.createQuery("FROM Restaurant");
   	            List<Restaurant> restaurant= q1.list();
   	           
   	            for(Restaurant rest: restaurant)
   	            {
   	               	String str=String.valueOf(rest.getRid());
   	             if(rest.getRcity().equals(cust.getCity()))
   	             {
   	            %>
   	     
   	     	<div class="col-md-4" style="padding:30px;">
   	     		<div class="card text-center" style="padding:20px;background-color:#E8D8C4;"><br>
   	     		<h4 class="card-title"><%=rest.getRname()%></h4>
   	     		<p class="text-muted"><%=rest.getRtype() %></p><hr>
   	     			<div class="card-body">
   	     				
   	     				<p><b>Time: </b><%=rest.getOtime() %> - <%=rest.getCtime() %></p>
   	     				<p><b>Location: </b><%=rest.getRadd()%>, <%=rest.getRcity() %></p>
	   	     			<hr>
   		     			<p>
   		     			<form action="RestInfo.jsp" >
   		     			<input type="hidden" name="res_id" value="<%=rest.getRid()%>">
   		     				<button class="btn btn-primary" type="submit" style="border:none;background-color:#5F0F40;color:whitesmoke;padding:15px 20px;width:100%;">Order</button>
   		     			</form>
   		     			</p>
   	    	 </div>
   	     </div>
   	     </div>
   	     
   	     <%
   	             }
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
<hr>
<%} %>

<div class="row" id="about" style="margin:30px;color:#5F0F40;">
		<div class="col-7" style="padding:0 0 30px 30px;">
			<h2 >About Us</h2><br>
			<h4>Welcome to ZOmo - Your Ultimate Food Delivery Companion!</h4>
				At ZOmo, we are passionate about connecting you with the best local restaurants, bringing a world of culinary delights right to your doorstep. 
				Whether you're craving a gourmet meal, comfort food, or a quick bite, ZOmo is here to satisfy your hunger with ease and convenience.<br><br>
			<h5>Our Story</h5>
				Founded with a vision to revolutionize the food delivery industry, ZOmo was created to offer a seamless and enjoyable dining experience from the comfort of your home. 
				We understand the joy that comes from indulging in your favorite dishes, and our mission is to make that experience accessible, efficient, and delightful.
			<br><br>
			<h5>Join the ZOmo Family</h5>
				Embark on a culinary adventure with ZOmo and discover the best that your city has to offer. 
				Whether you're ordering for yourself, your family, or a group of friends, ZOmo is here to make every meal special. 
		</div>
		<div class="col-5">
			<img class="img-fluid" src="https://www.foodiv.com/wp-content/uploads/2023/06/online-ordering-business.jpg" width=750 height=750 style="padding-top:30px;">
		</div>
	</div>
</body>

<footer class="text-center" style="background-color:#5F0F40;color:#E8D8C4;">
  <div class="container p-4 pb-0">
    <h6>Follow us:</h6><p>
    <section class="mb-4">
      <a class="btn btn-outline-light btn-floating m-2" href="https://www.facebook.com/" role="button">
		  <i class="fa fa-facebook-f"></i></a>

      <a class="btn btn-outline-light btn-floating m-2" href="https://twitter.com/" role="button">
		  <i class="fa fa-twitter"></i></a>

      <a class="btn btn-outline-light btn-floating m-2" href="https://www.google.com/" role="button">
		  <i class="fa fa-google"></i></a>

      <a class="btn btn-outline-light btn-floating m-2" href="https://www.instagram.com/" role="button">
        <i class="fa fa-instagram"></i></a>
    </section>
  </div>

  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);"> © 2024
    <a style="color: wheat;" href="index.php">ZOmo - Food Delivery</a>
  </div>

</footer> 
</html>
