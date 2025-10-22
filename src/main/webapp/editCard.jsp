<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Card | Admin Panel</title>
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
.card-preview {
	border-radius: 20px;
	padding: 40px 30px;
	color: white;
	text-align: center;
	position: sticky;
	top: 2rem;
	background: linear-gradient(135deg, #434343, #2c3e50, #000000);
	background-size: 200% 200%;
	animation: animatedGradient 12s ease infinite;
	box-shadow: 0 15px 40px rgba(44, 62, 80, 0.3);
}

.card-preview .icon {
	font-size: 5rem;
	color: #ffc107;
	text-shadow: 0 0 20px rgba(255, 193, 7, 0.5);
}

.card-preview h3 {
	font-weight: 700;
	text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.3);
}

.form-card {
	background-color: #ffffff;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
	border: none;
}

.form-card-header {
	padding: 2rem 2.5rem 1.5rem;
	border-bottom: 1px solid #e9ecef;
}

.form-card-header h3 {
	font-weight: 600;
}

.form-card-body {
	padding: 2.5rem;
}

.input-group-text {
	background-color: #f8f9fa;
	border-right: none;
}

.form-control {
	border-left: none;
}

/* Redesigned Buttons */
.btn-update {
	font-weight: 600;
	border-radius: 0.75rem;
	background: linear-gradient(to right, #6a11cb, #2575fc);
	border: none;
	transition: transform 0.2s, box-shadow 0.2s;
	margin-left: 10px;
}

.btn-update:hover {
	transform: translateY(-2px);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
}

/* Responsive adjustments */
@media ( max-width : 991.98px) {
	.card-preview {
		position: static; /* Unstick the card on smaller screens */
	}
	.form-card-header {
		padding: 1.5rem;
	}
	.form-card-body {
		padding: 1.5rem;
	}
}
</style>
</head>
<body>

	<%
	// --- FETCH CARD DATA  ---
	int cardId = 0;
	String cardIdParam = request.getParameter("id");
	if (cardIdParam != null && !cardIdParam.isEmpty()) {
		cardId = Integer.parseInt(cardIdParam);
	}

	String fullName = "", jobTitle = "", email = "", phone = "", website = "";
	Connection con = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bizcard_ai", "root", "root");
		if (cardId > 0) {
			String sql = "SELECT * FROM cards WHERE id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cardId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
		fullName = rs.getString("full_name");
		jobTitle = rs.getString("job_title");
		email = rs.getString("email");
		phone = rs.getString("phone") != null ? rs.getString("phone") : "";
		website = rs.getString("website") != null ? rs.getString("website") : "";
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (con != null)
			try {
		con.close();
			} catch (Exception e) {
		e.printStackTrace();
			}
	}
	%>

	<div class="container my-4 my-md-5">
		<div class="row g-4 g-lg-5">
			<div class="col-lg-5" data-aos="fade-right">
				<div class="card-preview">
					<div class="icon mb-3">
						<i class="bi bi-pencil-square"></i>
					</div>
					<h3>Edit Card Details</h3>
					<p class="text-white-50 mt-2">
						You are editing card ID #<%=cardId%>. Changes made here will
						directly update the database.
					</p>
				</div>
			</div>

			<div class="col-lg-7" data-aos="fade-left" data-aos-delay="100">
				<div class="card form-card">
					<div class="form-card-header">
						<h3>Card Information</h3>
						<p class="text-muted mb-0 small">Update the fields below and
							save your changes.</p>
					</div>
					<div class="form-card-body">
						<form action="UpdateCardServlet" method="post">
							<input type="hidden" name="cardId" value="<%=cardId%>">

							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="fullName" class="form-label">Full Name</label>
									<div class="input-group">
										<span class="input-group-text"><i
											class="bi bi-person-fill"></i></span> <input type="text"
											class="form-control" id="fullName" name="name"
											value="<%=fullName%>" required>
									</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="jobTitle" class="form-label">Job Title</label>
									<div class="input-group">
										<span class="input-group-text"><i
											class="bi bi-briefcase-fill"></i></span> <input type="text"
											class="form-control" id="jobTitle" name="title"
											value="<%=jobTitle%>" required>
									</div>
								</div>
								<div class="col-12 mb-3">
									<label for="email" class="form-label">Email</label>
									<div class="input-group">
										<span class="input-group-text"><i
											class="bi bi-envelope-fill"></i></span> <input type="email"
											class="form-control" id="email" name="email"
											value="<%=email%>" required>
									</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="phone" class="form-label">Phone</label>
									<div class="input-group">
										<span class="input-group-text"><i
											class="bi bi-telephone-fill"></i></span> <input type="text"
											class="form-control" id="phone" name="phone"
											value="<%=phone%>">
									</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="website" class="form-label">Website</label>
									<div class="input-group">
										<span class="input-group-text"><i class="bi bi-globe"></i></span>
										<input type="text" class="form-control" id="website"
											name="website" value="<%=website%>">
									</div>
								</div>
							</div>

							<div
								class="d-flex justify-content-between align-items-center mt-4">
								<a href="admin.jsp" class="btn btn-secondary"> <i
									class="bi bi-arrow-left-circle me-1"></i>Back to Admin
								</a>
								<button type="submit" class="btn btn-primary btn-update">
									<i class="bi bi-check-circle-fill me-2"></i>Update Card
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="position-fixed top-0 end-0 p-3" style="z-index: 1100;">
		<div id="toastMessage"
			class="toast align-items-center text-white border-0" role="alert"
			aria-live="assertive" aria-atomic="true">
			<div class="d-flex">
				<div id="toastBody" class="toast-body"></div>
				<button type="button" class="btn-close btn-close-white me-2 m-auto"
					data-bs-dismiss="toast"></button>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
	<script>
        AOS.init({ once: true, duration: 800 });
        document.addEventListener("DOMContentLoaded", function () {
            const params = new URLSearchParams(window.location.search);
            const status = params.get("status");
            if (!status) return;
            const toastEl = document.getElementById("toastMessage");
            const toastBody = document.getElementById("toastBody");
            if (status === "updated") {
                toastBody.textContent = "✅ Card updated successfully!";
                toastEl.classList.add("bg-success");
            } else if (status === "failed") {
                toastBody.textContent = "⚠️ Failed to update the card!";
                toastEl.classList.add("bg-warning");
            } else if (status === "error") {
                toastBody.textContent = "❌ An error occurred while updating the card.";
                toastEl.classList.add("bg-danger");
            }
            const toast = new bootstrap.Toast(toastEl, { delay: 3000 });
            toast.show();
            if (status === "updated") {
                setTimeout(() => {
                    window.location.href = "admin.jsp";
                }, 3200);
            }
        });
    </script>
</body>
</html>