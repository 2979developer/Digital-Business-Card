<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BizCard AI - The Future of Networking</title>
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
/* === Base & Scrollbar Fix === */
html, body {
	max-width: 100%;
	overflow-x: hidden;
}

body {
	font-family: 'Poppins', sans-serif;
	background-color: #f8f9fa;
	scroll-behavior: smooth;
}

/* === Glassmorphism Navbar === */
.navbar {
	transition: background-color 0.4s ease, padding 0.4s ease;
}

.navbar.scrolled {
	background-color: rgba(10, 20, 40, 0.7) !important;
	backdrop-filter: blur(10px);
	-webkit-backdrop-filter: blur(10px);
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.navbar-brand span {
	font-weight: 700;
	letter-spacing: 1px;
}

/* === 3D Interactive Hero Section === */
.hero {
	position: relative;
	height: 100vh;
	color: white;
	display: flex;
	align-items: center;
	overflow: hidden;
	background-color: #0a1024;
}

#hero-canvas {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.hero .container {
	position: relative;
	z-index: 2;
}

.hero h1 {
	font-weight: 700;
	text-shadow: 2px 2px 15px rgba(0, 0, 0, 0.5);
	line-height: 1.2;
}

.hero .lead {
	text-shadow: 1px 1px 10px rgba(0, 0, 0, 0.5);
	margin: 1.5rem 0;
}

.btn-hero {
	padding: 14px 35px;
	font-size: 1.1rem;
	font-weight: 600;
	border-radius: 50px;
	background-image: linear-gradient(45deg, #0d6efd, #6f42c1);
	color: #fff;
	border: none;
	transition: all 0.3s ease;
}

.btn-hero:hover {
	transform: translateY(-3px) scale(1.05);
	box-shadow: 0 10px 20px rgba(13, 110, 253, 0.3);
}

/* --- Universal Section Styling --- */
section {
	padding: 80px 0;
}

.section-title {
	font-weight: 700;
	color: #111;
}

.feature-card {
	border: none;
	border-radius: 15px;
	padding: 30px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
	background-color: #ffffff;
	height: 100%;
	transform-style: preserve-3d;
	transition: all 0.2s ease-out;
}

.feature-card:hover {
	box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
}

.feature-icon {
	font-size: 35px;
	width: 70px;
	height: 70px;
	line-height: 70px;
	border-radius: 50%;
	color: #fff;
	display: inline-block;
	margin-bottom: 20px;
	transform: translateZ(20px);
}

.feature-card h5, .feature-card p {
	transform: translateZ(10px);
}

#contact .form-control {
	border-radius: 12px;
	padding: 12px 15px;
}

.footer {
	color: white;
	background: #1a1a1a;
}

.footer a {
	color: rgba(255, 255, 255, 0.7);
	text-decoration: none;
	transition: color 0.3s;
}

.footer a:hover {
	color: blue;
}

.social-icon {
	width: 40px;
	height: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.1);
	border-radius: 50%;
	color: white;
	text-decoration: none;
	transition: all 0.3s;
}

.social-icon:hover {
	background: white;
	color: #2575fc;
}

@media ( min-width : 992px) {
	.hero-content {
		max-width: 60%;
		text-align: left;
	}
	.hero h1 {
		font-size: 4rem;
	}
}

@media ( max-width : 991.98px) {
	.hero {
		text-align: center;
	}
	.hero-content {
		text-align: center;
	}
	.hero .lead {
		margin: 1.5rem auto;
	}
	.hero h1 {
		font-size: 3rem;
	}
}

@media ( max-width : 767.98px) {
	.hero {
		height: 90vh;
		text-align: center;
	}
	.hero h1 {
		font-size: 2.5rem;
	}
	.hero .lead {
		font-size: 1.1rem;
	}
	.section-title {
		font-size: 1.75rem;
	}
	section {
		padding: 60px 0;
	}
	.navbar-collapse {
		background-color: rgba(33, 37, 41, 0.9);
		backdrop-filter: blur(10px);
		-webkit-backdrop-filter: blur(10px);
		padding: 1rem;
		border-radius: 15px;
		margin-top: 10px;
	}
	.navbar-nav .nav-item {
		margin-top: 0.5rem;
	}
	.btn-hero {
		padding: 12px 28px;
		font-size: 1rem;
	}
}

