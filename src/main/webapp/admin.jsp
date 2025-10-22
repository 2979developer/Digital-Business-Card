<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Panel | AI Business Card Creator</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
:root {
	/* Define heights for scroll offset */
	--header-height-desktop: 160px;
	--header-height-mobile: 210px;
}

html {
	scroll-padding-top: var(--header-height-desktop);
	/* Default offset for sticky header */
}

body {
	font-family: 'Poppins', sans-serif;
	background-color: #f4f7fc;
}

/* --- Sticky Navigation Header --- */
.admin-header {
	background-color: #ffffff;
	border-radius: 15px;
	padding: 20px 30px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
	z-index: 1020; /* Ensure it's above content */
}

.page-header {
	font-weight: 700;
	color: #333;
}

.nav-scroll-wrapper {
	overflow-x: auto;
	-webkit-overflow-scrolling: touch; /* Smooth scrolling on iOS */
}

.nav-scroll-wrapper .nav {
	flex-wrap: nowrap;
	/* Prevent tabs from wrapping to the next line on mobile */
}

.nav-pills .nav-link {
	color: #6c757d;
	font-weight: 500;
	white-space: nowrap;
	background-color: #f8f9fa;
	margin-right: 10px;
	margin-bottom: 10px; /* For wrapping on tablets */
}

.nav-pills .nav-link.active {
	background-color: #0d6efd;
	color: #fff;
	box-shadow: 0 4px 15px rgba(13, 110, 253, 0.4);
}
/* Hide scrollbar for a cleaner look */
.nav-scroll-wrapper::-webkit-scrollbar {
	display: none;
}

.nav-scroll-wrapper {
	-ms-overflow-style: none;
	scrollbar-width: none;
}

/* --- General Section & Card Styling --- */
.stat-card {
	background-color: #ffffff;
	border-radius: 15px;
	padding: 25px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
	display: flex;
	align-items: center;
	transition: transform 0.3s ease;
}

.stat-card:hover {
	transform: translateY(-5px);
}

.stat-card .stat-icon {
	font-size: 30px;
	width: 60px;
	height: 60px;
	line-height: 60px;
	text-align: center;
	border-radius: 50%;
	color: #fff;
	margin-right: 20px;
}

.stat-card .stat-info h3 {
	font-size: 2rem;
	font-weight: 700;
	margin: 0;
}

.stat-card .stat-info p {
	margin: 0;
	color: #6c757d;
}

.icon-users {
	background-color: #0d6efd;
}

.icon-cards {
	background-color: #198754;
}

.icon-payments {
	background-color: #ffc107;
}

.admin-section {
	background-color: #ffffff;
	border-radius: 15px;
	padding: 30px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
}

.table thead {
	font-weight: 600;
}

/* --- Login Overlay --- */
#adminLoginOverlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(255, 255, 255, 0.1);
	backdrop-filter: blur(8px);
	z-index: 2000;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 15px;
}

#adminContent {
	filter: blur(8px);
	pointer-events: none;
	transition: filter 0.3s ease-out;
}

