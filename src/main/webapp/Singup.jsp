<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up - BizCard AI</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: #f8f9fa;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }
    .card {
      border-radius: 12px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    footer {
      margin-top: auto; /* pushes footer to bottom */
    }
  </style>
</head>

<body>

  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container">
      <a class="navbar-brand" href="index.jsp">AI Card Creator</a>
    </div>
  </nav>

  <!-- Signup Form -->
  <div class="container d-flex justify-content-center align-items-center flex-grow-1 mt-4 mb-4">
    <div class="row justify-content-center w-100">
      <div class="col-12 col-sm-10 col-md-8 col-lg-6">
        <div class="card p-4">
          <h3 class="text-center mb-4">Create Account</h3>
          <form action="SignupServlet" method="post">
            <div class="mb-3">
              <input type="text" class="form-control" name="username" placeholder="Full Name" required>
            </div>
            <div class="mb-3">
              <input type="email" class="form-control" name="email" placeholder="Email" required>
            </div>
         	   <div class="mb-3">
              <input type="password" class="form-control" name="password" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Sign Up</button>
          </form>
          <p class="mt-3 text-center">Already have an account? <a href="login.jsp">Login</a></p>
        </div>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <footer class="text-white" style="background: linear-gradient(135deg, #6a11cb, #2575fc); padding: 15px;">
    <div class="container text-center">
      <p class="mb-0">© 2025 BizCard AI | 
        <a href="#" class="text-white">Help</a> | 
        <a href="#" class="text-white">Privacy</a>
      </p>
    </div>
  </footer>

</body>
</html>
