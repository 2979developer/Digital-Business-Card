<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Digital Card | AI Business Card Creator</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>
body {
	font-family: 'Poppins', sans-serif;
	background-color: #f0f2f5;
}

/* Animation for the card preview */
@
keyframes fadeIn {from { opacity:0;
	transform: scale(0.95);
}

to {
	opacity: 1;
	transform: scale(1);
}

}
.form-container {
	background-color: #ffffff;
	padding: 2.5rem;
	border-radius: 20px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.05);
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

/* Card Preview Styling - matching mycard.jsp */
.card-preview-wrapper {
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100%;
}

.card-preview {
	width: 100%;
	max-width: 400px;
	border-radius: 20px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
	color: white;
	padding: 30px;
	background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
	animation: fadeIn 0.6s ease-out;
	position: relative;
	overflow: hidden;
}

.card-text-shadow {
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.25);
}

.card-preview h3 {
	font-size: 1.6rem;
	font-weight: 700;
	min-height: 38px; /* Prevents layout shift */
}

.card-preview h5 {
	font-size: 1rem;
	font-weight: 400;
	opacity: 0.9;
	margin-bottom: 20px;
	border-top: 1px solid rgba(255, 255, 255, 0.3);
	padding-top: 10px;
	min-height: 54px; /* Prevents layout shift */
}

.card-preview p {
	font-size: 0.95rem;
	margin-bottom: 8px;
	word-wrap: break-word;
	min-height: 24px; /* Prevents layout shift */
}

.card-icon {
	position: absolute;
	top: -20px;
	right: -20px;
	font-size: 100px;
	color: rgba(255, 255, 255, 0.1);
	transform: rotate(20deg);
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
	transition: transform 0.2s;
}

.btn-custom:hover {
	transform: scale(1.03);
	color: white;
}
</style>
</head>
<body>

	<div class="container my-5">
		<div class="text-center mb-5">
			<h2 class="fw-bold">Design Your Digital Card</h2>
			<p class="text-muted">Fill in your details and watch your card
				come to life.</p>
		</div>
		<div class="row g-5">

			<div class="col-lg-6">
				<div class="form-container">
					<form action="SaveCardServlet" method="post">
						<div class="mb-3">
							<label for="name" class="form-label">Full Name</label> <input
								type="text" class="form-control" id="name" name="name"
								placeholder="e.g., Om Shinde" oninput="updatePreview()">
						</div>
						<div class="mb-3">
							<label for="title" class="form-label">Job Title /
								Designation</label> <input type="text" class="form-control" id="title"
								name="title" placeholder="e.g., Software Developer"
								oninput="updatePreview()">
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email Address</label> <input
								type="email" class="form-control" id="email" name="email"
								placeholder="e.g., om@example.com" oninput="updatePreview()">
						</div>
						<div class="mb-3">
							<label for="phone" class="form-label">Phone Number</label> <input
								type="text" class="form-control" id="phone" name="phone"
								placeholder="e.g., +91 9876543210" oninput="updatePreview()">
						</div>
						<div class="mb-3">
							<label for="website" class="form-label">Website
								(Optional)</label> <input type="text" class="form-control" id="website"
								name="website" placeholder="e.g., www.omshinde.com"
								oninput="updatePreview()">
						</div>
						<button type="submit" class="btn btn-custom mt-4">Create
							& Save Card</button>
					</form>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="card-preview-wrapper">
					<div class="card-preview" id="cardPreview">
						<i class="fas fa-address-card card-icon"></i>
						<div class="card-text-shadow">
							<h3 id="previewName">Your Name</h3>
							<h5 id="previewTitle">Your Job Title</h5>
							<p id="previewEmail">
								<i class="fas fa-envelope fa-fw me-2"></i> <span id="emailText">your.email@example.com</span>
							</p>

							<p id="previewPhone">
								<i class="fas fa-phone fa-fw me-2"></i> <span id="phoneText">+91
									00000 00000</span>
							</p>

							<p id="previewWebsite">
								<i class="fas fa-globe fa-fw me-2"></i> <span id="websiteText">yourwebsite.com</span>
							</p>

						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<script>
		function updatePreview() {
			// Name
			let name = document.getElementById("name").value.trim();
			document.getElementById("previewName").innerText = name
					|| "Your Name";

			// Title
			let title = document.getElementById("title").value.trim();
			document.getElementById("previewTitle").innerText = title
					|| "Your Job Title";

			// Email
			let email = document.getElementById("email").value.trim();
			document.getElementById("emailText").innerText = email
					|| "your.email@example.com";

			// Phone
			let phone = document.getElementById("phone").value.trim();
			document.getElementById("phoneText").innerText = phone
					|| "+91 00000 00000";

			// Website
			let website = document.getElementById("website").value.trim();
			document.getElementById("websiteText").innerText = website
					|| "yourwebsite.com";
		}

		// Initial call to set placeholder text on page load
		updatePreview();
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>