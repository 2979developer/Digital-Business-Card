<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact - BizCard AI</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
	rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css"
	rel="stylesheet">

<style>
body {
	background: #f8f9fa;
	font-family: 'Segoe UI', sans-serif;
}

.hero {
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	color: white;
	padding: 100px 20px;
	text-align: center;
	position: relative;
}

.hero::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
}

.hero h1, .hero p, .hero a {
	position: relative;
	z-index: 1;
}

.contact-card {
	border-radius: 12px;
	padding: 20px;
	background: white;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	text-align: center;
	transition: transform 0.3s ease;
}

.contact-card:hover {
	transform: translateY(-5px);
}

.contact-icon {
	font-size: 40px;
	color: #2575fc;
	margin-bottom: 10px;
}

.faq-section {
	padding: 60px 20px;
	background: #fff;
}

.faq-question {
	font-weight: bold;
	color: #2575fc;
}

.faq-answer {
	margin-bottom: 20px;
}

footer {
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	color: white;
	padding: 20px;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
		<div class="container">
			<a class="navbar-brand fw-bold" href="index.jsp">BizCard <span
				style="color: #4dd0e1;">AI</span></a>
		</div>
	</nav>

	<!-- Hero -->
	<div class="hero" data-aos="fade-down">
		<h1>Contact Us</h1>
		<p>We’d love to hear from you! Reach out anytime.</p>
		<a href="index.jsp" class="btn btn-light btn-lg mt-3">← Back to
			Home</a>
	</div>

	<!-- Contact Info -->
	<div class="container py-5">
		<div class="row g-4 text-center">
			<div class="col-md-4" data-aos="fade-up">
				<div class="contact-card">
					<i class="bi bi-envelope contact-icon"></i>
					<h6>Email</h6>
					<p>support@bizcardai.com</p>
				</div>
			</div>
			<div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
				<div class="contact-card">
					<i class="bi bi-telephone contact-icon"></i>
					<h6>Phone</h6>
					<p>+91 xxxxxxxxxx</p>
				</div>
			</div>
			<div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
				<div class="contact-card">
					<i class="bi bi-geo-alt contact-icon"></i>
					<h6>Address</h6>
					<p>Pune, Maharashtra, India</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Contact Form + Map -->
	<div class="container py-5">
		<div class="row g-4">
			<!-- Contact Form -->
			<div class="col-lg-6" data-aos="fade-right">
				<div class="card p-4 shadow">
					<h4 class="text-center mb-4">Send Us a Message</h4>
					<form action="<%=request.getContextPath()%>/ContactServlet"
						method="post">
						<div class="mb-3">
							<input type="text" class="form-control" name="name"
								placeholder="Your Name" required>
						</div>
						<div class="mb-3">
							<input type="email" class="form-control" name="email"
								placeholder="Your Email" required>
						</div>
						<div class="mb-3">
							<textarea class="form-control" name="message" rows="4"
								placeholder="Your Message" required></textarea>
						</div>
						<button type="submit" class="btn btn-primary w-100">Send
							Message</button>
					</form>
				</div>
			</div>

			<!-- Google Map -->
			<div class="col-lg-6" data-aos="fade-left">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3783.708370010981!2d73.85625521536894!3d18.520430087409576!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2c06d8d7c46f5%3A0xdeb9f4a5c9f83e37!2sPune%2C%20Maharashtra!5e0!3m2!1sen!2sin!4v1700000000000"
					width="100%" height="100%" style="border: 0; min-height: 400px;"
					allowfullscreen="" loading="lazy"> </iframe>
			</div>
		</div>
	</div>

	<!-- FAQ Section -->
	<section class="faq-section" data-aos="fade-up">
		<div class="container">
			<h2 class="text-center mb-5">Frequently Asked Questions</h2>
			<div class="row">
				<div class="col-md-6">
					<p class="faq-question">💡 What is BizCard AI?</p>
					<p class="faq-answer">BizCard AI is a platform to create and
						share digital business cards with AI-powered suggestions.</p>

					<p class="faq-question">💡 Do I need to pay?</p>
					<p class="faq-answer">We offer free and premium plans (Normal,
						Silver, Gold) based on your needs.</p>
				</div>
				<div class="col-md-6">
					<p class="faq-question">💡 How can I share my card?</p>
					<p class="faq-answer">You can share via QR code, link, or
						directly on social media.</p>

					<p class="faq-question">💡 Is my data secure?</p>
					<p class="faq-answer">Yes, we use secure authentication and
						encrypted storage to protect your data.</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer class="text-center">
		<p class="mb-0">
			© 2025 BizCard AI | <a href="features.jsp" class="text-white">Features</a>
			| <a href="about.jsp" class="text-white">About</a>
		</p>
	</footer>

	<!-- JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
	<script>
    AOS.init({ duration: 1000, once: true });
  </script>

	<%
	HttpSession session2 = request.getSession(false);
	if (session2 != null) {
		String msg = (String) session2.getAttribute("contactMessage");
		if (msg != null) {
	%>
	<div id="contactAlert"
		class="alert alert-success alert-dismissible fade show position-fixed top-0 start-50 translate-middle-x mt-3 shadow"
		role="alert"
		style="z-index: 1050; width: auto; max-width: 400px; text-align: center;">
		<%=msg%>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>

	<script>
    setTimeout(() => {
        const alert = document.getElementById('contactAlert');
        if (alert) {
            alert.classList.remove('show');
            alert.classList.add('fade');
            setTimeout(() => alert.remove(), 500);
        }
    }, 3000);
</script>

	<%
	session2.removeAttribute("contactMessage");
	}
	}
	%>

</body>
</html>
