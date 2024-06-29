<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>Phraseology - Quiz Result</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
  <style>
  .card{margin:0 auto;width:50%;color:#2F5233;padding:20px;border-radius:3rem;}
  </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<br>
<div class="col py-3">
	        	<div class="card text-center shadow ">
	        		<p class="card-title text-center">Congratulations! You have scored</p>
	        		<hr>
	        		<h4><%=request.getAttribute("marks") %>/<%=request.getAttribute("cnt") %></h4>
	        	</div>
</div>
</body>
</html>