<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Choose Your Plan | AI Business Card Creator</title>
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

/* Keyframes for animations */
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
@
keyframes iconFadeIn {from { opacity:0;
	transform: scale(0.8);
}

to {
	opacity: 1;
	transform: scale(1);
}

}
.pricing-card {
	border-radius: 20px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	display: flex;
	flex-direction: column;
	height: 100%;
	background-color: #ffffff;
	position: relative;
	overflow: hidden;
	border: 1px solid #e9ecef;
}

.pricing-card:hover {
	transform: translateY(-10px);
	box-shadow: 0 12px 35px rgba(0, 0, 0, 0.12);
}

.plan-header {
	padding: 30px;
	text-align: center;
}

.plan-title {
	font-size: 1.5rem;
	font-weight: 600;
}

.price {
	font-size: 2.5rem;
	font-weight: 700;
	color: #333;
	margin: 10px 0;
}

.price .period {
	font-size: 1rem;
	font-weight: 400;
	color: #6c757d;
}

.plan-features {
	padding: 0 30px 30px;
	flex-grow: 1;
}

.plan-features .list-group-item {
	border: none;
	padding-left: 0;
	font-size: 1rem;
	background-color: transparent;
}

.plan-features .fa-check-circle {
	color: #28a745;
	margin-right: 10px;
	animation: iconFadeIn 0.5s ease-out forwards;
}

.plan-footer {
	padding: 30px;
	margin-top: auto;
}

.btn-plan {
	border-radius: 12px;
	padding: 12px 20px;
	width: 100%;
	font-weight: 600;
	font-size: 1.1rem;
	transition: transform 0.2s;
}

.btn-plan:hover {
	transform: scale(1.03);
}

.pricing-card::before {
	content: '';
	position: absolute;
	top: 0;
	left: -150%;
	width: 100%;
	height: 100%;
	background: linear-gradient(to right, rgba(255, 255, 255, 0) 0%,
		rgba(255, 255, 255, 0.2) 50%, rgba(255, 255, 255, 0) 100%);
	transform: skewX(-25deg);
	transition: left 0.7s ease-in-out;
}

.pricing-card:hover::before {
	left: 150%;
}

