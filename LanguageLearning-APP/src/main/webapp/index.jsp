<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>Phraseology</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
.container-fluid{
background-image:url('https://cdn.dribbble.com/userupload/3106835/file/original-ce4397c603ec84f2a1497ae21674f441.png?resize=1200x900');
 background-repeat: no-repeat;
 font-weight:bold;
 margin-bottom:20px;
}
.nav-link
{
	color:#2F5233;
}
.nav-item{margin-left:10px;padding:25px;}

.nav-link:hover
{	color:#76B947;border-bottom:3px solid #76B947;}
.navbar-brand:hover{color:#94C973;}
.card{padding:20px;color:#2F5233;width:90%;border-radius:3rem;}
a{text-decoration:none;color:whitesmoke;}
a:hover{color:#B1D8B7;}
</style>
</head>
<body >
<div class="container-fluid h-100">
  <nav class="navbar navbar-expand-lg ">
  
  <a class="navbar-brand" href="index.jsp" style="background: -webkit-linear-gradient(#2F5233,#76B947);-webkit-background-clip: text;-webkit-text-fill-color: transparent;"><h1>Phraseology</h1></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon text-white"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ms-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#about">About</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" <%if(session.getAttribute("langid")!=null){ %>href="LessonsInfo.jsp"<%}else{ %>href="LangaugeDasb.jsp"<%} %>>Lessons</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Contact Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" <% if(session.getAttribute("uid")==null){ %>href="Register.jsp"<%} else { %>href="pfp.jsp" <%} %>><i class="fa fa-user fa-lg"></i></a>
      </li>
    </ul>
  </div>
</nav>

<div class="row" style="margin-top:50px;">
<div class="col-7"></div>
<div class="col" style="padding:40px">
<h1 class="text-end" style="color:#76B947;"> Begin your language learning journey with us at Pharseology</h1>
<br><button class="btn btn-success" style="float:right;padding:15px 25px;"><a href="LanguageDashb.jsp">Get Started</a></button>
</div>

</div>
</div>

<section class="text-center" style="margin-bottom:40px;background-color:#B1D8B7;padding:20px;">
  <div class="row">
    <div class="col-lg-3 col-md-6 mb-5 mb-md-5 mb-lg-0 position-relative">
      <i class="fa fa-cubes fa-3x mb-4"></i>
      <h5 class="fw-bold mb-3">5000+</h5>
      <h6 class="fw-normal mb-0">Loreum Ipsum</h6>
      <div class="vr vr-blurry position-absolute my-0 h-100 d-none d-md-block top-0 end-0"></div>
    </div>

    <div class="col-lg-3 col-md-6 mb-5 mb-md-5 mb-lg-0 position-relative">
      <i class="fa fa-layer-group fa-3x mb-4"></i>
      <h5 class="fw-bold mb-3">490+</h5>
      <h6 class="fw-normal mb-0">Loreum Ipsum</h6>
      <div class="vr vr-blurry position-absolute my-0 h-100 d-none d-md-block top-0 end-0"></div>
    </div>

    <div class="col-lg-3 col-md-6 mb-5 mb-md-0 position-relative">
      <i class="fa fa-image fa-3x mb-4"></i>
      <h5 class="fw-bold mb-3">100+</h5>
      <h6 class="fw-normal mb-0">Loreum Ipsum</h6>
      <div class="vr vr-blurry position-absolute my-0 h-100 d-none d-md-block top-0 end-0"></div>
    </div>

    <div class="col-lg-3 col-md-6 mb-5 mb-md-0 position-relative">
      <i class="fa fa-plug fa-3x mb-4"></i>
      <h5 class="fw-bold mb-3">28</h5>
      <h6 class="fw-normal mb-0">Loreum Ipsum</h6>
    </div>
  </div>
</section>

<h2 class="text-center" style="color:#2F5233;">6 Fantastic Facts about Languages</h2><br>

	<div class="row text-center" style="padding:20px;">
		<div class="col-md-4"><div class="card shadow"><h5 class="card-title">1. There’s a language only 8 people speak</h5><hr>
			Talk about exclusive! The unclassified Busuu language is spoken in the Southern Bantoid of Cameroon – 
			but only by eight people. In fact, when they checked in 1986, there were eight Busuu speakers and in 2005, only three, making it an endangered language.</div></div>
		<div class="col-md-4" ><div class="card shadow"><h5 class="card-title">2. Chinese Mandarin is considered the hardest language to learn</h5><hr>
			When considering that the Chinese Mandarin alphabet is made up entirely of symbols,
			 this fact is not surprising.The average Chinese local is estimated to be familiar with over 8000 symbols and 3000 is the minimum to be able 
			 to read the newspaper. </div></div>
		<div class="col-md-4" ><div class="card shadow"><h5 class="card-title">3. English is the language with the most words</h5><hr>
			English takes the cake in this category at a proud 750’000 words, 
			with new ones being added all the time. In fact, it’s estimated that about 5’400 new English words are created annually, 
			although only around a thousand of these will be incorporated into the vocabulary of the general public.</div></div>
		</div>
	
		<div class="row text-center" style="padding:20px;">
		<div class="col-md-4" ><div class="card shadow"><h5 class="card-title">4. William Shakespeare invented 1700 words</h5><hr>
			On the subject of new words, our man William Shakespeare came up with a pretty large collection of novel terms. 
			He did this through a combination of changing nouns to verbs, verbs to adjectives, combining words, adding prefixes and suffixes as
			 well as just straight up inventing brand new ones.</div></div>
		<div class="col-md-4" ><div class="card shadow"><h5 class="card-title">5. Learning a second language can boost your brain</h5>	<hr>
			Speaking more than one language comes with a whole host of benefits,
	 		one of which being that it challenges your brain in ways that studies have shown could make you smarter. </div></div>
		<div class="col-md-4" ><div class="card shadow"><h5 class="card-title">6. Russian is the most commonly spoken language in Europe</h5><hr>
			Russian has a strong lead when it comes to the most common language in Europe, with 120 million native speakers. German comes in second place with 95 million,
			 but is still more widely used in the areas of trade and commerce.</div></div>
</div>
<hr>
<div class="row" id="about" style="margin:30px;color:#2F5233;">
		<div class="col-md-6" style="padding:0 0 30px 30px;">
			<h2 >About Us</h2><br>
			<h4>Welcome to Phraseology, your comprehensive language learning companion</h4>
				Phraseology is designed to make learning languages enjoyable, effective, and accessible to everyone. 
				Whether you're a beginner or looking to refine your language skills, 
				Phraseology offers a diverse range of tools and resources tailored to your learning journey.<br><br>
			
			<h5>Get Started</h5>
				Embark on your language learning journey with Phraseology today.
				 Whether you're learning for travel, work, or personal enrichment, we're here to support you every step of the way.

		</div>
		<div class="col-md-6">
			<img class="img-fluid" src="https://media.licdn.com/dms/image/D4D12AQFH9ciAy55MNA/article-cover_image-shrink_600_2000/0/1678381098653?e=2147483647&v=beta&t=MbBTPsPI4X8p4LuUmpGwj9whdGHsS-0rM6lhbluT_l4" width=800 height=750 style="padding-top:30px;">
		</div>
	</div>
<hr class="hr hr-blurry" />
<div class="row py-5" style="padding-left:40px;">
<div class="col-5 text-center" style="padding:40px;background-color:#2F5233;border-radius: 3rem;margin:0 auto;">
<h1 style="color:#B1D8B7;">Get acquainted with your favorite languages spoken around the world</h1><br><br>
<form action="userLog" method="post">
<div class="form-outline mb-4">
     <input type="email" id="form2Example17" name="email" class="form-control form-control-lg" placeholder="Email Address"/>
</div>
<div class="form-outline mb-4">
     <input type="password" id="form2Example17" name="password" class="form-control form-control-lg" placeholder="Password"/>
</div>
<a href="Register.jsp" style="color:whitesmoke;">Don't have an account? Register here.</a><br>
<br><button type="submit" class="btn btn-success" style="padding:15px 25px;">Explore now >></button>
</form>

</div>

</div>

</body>

<footer class=" text-center" style="background-color:#76B947;color:#2F5233;">
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
    <a style="color: wheat;" href="index.php">Pharseology</a>
  </div>

</footer> 

</html>
