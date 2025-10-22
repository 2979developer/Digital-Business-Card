<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard - BizCard AI</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css"
	rel="stylesheet">

<style>
body {
	background-color: #f4f7fc; /* Softer background */
	font-family: 'Poppins', sans-serif;
}

.navbar {
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
}

/* Hero Section */
.hero {
	background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
	color: white;
	padding: 60px 20px;
	text-align: center;
	border-radius: 0 0 25px 25px;
}

.hero h1 {
	font-weight: 700;
}

/* Section Headers */
.section-header {
	font-weight: 600;
	margin-bottom: 1.5rem;
	color: #333;
}

/* Action Cards */
.action-card {
	border-radius: 15px;
	padding: 25px;
	background-color: #ffffff;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	text-align: center;
	border: none;
	height: 100%;
	display: flex;
	flex-direction: column;
}

.action-card:hover {
	transform: translateY(-8px);
	box-shadow: 0 12px 35px rgba(0, 0, 0, 0.1);
}

.action-icon {
	font-size: 40px;
	margin-bottom: 15px;
	width: 70px;
	height: 70px;
	line-height: 70px;
	border-radius: 50%;
	color: #fff;
	display: inline-block;
}

.action-card .card-body {
	flex-grow: 1;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.action-card h5 {
	font-weight: 600;
}

.action-card p {
	font-size: 0.9rem;
	color: #6c757d;
}

/* Unique colors for each action card */
.icon-create {
	background-color: #0d6efd;
}

.icon-cards {
	background-color: #0dcaf0;
}

.icon-profile {
	background-color: #198754;
}

.icon-upgrade {
	background-color: #dc3545;
}

/* Stats Boxes */
.stat-box {
	background-color: #ffffff;
	border-radius: 15px;
	padding: 25px;
	text-align: center;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
	transition: transform 0.3s ease;
	height: 100%;
}

.stat-box:hover {
	transform: scale(1.05);
}

.stat-icon {
	font-size: 35px;
	margin-bottom: 10px;
	color: #6a11cb;
}

.stat-number {
	font-size: 2rem;
	font-weight: 700;
	color: #333;
}

.stat-label {
	color: #6c757d;
}

/* Recent Activity Section */
.recent-activity {
	background: white;
	border-radius: 15px;
	padding: 25px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
}

.recent-activity .list-group-item {
	border: none;
	border-bottom: 1px solid #f0f0f0;
}

.recent-activity .list-group-item:last-child {
	border-bottom: none;
}

.recent-activity .fa-check-circle {
	color: #28a745;
}

footer {
	padding: 20px;
	background-color: #212529;
}
</style>
</head>
<body class="d-flex flex-column min-vh-100">

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand fw-bold" href="index.jsp">BizCard <span
				style="color: #2575fc;">AI</span></a>
			<div>
				<a href="LogoutServlet" class="btn btn-outline-light btn-sm">
					Logout <i class="bi bi-box-arrow-right"></i>
				</a>
			</div>
		</div>
	</nav>

	<div class="hero" data-aos="fade-down">
		<h1 class="display-5">
			Welcome,
			<%=session.getAttribute("username")%>
			🎉
		</h1>
		<p class="lead">Here's your command center for creating and
			managing digital business cards.</p>
	</div>

	<div class="container py-5 flex-grow-1">

		<h2 class="section-header text-center">Quick Actions</h2>
		<div class="row g-4">
			<div class="col-md-6 col-lg-3" data-aos="fade-up">
				<div class="action-card">
					<div class="card-body">
						<div>
							<span class="action-icon icon-create"><i
								class="bi bi-plus-circle"></i></span>
							<h5>Create New Card</h5>
							<p>Design a fresh, personalized digital card from scratch.</p>
						</div>
						<a href="createCard.jsp" class="btn btn-primary mt-3">Start
							Creating</a>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3" data-aos="fade-up"
				data-aos-delay="100">
				<div class="action-card">
					<div class="card-body">
						<div>
							<span class="action-icon icon-cards"><i
								class="bi bi-collection"></i></span>
							<h5>My Cards</h5>
							<p>View, edit, and share all of your saved digital cards.</p>
						</div>
					<a href="<%= request.getContextPath() %>/MyCardsServlet" class="btn btn-info mt-3 text-white">
    View Collection
</a>

					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3" data-aos="fade-up"
				data-aos-delay="200">
				<div class="action-card">
					<div class="card-body">
						<div>
							<span class="action-icon icon-profile"><i
								class="bi bi-person-circle"></i></span>
							<h5>My Profile</h5>
							<p>Update your personal details and account settings.</p>
						</div>
						<a href="profile.jsp" class="btn btn-success mt-3">Edit
							Profile</a>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3" data-aos="fade-up"
				data-aos-delay="300">
				<div class="action-card">
					<div class="card-body">
						<div>
							<span class="action-icon icon-upgrade"><i
								class="bi bi-gem"></i></span>
							<h5>Upgrade Plan</h5>
							<p>Unlock premium templates and advanced features.</p>
						</div>
						<a href="payment.jsp" class="btn btn-danger mt-3">Upgrade Now</a>
					</div>
				</div>
			</div>
		</div>

		<h2 class="section-header text-center mt-5">Your Stats at a
			Glance</h2>
		<div class="row g-4">
			<div class="col-sm-6 col-lg-3" data-aos="zoom-in">
				<div class="stat-box">
					<i class="bi bi-card-list stat-icon"></i>
					<div class="stat-number"><%=request.getAttribute("totalCards")%></div>
					<div class="stat-label">Total Cards Created</div>
				</div>
			</div>
			<div class="col-sm-6 col-lg-3" data-aos="zoom-in"
				data-aos-delay="100">
				<div class="stat-box">
					<i class="bi bi-gem stat-icon"></i>
					<div class="stat-number"><%=request.getAttribute("plan")%></div>
					<div class="stat-label">Current Plan</div>
				</div>
			</div>
			<div class="col-sm-6 col-lg-3" data-aos="zoom-in"
				data-aos-delay="200">
				<div class="stat-box">
					<i class="bi bi-clock-history stat-icon"></i>
					<div class="stat-number"><%=request.getAttribute("lastLogin")%></div>
					<div class="stat-label">Last Login</div>
				</div>
			</div>
			<div class="col-sm-6 col-lg-3" data-aos="zoom-in"
				data-aos-delay="300">
				<div class="stat-box">
					<i class="bi bi-eye stat-icon"></i>
					<div class="stat-number"><%=request.getAttribute("views")%></div>
					<div class="stat-label">Card Views</div>
				</div>
			</div>
		</div>

		<h2 class="section-header text-center mt-5">Recent Activity</h2>
		<div class="recent-activity" data-aos="fade-up">
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><i class="fas fa-check-circle me-2"></i>You
					created a new card for <%=session.getAttribute("username")%></li>
				<li class="list-group-item"><i class="fas fa-check-circle me-2"></i>Your
					profile was successfully updated.</li>
				<li class="list-group-item"><i class="fas fa-check-circle me-2"></i>Welcome!
					You joined BizCard AI.</li>
			</ul>
		</div>
	</div>

	<footer class="text-center text-white mt-auto">
		<p class="mb-0">
			© 2025 BizCard AI | <a href="features.jsp" class="text-white">Features</a>
			| <a href="About.jsp" class="text-white">About</a>
		</p>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
	<script>
		AOS.init({
			duration : 800,
			once : true
		});
	</script>
</body>
</html>