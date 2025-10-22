<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Demo Cards - BizCard AI</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
	rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css"
	rel="stylesheet">

<style>
body {
	font-family: 'Poppins', sans-serif;
	background-color: #f4f7fc;
}

@
keyframes animatedGradient { 0% {
	background-position: 0% 50%;
}

50
%
{
background-position
:
100%
50%;
}
100
%
{
background-position
:
0%
50%;
}
}

/* Hero Section */
.hero {
	background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
	color: white;
	padding: 80px 20px;
	text-align: center;
	border-radius: 0 0 25px 25px;
}

.hero h1 {
	font-weight: 700;
}

/* New Gradient Card Design */
.gradient-card {
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	height: 100%;
	color: white;
	padding: 30px;
	display: flex;
	flex-direction: column;
	text-align: center;
	background-size: 200% 200%;
	animation: animatedGradient 10s ease infinite;
	text-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
}

.gradient-card:hover {
	transform: translateY(-10px);
	box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
}

/* Gradient Backgrounds */
.bg-gradient-1 {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.bg-gradient-2 {
	background: linear-gradient(135deg, #2af598 0%, #009efd 100%);
}

.bg-gradient-3 {
	background: linear-gradient(135deg, #ff9a9e 0%, #fecfef 100%);
}

.bg-gradient-4 {
	background: linear-gradient(135deg, #ff758c 0%, #ff7eb3 100%);
}

.bg-gradient-5 {
	background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
}

.bg-gradient-6 {
	background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
}

.initials-circle {
	width: 90px;
	height: 90px;
	border-radius: 50%;
	background-color: rgba(255, 255, 255, 0.2);
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 1rem;
	font-size: 2.5rem;
	font-weight: 600;
}

.gradient-card h5 {
	font-weight: 600;
}

.gradient-card .role {
	color: rgba(255, 255, 255, 0.8);
}

.contact-info {
	list-style: none;
	padding: 0;
	margin: 1.5rem 0;
	text-align: left;
	font-size: 0.9rem;
}

.contact-info li {
	margin-bottom: 0.75rem;
}

.contact-info i {
	margin-right: 10px;
	width: 20px;
}

.social-links {
	margin-top: auto;
} /* Pushes to the bottom */
.social-links a {
	color: rgba(255, 255, 255, 0.8);
	font-size: 1.2rem;
	margin: 0 0.5rem;
	transition: color 0.3s;
}

.social-links a:hover {
	color: #fff;
}

/* Search Bar */
.search-bar .form-control {
	border-radius: 50px;
	padding: 0.75rem 1.5rem;
}

.search-bar .input-group-text {
	border-radius: 50px;
	border: none;
}

footer {
	background: #212529;
	color: white;
	padding: 30px 0;
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
		<div class="container">
			<a class="navbar-brand fw-bold" href="index.jsp">BizCard <span
				style="color: #2575fc;">AI</span></a>
		</div>
	</nav>

	<div class="hero" data-aos="fade-down">
		<h1>Explore Our Card Designs</h1>
		<p class="lead">Discover the modern, professional look of our
			AI-powered digital business cards.</p>
		<a href="index.jsp" class="btn btn-light mt-3"><i
			class="bi bi-arrow-left-circle me-2"></i>Back to Home</a>
	</div>

	<div class="container my-4" data-aos="fade-up">
		<div class="row justify-content-center">
			<div class="col-lg-6 col-md-8">
				<div class="input-group search-bar">
					<span class="input-group-text bg-transparent border-end-0"><i
						class="bi bi-search"></i></span> <input type="text" id="searchInput"
						class="form-control border-start-0"
						placeholder="Search by name or role...">
				</div>
			</div>
		</div>
	</div>

	<div class="container py-4">
		<div class="row g-4" id="cardContainer">

			<div class="col-12 col-md-6 col-lg-4 card-item" data-name="Om Shinde"
				data-role="Java Full-Stack Developer" data-aos="fade-up">
				<div class="gradient-card bg-gradient-1">
					<div class="initials-circle">OS</div>
					<h5>Om Shinde</h5>
					<p class="role">Java Full-Stack Developer</p>
					<hr class="my-4 opacity-50">
					<ul class="contact-info">
						<li><i class="bi bi-envelope-fill"></i> om.shinde@email.com</li>
						<li><i class="bi bi-telephone-fill"></i> +91 98765 43210</li>
					</ul>
					<div class="social-links">
						<a href="#"><i class="bi bi-linkedin"></i></a> <a href="#"><i
							class="bi bi-github"></i></a> <a href="#"><i
							class="bi bi-twitter"></i></a>
					</div>
				</div>
			</div>

			<div class="col-12 col-md-6 col-lg-4 card-item"
				data-name="Priya Sharma" data-role="UI/UX Designer"
				data-aos="fade-up" data-aos-delay="100">
				<div class="gradient-card bg-gradient-2">
					<div class="initials-circle">PS</div>
					<h5>Priya Sharma</h5>
					<p class="role">UI/UX Designer</p>
					<hr class="my-4 opacity-50">
					<ul class="contact-info">
						<li><i class="bi bi-envelope-fill"></i>
							priya.sharma@email.com</li>
						<li><i class="bi bi-telephone-fill"></i> +91 91234 56789</li>
					</ul>
					<div class="social-links">
						<a href="#"><i class="bi bi-linkedin"></i></a> <a href="#"><i
							class="bi bi-dribbble"></i></a> <a href="#"><i
							class="bi bi-instagram"></i></a>
					</div>
				</div>
			</div>

			<div class="col-12 col-md-6 col-lg-4 card-item"
				data-name="Rahul Verma" data-role="AI Researcher" data-aos="fade-up"
				data-aos-delay="200">
				<div class="gradient-card bg-gradient-3">
					<div class="initials-circle">RV</div>
					<h5>Rahul Verma</h5>
					<p class="role">AI Researcher</p>
					<hr class="my-4 opacity-50">
					<ul class="contact-info">
						<li><i class="bi bi-envelope-fill"></i> rahul.verma@email.com</li>
						<li><i class="bi bi-telephone-fill"></i> +91 99876 54321</li>
					</ul>
					<div class="social-links">
						<a href="#"><i class="bi bi-linkedin"></i></a> <a href="#"><i
							class="bi bi-google"></i></a> <a href="#"><i
							class="bi bi-twitter"></i></a>
					</div>
				</div>
			</div>

			<div class="col-12 col-md-6 col-lg-4 card-item"
				data-name="Anjali Mehta" data-role="Marketing Director"
				data-aos="fade-up">
				<div class="gradient-card bg-gradient-4">
					<div class="initials-circle">AM</div>
					<h5>Anjali Mehta</h5>
					<p class="role">Marketing Director</p>
					<hr class="my-4 opacity-50">
					<ul class="contact-info">
						<li><i class="bi bi-envelope-fill"></i>
							anjali.mehta@email.com</li>
						<li><i class="bi bi-telephone-fill"></i> +91 98200 12345</li>
					</ul>
					<div class="social-links">
						<a href="#"><i class="bi bi-linkedin"></i></a> <a href="#"><i
							class="bi bi-facebook"></i></a>
					</div>
				</div>
			</div>

			<div class="col-12 col-md-6 col-lg-4 card-item"
				data-name="Vikram Singh" data-role="Cloud Architect"
				data-aos="fade-up" data-aos-delay="100">
				<div class="gradient-card bg-gradient-5">
					<div class="initials-circle">VS</div>
					<h5>Vikram Singh</h5>
					<p class="role">Cloud Architect</p>
					<hr class="my-4 opacity-50">
					<ul class="contact-info">
						<li><i class="bi bi-envelope-fill"></i>
							vikram.singh@email.com</li>
						<li><i class="bi bi-telephone-fill"></i> +91 97654 32109</li>
					</ul>
					<div class="social-links">
						<a href="#"><i class="bi bi-linkedin"></i></a> <a href="#"><i
							class="bi bi-github"></i></a>
					</div>
				</div>
			</div>

			<div class="col-12 col-md-6 col-lg-4 card-item"
				data-name="Sneha Patil" data-role="Data Scientist"
				data-aos="fade-up" data-aos-delay="200">
				<div class="gradient-card bg-gradient-6">
					<div class="initials-circle">SP</div>
					<h5>Sneha Patil</h5>
					<p class="role">Data Scientist</p>
					<hr class="my-4 opacity-50">
					<ul class="contact-info">
						<li><i class="bi bi-envelope-fill"></i> sneha.patil@email.com</li>
						<li><i class="bi bi-telephone-fill"></i> +91 96543 21098</li>
					</ul>
					<div class="social-links">
						<a href="#"><i class="bi bi-linkedin"></i></a> <a href="#"><i
							class="bi bi-twitter"></i></a>
					</div>
				</div>
			</div>

		</div>
	</div>

	<footer class="text-center mt-4">
		<div class="container">
			<p class="mb-0 py-4">© 2025 BizCard AI</p>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
	<script>
		AOS.init({
			duration : 800,
			once : true
		});

		// Search filter logic (preserved)
		document.getElementById("searchInput").addEventListener(
				"keyup",
				function() {
					let value = this.value.toLowerCase().trim();
					document.querySelectorAll(".card-item").forEach(
							function(card) {
								let name = card.getAttribute("data-name")
										.toLowerCase();
								let role = card.getAttribute("data-role")
										.toLowerCase();
								if (name.includes(value)
										|| role.includes(value)) {
									card.style.display = "block";
								} else {
									card.style.display = "none";
								}
							});
				});
	</script>
</body>
</html>