/* Silver "Popular" Plan */
.highlight-plan-silver {
	color: white;
	border: none;
	background: linear-gradient(135deg, #434343, #2c3e50, #000000);
	background-size: 200% 200%;
	animation: animatedGradient 10s ease infinite;
	box-shadow: 0 10px 30px rgba(44, 62, 80, 0.4);
}

.highlight-plan-silver .plan-title, .highlight-plan-silver .price,
	.highlight-plan-silver .price .period, .highlight-plan-silver .list-group-item
	{
	color: white;
}

.highlight-plan-silver .fa-check-circle {
	color: #ffc107;
}

.highlight-plan-silver .btn-plan {
	background-color: #ffc107;
	color: #333;
	border: none;
}

.highlight-plan-silver .btn-plan:hover {
	background-color: #ffca2c;
	color: #333;
}

.badge-popular {
	position: absolute;
	top: 20px;
	right: -30px;
	background-color: #ffc107;
	color: #333;
	padding: 5px 30px;
	transform: rotate(45deg);
	font-weight: 600;
	font-size: 0.8rem;
	z-index: 1;
}

/* Gold "Premium" Plan */
.highlight-plan-gold {
	color: #333;
	border: none;
	background: linear-gradient(135deg, #fff7b2, #ffc107, #e6ac00);
	background-size: 200% 200%;
	animation: animatedGradient 8s ease infinite;
	box-shadow: 0 10px 30px rgba(255, 193, 7, 0.4);
}

.highlight-plan-gold .plan-title, .highlight-plan-gold .price {
	color: #333;
}

.highlight-plan-gold .price .period {
	color: #555;
}

.highlight-plan-gold .list-group-item {
	color: #333;
}

.highlight-plan-gold .fa-check-circle {
	color: #2c3e50;
}

.highlight-plan-gold .btn-plan {
	background-color: #2c3e50;
	color: white;
	border: none;
}

.highlight-plan-gold .btn-plan:hover {
	background-color: #34495e;
	color: white;
}
</style>
</head>
<body>

	<div class="container my-5">
		<div class="text-center mb-5">
			<h2 class="fw-bold">Choose the Perfect Plan for You</h2>
			<p class="text-muted">Start for free or unlock powerful premium
				features.</p>
		</div>
		<div class="row g-4 justify-content-center">

			<div class="col-lg-4 col-md-6">
				<div class="pricing-card">
					<div class="plan-header">
						<h3 class="plan-title">Free</h3>
						<div class="price">₹0</div>
					</div>
					<div class="plan-features">
						<ul class="list-group list-group-flush">
							<li class="list-group-item"><i class="fas fa-check-circle"></i>Basic
								Card Design</li>
							<li class="list-group-item"><i class="fas fa-check-circle"></i>Limited
								Templates</li>
							<li class="list-group-item"><i class="fas fa-check-circle"></i>1
								Saved Card</li>
						</ul>
					</div>
					<div class="plan-footer">
						<a href="createCard.jsp" class="btn btn-outline-primary btn-plan">Get
							Started</a>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-md-6">
				<div class="pricing-card highlight-plan-silver">
					<div class="badge-popular">Popular</div>
					<div class="plan-header">
						<h3 class="plan-title">Silver</h3>
						<div class="price">
							₹499<span class="period">/ month</span>
						</div>
					</div>
					<div class="plan-features">
						<ul class="list-group list-group-flush">
							<li class="list-group-item"><i class="fas fa-check-circle"></i>10
								Saved Cards</li>
							<li class="list-group-item"><i class="fas fa-check-circle"></i>Premium
								Templates</li>
							<li class="list-group-item"><i class="fas fa-check-circle"></i>Email
								Support</li>
						</ul>
					</div>
					<div class="plan-footer">
						<form action="PaymentServlet" method="post">
							<input type="hidden" name="plan" value="Silver">
							<button type="submit" class="btn btn-plan">Choose Plan</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-md-6">
				<div class="pricing-card highlight-plan-gold">
					<div class="plan-header">
						<h3 class="plan-title">Gold</h3>
						<div class="price">
							₹999<span class="period">/ month</span>
						</div>
					</div>
					<div class="plan-features">
						<ul class="list-group list-group-flush">
							<li class="list-group-item"><i class="fas fa-check-circle"></i>Unlimited
								Cards</li>
							<li class="list-group-item"><i class="fas fa-check-circle"></i>All
								Templates & Features</li>
							<li class="list-group-item"><i class="fas fa-check-circle"></i>24/7
								Priority Support</li>
						</ul>
					</div>
					<div class="plan-footer">
						<form action="PaymentServlet" method="post">
							<input type="hidden" name="plan" value="Gold">
							<button type="submit" class="btn btn-plan">Choose Plan</button>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
<!-- ✅ Toast Notification (Responsive & Dynamic Colors) -->
<div class="toast-container position-fixed p-3" id="toastPlacement">
  <div id="toastMessage" class="toast align-items-center border-0" 
       role="alert" aria-live="assertive" aria-atomic="true">
    <div class="d-flex">
      <div class="toast-body" id="toastText"></div>
      <button type="button" class="btn-close btn-close-white me-2 m-auto" 
              data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
  </div>
</div>

<style>
/* ✅ Toast responsive position */
@media (min-width: 576px) {
  #toastPlacement {
    top: 1rem;
    right: 1rem;
    position: fixed;
  }
}

@media (max-width: 575.98px) {
  #toastPlacement {
    top: 1rem;
    left: 50%;
    transform: translateX(-50%);
    position: fixed;
    width: 90%;
    display: flex;
    justify-content: center;
  }

  #toastMessage {
    width: 100%;
    text-align: center;
  }
}

/* ✅ Toast style adjustments */
.toast-success {
  background: linear-gradient(135deg, #28a745, #218838);
  color: #fff;
}

.toast-error {
  background: linear-gradient(135deg, #dc3545, #c82333);
  color: #fff;
}
</style>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const urlParams = new URLSearchParams(window.location.search);
    const status = urlParams.get("status");
    const toastEl = document.getElementById('toastMessage');
    const toastText = document.getElementById('toastText');

    if (status === "success") {
        toastEl.classList.add("toast-success");
        toastText.innerHTML = "🎉 Payment Successful! Your plan has been upgraded.";
    } else if (status === "error") {
        toastEl.classList.add("toast-error");
        toastText.innerHTML = "❌ Payment Failed! Please try again.";
    } else {
        return; // No toast if no status
    }

    const toast = new bootstrap.Toast(toastEl, { delay: 3000 });
    toast.show();
});
</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>