<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login | BizCard AI</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.card {
	border-radius: 12px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>

	<div class="container">
		<div class="row justify-content-center">
			<!-- col-12 = full width on mobile -->
			<!-- col-sm-10 = 10/12 on small devices -->
			<!-- col-md-8 = 8/12 (two-thirds) on tablets -->
			<!-- col-lg-6 = half width on desktops -->
			<div class="col-10 col-sm-8 col-md-9 col-lg-8 col-xl-6">
				<div class="card p-4">
					<h3 class="text-center mb-4">Login</h3>
					<form action="LoginServlet" method="post">
						<div class="mb-3">
							<input type="email" class="form-control" name="email"
								placeholder="Email" required>
						</div>
						<div class="mb-3">
							<input type="password" class="form-control" name="password"
								placeholder="Password" required>
						</div>
						<button type="submit" class="btn btn-primary w-100">Login</button>
					</form>
					<p class="mt-3 text-center">
						Don’t have an account? <a href="Singup.jsp">Sign Up</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	
	<%
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) {
%>
<script>
    alert("<%= errorMessage %>");
</script>
<%
    }
%>
	



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