@media ( max-width : 400px) {
	.hero h1 {
		font-size: 2.1rem;
		line-height: 1.25;
	}
}
</style>
</head>
<body>

	<nav
		class="navbar navbar-expand-lg navbar-dark bg-transparent fixed-top py-3">
		<div class="container">
			<a class="navbar-brand d-flex align-items-center" href="index.jsp">
				<img src="assets/logo.png" alt="BizCard AI Logo" width="35"
				height="35" class="me-2"> <span
				style="font-size: 1.2rem; font-weight: 700;">BizCard <span
					style="color: #4dd0e1;">AI</span></span>
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto align-items-lg-center">
					<li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="features.jsp">Features</a></li>
					<li class="nav-item"><a class="nav-link" href="card.jsp">Cards</a></li>
					<li class="nav-item"><a class="nav-link" href="About.jsp">About</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
					<li class="nav-item ms-lg-3 mt-2 mt-lg-0"><a href="#"
						class="btn btn-sm btn-primary" data-bs-toggle="modal"
						data-bs-target="#signupModal">Sign Up</a></li>
					<li class="nav-item ms-lg-2 mt-2 mt-lg-0"><a href="#"
						class="btn btn-sm btn-outline-light" data-bs-toggle="modal"
						data-bs-target="#loginModal">Login</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<header class="hero">
		<canvas id="hero-canvas"></canvas>
		<div class="container" data-aos="fade-in">
			<div class="hero-content">
				<h1 class="display-3">Your Digital Identity, Reimagined</h1>
				<p class="lead">Instantly create and share stunning digital
					business cards with the power of AI.</p>
				<a href="#" class="btn btn-hero" data-bs-toggle="modal"
					data-bs-target="#signupModal">Create Your Card Now <i
					class="bi bi-arrow-right-short"></i></a>
			</div>
		</div>
	</header>

	<section id="features" class="container">
		<div class="text-center mb-5" data-aos="fade-up">
			<h2 class="section-title">Why Choose BizCard AI?</h2>
			<p class="text-muted">Everything you need to build your
				professional network.</p>
		</div>
		<div class="row g-4">
			<div class="col-12 col-sm-6 col-lg-3" data-aos="fade-up"
				data-aos-delay="100">
				<div class="feature-card text-center" data-tilt>
					<span class="feature-icon" style="background-color: #0d6efd;"><i
						class="bi bi-palette"></i></span>
					<h5 class="mt-3">Custom Designs</h5>
					<p class="text-muted small">Create stylish, personalized cards
						that match your brand in minutes.</p>
				</div>
			</div>
			<div class="col-12 col-sm-6 col-lg-3" data-aos="fade-up"
				data-aos-delay="200">
				<div class="feature-card text-center" data-tilt>
					<span class="feature-icon" style="background-color: #198754;"><i
						class="bi bi-robot"></i></span>
					<h5 class="mt-3">AI Suggestions</h5>
					<p class="text-muted small">Get AI-powered design and content
						recommendations for your card.</p>
				</div>
			</div>
			<div class="col-12 col-sm-6 col-lg-3" data-aos="fade-up"
				data-aos-delay="300">
				<div class="feature-card text-center" data-tilt>
					<span class="feature-icon" style="background-color: #ffc107;"><i
						class="bi bi-share"></i></span>
					<h5 class="mt-3">Easy Sharing</h5>
					<p class="text-muted small">Share via QR code, email, or a
						direct link on social media.</p>
				</div>
			</div>
			<div class="col-12 col-sm-6 col-lg-3" data-aos="fade-up"
				data-aos-delay="400">
				<div class="feature-card text-center" data-tilt>
					<span class="feature-icon" style="background-color: #dc3545;"><i
						class="bi bi-shield-lock"></i></span>
					<h5 class="mt-3">Secure & Private</h5>
					<p class="text-muted small">Your profile and contact
						information are protected with us.</p>
				</div>
			</div>
		</div>
	</section>
	<section id="cards" style="background-color: #ffffff;">
		<div class="container">
			<div class="text-center mb-5" data-aos="fade-up">
				<h2 class="section-title">Explore Our Designs</h2>
				<p class="text-muted">A look at some of the beautiful cards you
					can create.</p>
			</div>
			<div class="row g-4">
				<div class="col-12 col-sm-6 col-lg-3" data-aos="zoom-in"
					data-aos-delay="100">
					<img src="assets/card-1.png" class="img-fluid rounded shadow"
						alt="Card 1">
				</div>
				<div class="col-12 col-sm-6 col-lg-3" data-aos="zoom-in"
					data-aos-delay="200">
					<img src="assets/card-4.png" class="img-fluid rounded shadow"
						alt="Card 2">
				</div>
				<div class="col-12 col-sm-6 col-lg-3" data-aos="zoom-in"
					data-aos-delay="300">
					<img src="assets/card-3.png" class="img-fluid rounded shadow"
						alt="Card 3">
				</div>
				<div class="col-12 col-sm-6 col-lg-3" data-aos="zoom-in"
					data-aos-delay="400">
					<img src="assets/card-2.png" class="img-fluid rounded shadow"
						alt="Card 4">
				</div>
			</div>
		</div>
	</section>
	<section id="about" class="container">
		<div class="row align-items-center g-5">
			<div class="col-lg-6" data-aos="fade-up">
				<h2 class="section-title text-center text-lg-start mb-4">About
					Our Project</h2>
				<p class="text-muted">
					The <b>AI Powered Business Card Creator</b> is a modern solution to
					an age-old networking problem. We help you design and manage
					digital business cards effortlessly. With AI assistance,
					intelligent templates, and instant sharing options, you can stand
					out in any professional network and make connections that matter.
				</p>
				<a href="About.jsp" class="btn btn-primary mt-3">Learn More</a>
			</div>
			<div class="col-lg-6" data-aos="fade-up">
				<img src="assets/about.png" class="img-fluid rounded shadow"
					alt="About Project">
			</div>
		</div>
	</section>
	<section id="contact" style="background-color: #ffffff;">
		<div class="container">
			<div class="text-center mb-5" data-aos="fade-up">
				<h2 class="section-title">Get in Touch</h2>
				<p class="text-muted">Have a question or feedback? We'd love to
					hear from you.</p>
			</div>
			<div class="row g-5">
				<div class="col-lg-6" data-aos="fade-up">
					<form action="<%=request.getContextPath()%>/ContactServlet"
						method="post">
						<div class="mb-3">
							<input type="text" class="form-control" placeholder="Your Name"
								required>
						</div>
						<div class="mb-3">
							<input type="email" class="form-control" placeholder="Your Email"
								required>
						</div>
						<div class="mb-3">
							<textarea class="form-control" rows="5"
								placeholder="Your Message" required></textarea>
						</div>
						<button type="submit" class="btn btn-primary w-100 btn-lg" href="contact.jsp">Send
							Message</button>
					</form>
				</div>
				<div class="col-lg-6" data-aos="fade-up">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d387193.0506281772!2d-74.30917063299817!3d40.6971933466018!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew%20York%2C%20NY%2C%20USA!5e0!3m2!1sen!2sin!4v1758350756374!5m2!1sen!2sin"
						width="100%" height="100%"
						style="border: 0; border-radius: 15px; min-height: 350px;"
						allowfullscreen="" loading="lazy"></iframe>
				</div>
			</div>
		</div>
	</section>
	<footer class="footer">
		<div class="container py-5">
			<div class="row text-center text-md-start gy-4">
				<div class="col-lg-4 col-md-12">
					<div
						class="d-flex align-items-center justify-content-center justify-content-md-start mb-3">
						<img src="assets/logo.png" alt="BizCard AI Logo" width="45"
							height="45" class="me-2">
						<h5 class="fw-bold mb-0 text-white">
							BizCard <span style="color: #4dd0e1;">AI</span>
						</h5>
					</div>
					<p class="small">Design, customize, and share your digital
						identity effortlessly with AI-powered suggestions.</p>
				</div>
				<div class="col-lg-2 col-6">
					<h6 class="fw-bold text-uppercase">Links</h6>
					<ul class="list-unstyled">
						<li><a href="#">Home</a></li>
						<li><a href="features.jsp">Features</a></li>
						<li><a href="About.jsp">About</a></li>
						<li><a href="contact.jsp">Contact</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-6">
					<h6 class="fw-bold text-uppercase">Legal</h6>
					<ul class="list-unstyled">
						<li><a href="#">Terms of Service</a></li>
						<li><a href="#">Privacy Policy</a></li>
					</ul>
				</div>
				<div class="col-lg-4 col-md-12">
					<h6 class="fw-bold text-uppercase text-center text-md-start">Connect</h6>
					<div class="d-flex justify-content-center justify-content-md-start">
						<a href="#" class="social-icon me-2"><i class="bi bi-facebook"></i></a><a
							href="#" class="social-icon me-2"><i class="bi bi-twitter"></i></a><a
							href="#" class="social-icon me-2"><i class="bi bi-linkedin"></i></a><a
							href="#" class="social-icon"><i class="bi bi-github"></i></a>
					</div>
				</div>
			</div>
			<div class="text-center mt-4 border-top border-secondary-subtle pt-4">
				<p class="small mb-0">© 2025 BizCard AI. All Rights Reserved.</p>
			</div>
		</div>
	</footer>
	<div class="modal fade" id="signupModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Create Your Account</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<form action="SignupServlet" method="post">
						<div class="mb-3">
							<input type="text" class="form-control" name="username"
								placeholder="Full Name" required>
						</div>
						<div class="mb-3">
							<input type="email" class="form-control" name="email"
								placeholder="Email Address" required>
						</div>
						<div class="mb-3">
							<input type="password" class="form-control" name="password"
								placeholder="Password" required>
						</div>
						<button type="submit" class="btn btn-primary w-100">Sign
							Up</button>
					</form>
					<p class="mt-3 text-center small">
						Already have an account? <a href="#" data-bs-dismiss="modal"
							data-bs-toggle="modal" data-bs-target="#loginModal">Login</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="loginModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Welcome Back!</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<form action="LoginServlet" method="post">
						<div class="mb-3">
							<input type="email" class="form-control" name="email"
								placeholder="Email Address" required>
						</div>
						<div class="mb-3">
							<input type="password" class="form-control" name="password"
								placeholder="Password" required>
						</div>
						<button type="submit" class="btn btn-primary w-100">Login</button>
					</form>
					<p class="mt-3 text-center small">
						Don’t have an account? <a href="#" data-bs-dismiss="modal"
							data-bs-toggle="modal" data-bs-target="#signupModal">Sign Up</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/vanilla-tilt@1.7.2/dist/vanilla-tilt.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>

	<script>
		// Initialize AOS and VanillaTilt
		AOS.init({ duration : 800, once : true });
		VanillaTilt.init(document.querySelectorAll("[data-tilt]"), { max : 15, speed : 400, glare : true, "max-glare" : 0.5 });

        // Navbar scroll effect
        const nav = document.querySelector('.navbar');
        window.addEventListener('scroll', () => { window.scrollY > 50 ? nav.classList.add('scrolled') : nav.classList.remove('scrolled'); });

        // --- 3D Interactive Card ---
        let scene, camera, renderer, card;
        let mouseX = 0, mouseY = 0;
        let targetX = 0, targetY = 0;
        const windowHalfX = window.innerWidth / 2;
        const windowHalfY = window.innerHeight / 2;

        function init3D() {
            scene = new THREE.Scene();
            camera = new THREE.PerspectiveCamera(50, window.innerWidth / window.innerHeight, 0.1, 1000);
            camera.position.z = 5;
            renderer = new THREE.WebGLRenderer({ canvas: document.querySelector('#hero-canvas'), alpha: true });
            renderer.setPixelRatio(window.devicePixelRatio);
            renderer.setSize(window.innerWidth, window.innerHeight);
            const geometry = new THREE.BoxGeometry(2.5, 4, 0.1);
            const material = new THREE.MeshStandardMaterial({ color: 0x1a1a2e, metalness: 0.7, roughness: 0.4, emissive: 0x072534 });
            card = new THREE.Mesh(geometry, material);
            scene.add(card);
            const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);
            scene.add(ambientLight);
            const pointLight = new THREE.PointLight(0x8e44ad, 1.5, 100);
            pointLight.position.set(5, 5, 5);
            scene.add(pointLight);
            document.addEventListener('mousemove', onDocumentMouseMove);
            window.addEventListener('resize', onWindowResize);
            animate3D();
        }
        function onDocumentMouseMove(event) {
            mouseX = (event.clientX - windowHalfX);
            mouseY = (event.clientY - windowHalfY);
        }
        function onWindowResize() {
            camera.aspect = window.innerWidth / window.innerHeight;
            camera.updateProjectionMatrix();
            renderer.setSize(window.innerWidth, window.innerHeight);
        }
        function animate3D() {
            targetX = mouseX * 0.001;
            targetY = mouseY * 0.001;
            card.rotation.y += 0.05 * (targetX - card.rotation.y);
            card.rotation.x += 0.05 * (targetY - card.rotation.x);
            card.rotation.z += 0.001;
            renderer.render(scene, camera);
            requestAnimationFrame(animate3D);
        }
        init3D();

		// Modal & Logout Alert Scripts
		const params = new URLSearchParams(window.location.search);
		if (params.get("signup") === "success") {
			var loginModal = new bootstrap.Modal(document.getElementById("loginModal"));
			loginModal.show();
		} else if (params.get("signup") === "failed") {
			alert("Signup failed. Please try again.");
		} else if (params.get("signup") === "error") {
			alert("Error during signup. Check server logs.");
		}
	</script>

	<%
	HttpSession session1 = request.getSession(false);
	if (session1 != null) {
		String msg = (String) session1.getAttribute("logoutMessage");
		if (msg != null) {
	%>
	<div id="logoutAlert"
		class="alert alert-success alert-dismissible fade show position-fixed top-0 start-50 translate-middle-x mt-3 shadow"
		role="alert" style="z-index: 1050;">
		<%=msg%>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<script>
    setTimeout(() => {
        const alertEl = document.getElementById('logoutAlert');
        if (alertEl) {
            const bsAlert = new bootstrap.Alert(alertEl);
            bsAlert.close();
        }
    }, 3000);
    </script>
	<%
	session.removeAttribute("logoutMessage");
	}
	}
	%>
</body>
</html>

