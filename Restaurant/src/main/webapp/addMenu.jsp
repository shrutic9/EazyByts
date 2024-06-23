<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Meal</title>
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
  .card{margin:0 auto; padding:35px;width:55%;color:#5F0F40;}
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
  
  </style>
</head>
<body>
<%// if(session.getAttribute("rname")!=null){ %>
   <div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0" style="background-color:#9A031E;">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline">Welcome, <%=session.getAttribute("uname")%></span>
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
                            <i class="fs-4 bi-table"></i> <span class="ms-1 d-none d-sm-inline">Add New Course</span></a>
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
        
        <div class="col py-5">
            <div class="card shadow">
            <h2 class="text-center">Add new Dish</h2>
            <br><br>
            <form action="addMenu" method="post">
            
                  <div class="form-floating mb-3">
                    <input type="text" class="form-control" name="title" id="title" required>
                    <label for="title" class="form-label">Dish Title</label>
                  </div>
                
                  <div class="form-floating mb-3">
                    <input type="text" class="form-control" name="mdesc" id="cdesc" required>
                    <label for="description" class="form-label">Decription</label>
                  </div>
               
               	  <div class="form-floating mb-3">
                    <input type="number" class="form-control" name="amt" id="amt" required>
                    <label for="amount" class="form-label">Amount</label>
                  </div>

                  <div class="d-grid my-3">
                    <button class="btn btn-primary btn-lg" type="submit">Add</button>
                
                </div>
            </form>
        </div>
    </div>
</div>
</div>
<%// } %>
</body>
</html>