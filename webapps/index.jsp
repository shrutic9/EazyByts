<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>E-Learning Platform</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
.card .card-body
{
    margin:0 auto;
}
body
{
    padding:2%;
}
.card-img-top{
    height:300px;
}
.btn{
    padding:20px;
    width:220px;
    background-color:#C2BFDD;
}
.btn-default:hover {
    font-weight: bold;
    border:3px solid #C2BFDD;


}
</style>

</head>

<body>

<h1 class="text-center">Welcome to the online E-Learning Portal! </h1>
<div class="row" style="margin-top:4%;">

<div class="col-6">
<div class="card shadow" style="padding:20px;">
  <img src="https://www.svgrepo.com/show/384678/account-avatar-profile-user-9.svg" class="card-img-top" alt="Teacher" >
  <div class="card-body">
    <a href="teacherlogin.jsp" class="btn btn-default">Login as Teacher</a>
  </div>
</div>
</div>

<div class="col-6">
<div class="card shadow" style="padding:20px;">
  <img src="https://upload.wikimedia.org/wikipedia/commons/c/cb/Student_icon.svg" class="card-img-top" alt="Student" >
  <div class="card-body">
    <a href="studentlogin.jsp" class="btn btn-default">Login as Student</a>
  </div>
</div>
</div>

</div>




</body>
</html>