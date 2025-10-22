<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (session == null || session.getAttribute("userId") == null) {
	response.sendRedirect("login.jsp?error=Please login first");
	return;
}

// Fetch user details from session
String username = (String) session.getAttribute("username");
String email = (String) session.getAttribute("email");
String phone = (String) session.getAttribute("phone");
String website = (String) session.getAttribute("website");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Profile | AI Business Card Creator</title>

<!-- Bootstrap & Fonts -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<!-- Custom CSS -->
<style>
body {
	font-family: 'Poppins', sans-serif;
	background-color: #f0f2f5;
}

.profile-container {
	max-width: 900px;
	width: 100%;
	background-color: #fff;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.profile-sidebar {
	background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
	color: white;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
}

.profile-avatar {
	font-size: 60px;
	margin-bottom: 20px;
	border: 4px solid rgba(255, 255, 255, 0.5);
	border-radius: 50%;
	width: 120px;
	height: 120px;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: rgba(255, 255, 255, 0.1);
}

.form-control {
	border-radius: 12px;
	padding: 12px 15px;
	border: 1px solid #ddd;
}

.form-control:focus {
	border-color: #6a11cb;
	box-shadow: 0 0 0 0.25rem rgba(106, 17, 203, 0.15);
}

.btn-custom {
	border-radius: 12px;
	padding: 12px 20px;
	width: 100%;
	background: linear-gradient(to right, #6a11cb, #2575fc);
	color: white;
	font-weight: 600;
	font-size: 1.1rem;
	border: none;
	transition: transform 0.2s, box-shadow 0.2s;
}

.btn-custom:hover {
	transform: translateY(-2px);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	color: white;
}

@media ( max-width : 991.98px) {
	.profile-sidebar {
		border-radius: 20px 20px 0 0;
	}
	.profile-sidebar h2 {
		font-size: 1.75rem;
	}
}
</style>
</head>
<body>

	<div class="container my-4">
		<div class="profile-container mx-auto">
			<div class="row g-0">
				<div class="col-lg-5 profile-sidebar p-4 p-lg-5">
					<div class="profile-avatar">
						<i class="fas fa-user-edit"></i>
					</div>
					<h2 class="fw-bold">Edit Profile</h2>
					<p class="text-white-50 small">Keep your information up to date
						to ensure your cards are always accurate.</p>
				</div>

				<div class="col-lg-7 p-4 p-lg-5">
					<h3 class="mb-4 fw-semibold">Account Details</h3>
					<form action="UpdateProfileServlet" method="post">
						<div class="mb-3">
							<label for="name" class="form-label">Full Name</label> <input
								type="text" class="form-control" id="name" name="name"
								value="<%=username != null ? username : ""%>" required>
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email Address</label> <input
								type="email" class="form-control" id="email" name="email"
								value="<%=email != null ? email : ""%>" required>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">New Password</label> <input
								type="password" class="form-control" id="password"
								name="password"
								placeholder="Leave blank to keep current password">
						</div>
						<div class="mb-3">
							<label for="phone" class="form-label">Phone</label> <input
								type="text" class="form-control" id="phone" name="phone"
								value="<%=phone != null ? phone : ""%>">
						</div>
						<div class="mb-3">
							<label for="website" class="form-label">Website</label> <input
								type="text" class="form-control" id="website" name="website"
								value="<%=website != null ? website : ""%>">
						</div>
						<button type="submit" class="btn btn-custom mt-3">Save
							Changes</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%
	String msg = (String) request.getAttribute("message");
	if (msg != null) {
	%>
	<div id="successAlert"
		class="alert alert-success alert-dismissible fade show position-fixed top-0 start-50 translate-middle-x mt-3 shadow"
		role="alert"
		style="z-index: 1050; width: auto; max-width: 400px; text-align: center;">
		<%=msg%>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<%
	}
	%>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<!-- ✅ Auto hide after 4 seconds -->
	<script>
    setTimeout(() => {
        const alert = document.getElementById('successAlert');
        if (alert) {
            alert.classList.remove('show');
            alert.classList.add('fade');
            setTimeout(() => alert.remove(), 500); // remove from DOM after fade
        }
    }, 3000);
</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
