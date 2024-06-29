<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>Phraseology Registration</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>

  
  </style>
</head>
<body>
<section class="bg-light py-3 py-md-5">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5 col-xxl-4">
        <div class="card border border-light-subtle rounded-3 shadow">
          <div class="card-body p-3 p-md-4 p-xl-5 shadow">
            <div class="text-center mb-3">
              <a href="#!">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-ZbDObRvKCY1TH2ijkIVC6ux4zeGhH8kBvw&s" alt="BootstrapBrain Logo" width="175" height="100">
              </a>
            </div>
            <h2 class="fs-6 fw-normal text-center text-secondary mb-4">Sign up</h2>
            <form action="userReg" method="post">
              <div class="row gy-2 overflow-hidden">
                <div class="col-12">
                  <div class="form-floating mb-3">
                    <input type="text" class="form-control" name="name" id="name" required>
                    <label for="Name" class="form-label">Name</label>
                  </div>
                </div>
                <div class="col-12">
                  <div class="form-floating mb-3">
                    <label for="Username" class="form-label">Username</label>
                    <div class="input-group has-validation">
     					 <span class="input-group-text" id="inputGroupPrepend">@</span>
     					 <input type="text" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" name="uname" placeholder="Username" required>
    				  <div class="invalid-feedback">
				        Please choose a username.
				      </div>
				    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="form-floating mb-3">
                    <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com" required>
                    <label for="email" class="form-label">Email</label>
                  </div>
                </div>
                <div class="col-12">
                  <div class="form-floating mb-3">
                    <input type="password" class="form-control" name="pass" id="pass" value="" placeholder="Password" required>
                    <label for="password" class="form-label">Password</label>
                  </div>
                </div>
                <div class="col-12">
                  <div class="form-floating mb-3">
                    <input type="date" class="form-control" name="dob" id="college" required>
                    <label for="College" class="form-label">Date of Birth</label>
                  </div>
                </div>
                <div class="col-12">
                  <div class="d-flex gap-2 justify-content-between">

                    <a href="studentlogin.jsp" class="link-primary text-decoration-none">Already have an account? Login</a>
                  </div>
                </div>
                <div class="col-12">
                  <div class="d-grid my-3">
                    <button class="btn btn-success btn-lg" type="submit">Sign up</button>
                  </div>
                </div>

              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>