/* TABLET & UP (>=768px) */
@media ( min-width : 768px) {
	.nav-scroll-wrapper .nav {
		flex-wrap: wrap; /* Allow tabs to wrap on tablets */
	}
	.nav-scroll-wrapper {
		overflow-x: hidden; /* No need to scroll if they can wrap */
	}
}
/* MOBILE (<768px) */
@media ( max-width : 767.98px) {
	html {
		scroll-padding-top: var(--header-height-mobile);
	}
	.admin-header .d-flex {
		flex-direction: column;
		text-align: center;
	}
	.page-header {
		font-size: 1.75rem;
	}
	.stat-card .stat-info h3 {
		font-size: 1.75rem;
	}
	.admin-section {
		padding: 20px;
	}
}
</style>
</head>
<body data-bs-spy="scroll" data-bs-target="#admin-nav">

	<%
	Connection con = null;
	int totalUsers = 0, totalCards = 0, totalPayments = 0;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bizcard_ai", "root", "root");
		PreparedStatement ps1 = con.prepareStatement("SELECT COUNT(*) FROM users");
		ResultSet rs1 = ps1.executeQuery();
		if (rs1.next())
			totalUsers = rs1.getInt(1);
		PreparedStatement ps2 = con.prepareStatement("SELECT COUNT(*) FROM cards");
		ResultSet rs2 = ps2.executeQuery();
		if (rs2.next())
			totalCards = rs2.getInt(1);
		PreparedStatement ps3 = con.prepareStatement("SELECT COUNT(*) FROM payments");
		ResultSet rs3 = ps3.executeQuery();
		if (rs3.next())
			totalPayments = rs3.getInt(1);
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>

	<!-- Login Overlay -->
	<div id="adminLoginOverlay">
		<div class="card p-4 shadow-lg w-100"
			style="max-width: 450px; border-radius: 15px;">
			<h4 class="text-center mb-1">Admin Panel</h4>
			<p class="text-center text-muted mb-3">Please login to continue</p>
			<form id="adminLoginForm">
				<div class="mb-3">
					<input type="text" id="adminUsername" class="form-control"
						placeholder="Username" required>
				</div>
				<div class="mb-3">
					<input type="password" id="adminPassword" class="form-control"
						placeholder="Password" required>
				</div>
				<button type="submit" class="btn btn-primary w-100">Login</button>
			</form>
			<div id="loginError" class="text-danger text-center mt-2"
				style="display: none;">Incorrect username or password!</div>
		</div>
	</div>

	<!-- Admin Content (Initially blurred) -->
	<div id="adminContent">
		<div class="container py-4">
			<!-- Sticky Navigation Header -->
			<div class="admin-header mb-4 sticky-top">
				<div
					class="d-flex flex-column flex-md-row justify-content-between align-items-md-center">
					<h1 class="page-header mb-3 mb-md-0">Admin Dashboard</h1>
					<a href="#" id="adminLogoutBtn" class="btn btn-outline-danger">Logout
						<i class="bi bi-box-arrow-right"></i>
					</a>
				</div>
				<hr>
				<div class="nav-scroll-wrapper">
					<ul class="nav nav-pills" id="admin-nav">
						<li class="nav-item"><a class="nav-link"
							href="#analytics-overview"><i class="bi bi-graph-up me-2"></i>Analytics</a></li>
						<li class="nav-item"><a class="nav-link" href="#add-card"><i
								class="bi bi-plus-circle-fill me-2"></i>Add Card</a></li>
						<li class="nav-item"><a class="nav-link" href="#manage-cards"><i
								class="bi bi-postcard-fill me-2"></i>Manage Cards</a></li>
						<li class="nav-item"><a class="nav-link" href="#manage-users"><i
								class="bi bi-people-fill me-2"></i>Manage Users</a></li>
						<li class="nav-item"><a class="nav-link"
							href="#payments-report"><i
								class="bi bi-credit-card-fill me-2"></i>Payments</a></li>
					</ul>
				</div>
			</div>

			<!-- Analytics Section -->
			<div id="analytics-overview" class="admin-section mb-4">
				<h3 class="mb-4 fs-4 fw-semibold">Analytics Overview</h3>
				<div class="row g-4">
					<div class="col-lg-4 col-md-6 col-12">
						<div class="stat-card">
							<div class="stat-icon icon-users">
								<i class="bi bi-people-fill"></i>
							</div>
							<div class="stat-info">
								<h3><%=totalUsers%></h3>
								<p>Total Users</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-12">
						<div class="stat-card">
							<div class="stat-icon icon-cards">
								<i class="bi bi-postcard-fill"></i>
							</div>
							<div class="stat-info">
								<h3><%=totalCards%></h3>
								<p>Total Cards</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-12">
						<div class="stat-card">
							<div class="stat-icon icon-payments">
								<i class="bi bi-credit-card-fill"></i>
							</div>
							<div class="stat-info">
								<h3><%=totalPayments%></h3>
								<p>Total Payments</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Add Card Section -->
			<div id="add-card" class="admin-section mb-4">
				<h3 class="mb-4 fs-4 fw-semibold">
					<i class="bi bi-plus-circle-fill me-2"></i>Add a New Card
				</h3>
				<form action="AdminInsertCardServlet" method="post">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="userId" class="form-label">Assign to User</label> <select
								class="form-select" id="userId" name="userId" required>
								<option value="" selected disabled>Select a user...</option>
								<%
								try {
									String userListQuery = "SELECT id, username, email FROM users ORDER BY username";
									PreparedStatement psUserList = con.prepareStatement(userListQuery);
									ResultSet rsUserList = psUserList.executeQuery();
									while (rsUserList.next()) {
										out.println("<option value='" + rsUserList.getInt("id") + "'>" + rsUserList.getString("username") + " ("
										+ rsUserList.getString("email") + ")</option>");
									}
								} catch (Exception e) {
									e.printStackTrace();
								}
								%>
							</select>
						</div>
						<div class="col-md-6 mb-3">
							<label for="cardName" class="form-label">Full Name (on
								card)</label><input type="text" class="form-control" id="cardName"
								name="name" placeholder="e.g., Jane Doe" required>
						</div>
						<div class="col-md-6 mb-3">
							<label for="cardTitle" class="form-label">Job Title</label><input
								type="text" class="form-control" id="cardTitle" name="title"
								placeholder="e.g., Marketing Manager" required>
						</div>
						<div class="col-md-6 mb-3">
							<label for="cardEmail" class="form-label">Email</label><input
								type="email" class="form-control" id="cardEmail" name="email"
								placeholder="e.g., jane.doe@example.com" required>
						</div>
						<div class="col-md-6 mb-3">
							<label for="cardPhone" class="form-label">Phone</label><input
								type="text" class="form-control" id="cardPhone" name="phone"
								placeholder="e.g., +91 9876543210">
						</div>
						<div class="col-md-6 mb-3">
							<label for="cardWebsite" class="form-label">Website</label><input
								type="text" class="form-control" id="cardWebsite" name="website"
								placeholder="e.g., www.example.com">
						</div>
					</div>
					<button type="submit" class="btn btn-primary mt-3 w-100">Create
						and Save Card</button>
				</form>
			</div>

			<!-- Manage Cards Section -->
			<div id="manage-cards" class="admin-section mb-4">
				<h3 class="mb-4 fs-4 fw-semibold">
					<i class="bi bi-postcard-fill me-2"></i>Manage All Cards
				</h3>
				<div class="table-responsive">
					<table class="table table-hover align-middle">
						<thead class="table-light">
							<tr>
								<th>Card ID</th>
								<th>Belongs To</th>
								<th>Name on Card</th>
								<th>Title</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							try {
								String cardQuery = "SELECT c.id, c.full_name, c.card_title, u.username AS user_name FROM cards c JOIN users u ON c.user_id = u.id ORDER BY c.id DESC";
								PreparedStatement psCards = con.prepareStatement(cardQuery);
								ResultSet rsCards = psCards.executeQuery();
								while (rsCards.next()) {
							%>
							<tr>
								<td><%=rsCards.getInt("id")%></td>
								<td><%=rsCards.getString("user_name")%></td>
								<td><%=rsCards.getString("full_name")%></td>
								<td><%=rsCards.getString("card_title")%></td>
								<td><a href="editCard.jsp?id=<%=rsCards.getInt("id")%>"
									class="btn btn-outline-primary btn-sm"><i
										class="bi bi-pencil-fill"></i> Edit</a>
								<form action="AdminDeleteCardServlet" method="post"
										class="d-inline" onsubmit="return confirm('Are you sure?');">
										<input type="hidden" name="cardId"
											value="<%=rsCards.getInt("id")%>">
										<button type="submit" class="btn btn-outline-danger btn-sm">
											<i class="bi bi-trash-fill"></i> Delete
										</button>
									</form></td>
							</tr>
							<%
							}
							} catch (Exception e) {
							out.println("<tr><td colspan='5' class='text-danger'>Error fetching cards!</td></tr>");
							}
							%>
						</tbody>
					</table>
				</div>
			</div>

			<!-- Manage Users Section -->
			<div id="manage-users" class="admin-section mb-4">
				<h3 class="mb-4 fs-4 fw-semibold">
					<i class="bi bi-people-fill me-2"></i>Manage Users
				</h3>
				<div class="table-responsive">
					<table class="table table-hover align-middle">
						<thead class="table-light">
							<tr>
								<th>User ID</th>
								<th>Name</th>
								<th>Email</th>
								<th>Current Plan</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							try {
								String userQuery = "SELECT u.id, u.username, u.email, (SELECT plan FROM payments WHERE user_id = u.id ORDER BY payment_date DESC LIMIT 1) AS plan FROM users u";
								PreparedStatement psUsers = con.prepareStatement(userQuery);
								ResultSet rsUsers = psUsers.executeQuery();
								while (rsUsers.next()) {
							%>
							<tr>
								<td><%=rsUsers.getInt("id")%></td>
								<td><%=rsUsers.getString("username")%></td>
								<td><%=rsUsers.getString("email")%></td>
								<td><span
									class="badge bg-primary-subtle text-primary-emphasis rounded-pill"><%=(rsUsers.getString("plan") != null ? rsUsers.getString("plan") : "Free")%></span></td>
								<td><form action="DeleteUserServlet" method="post"
										class="d-inline" onsubmit="return confirm('Are you sure?');">
										<input type="hidden" name="userId"
											value="<%=rsUsers.getInt("id")%>">
										<button type="submit" class="btn btn-outline-danger btn-sm">
											<i class="bi bi-trash-fill"></i>
										</button>
									</form>
									<form action="BlockUserServlet" method="post" class="d-inline">
										<input type="hidden" name="userId"
											value="<%=rsUsers.getInt("id")%>">
										<button type="submit" class="btn btn-outline-warning btn-sm">
											<i class="bi bi-slash-circle-fill"></i>
										</button>
									</form></td>
							</tr>
							<%
							}
							} catch (Exception e) {
							out.println("<tr><td colspan='5' class='text-danger'>Error fetching users!</td></tr>");
							}
							%>
						</tbody>
					</table>
				</div>
			</div>

			<!-- Payments Report Section -->
			<div id="payments-report" class="admin-section">
				<h3 class="mb-4 fs-4 fw-semibold">
					<i class="bi bi-credit-card-fill me-2"></i>Payments Report
				</h3>
				<div class="table-responsive">
					<table class="table table-hover align-middle">
						<thead class="table-light">
							<tr>
								<th>User ID</th>
								<th>User Name</th>
								<th>Plan</th>
								<th>Purchase Date</th>
							</tr>
						</thead>
						<tbody>
							<%
							try {
								String paymentQuery = "SELECT u.id, u.username, p.plan, p.payment_date FROM payments p JOIN users u ON p.user_id = u.id ORDER BY p.payment_date DESC";
								PreparedStatement psPayments = con.prepareStatement(paymentQuery);
								ResultSet rsPayments = psPayments.executeQuery();
								while (rsPayments.next()) {
							%>
							<tr>
								<td><%=rsPayments.getInt("id")%></td>
								<td><%=rsPayments.getString("username")%></td>
								<td><span
									class="badge bg-success-subtle text-success-emphasis rounded-pill"><%=rsPayments.getString("plan")%></span></td>
								<td><%=rsPayments.getTimestamp("payment_date")%></td>
							</tr>
							<%
							}
							} catch (Exception e) {
							out.println("<tr><td colspan='4' class='text-danger'>Error fetching payments!</td></tr>");
							} finally {
							if (con != null) {
							try {
								con.close();
							} catch (SQLException e) {
								e.printStackTrace();
							}
							}
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- Toast Notification Container -->
	<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 2100;">
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
	<script>
    // --- LOGIN & LOGOUT SCRIPT ---
    const loginForm = document.getElementById("adminLoginForm");
    const loginOverlay = document.getElementById("adminLoginOverlay");
    const loginError = document.getElementById("loginError");
    const adminContent = document.getElementById("adminContent");
    const logoutBtn = document.getElementById("adminLogoutBtn");

    loginForm.addEventListener("submit", function(e) {
        e.preventDefault();
        const username = document.getElementById("adminUsername").value.trim();
        const password = document.getElementById("adminPassword").value.trim();

        if (username === "Om Shinde" && password === "2979") {
            loginOverlay.style.display = "none";
            adminContent.style.filter = "none";
            adminContent.style.pointerEvents = "auto";
        } else {
            loginError.style.display = "block";
        }
    });

    logoutBtn.addEventListener("click", function(e) {
        e.preventDefault();
        if (confirm("Are you sure you want to logout?")) {
            <%session.invalidate();%>
            adminContent.style.filter = "blur(8px)";
            adminContent.style.pointerEvents = "none";
            loginOverlay.style.display = "flex";
            document.getElementById("adminUsername").value = "";
            document.getElementById("adminPassword").value = "";
            loginError.style.display = "none";
        }
    });

    // --- TOAST NOTIFICATION & SCROLLSPY SCRIPT ---
    document.addEventListener("DOMContentLoaded", function () {
        const params = new URLSearchParams(window.location.search);
        const status = params.get("status");
        if (status) {
            const toastEl = document.getElementById("toastMessage");
            const toastBody = document.getElementById("toastBody");
            let message = "";
            let bgColor = "";

            switch (status) {
                case "success": message = "✅ Operation successful!"; bgColor = "bg-success"; break;
                case "failed": message = "⚠️ Operation failed."; bgColor = "bg-warning"; break;
                case "error": message = "❌ An error occurred."; bgColor = "bg-danger"; break;
            }

            if (message) {
                toastBody.textContent = message;
                toastEl.className = 'toast align-items-center text-white border-0 ' + bgColor; 
                const toast = new bootstrap.Toast(toastEl, { delay: 4000 });
                toast.show();
                const url = new URL(window.location);
                url.searchParams.delete('status');
                window.history.replaceState({}, document.title, url);
            }
        }
        
        const scrollSpy = new bootstrap.ScrollSpy(document.body, {
            target: '#admin-nav',
            offset: 220
        });
    });
</script>

</body>
</html>
