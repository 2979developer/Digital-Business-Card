<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.org.Card"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Cards | AI Business Card Creator</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>
body {
  font-family: 'Poppins', sans-serif;
  background-color: #f0f2f5;
}

/* Fade-in animation */
@keyframes fadeInUp {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

.card-wrapper {
  animation: fadeInUp 0.6s ease-out forwards;
  opacity: 0;
}

/* Card design */
.card-custom {
  border: none;
  border-radius: 20px;
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  color: white;
  padding: 30px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  position: relative;
  overflow: hidden;
  height: 100%;
}

.card-custom:hover {
  transform: translateY(-8px);
  box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
}

.gradient-1 { background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%); }
.gradient-2 { background: linear-gradient(135deg, #ff6a88 0%, #ff99ac 100%); }
.gradient-3 { background: linear-gradient(135deg, #2E3192 0%, #1BFFFF 100%); }
.gradient-4 { background: linear-gradient(135deg, #c471f5 0%, #fa71cd 100%); }

.card-icon {
  position: absolute;
  top: -20px;
  right: -20px;
  font-size: 100px;
  color: rgba(255, 255, 255, 0.1);
  transform: rotate(20deg);
}

.card-actions {
  margin-top: 20px;
  display: flex;
  gap: 10px;
}

.btn-edit, .btn-delete {
  border: none;
  border-radius: 10px;
  padding: 10px 20px;
  font-weight: 600;
  transition: background-color 0.3s, transform 0.2s;
}

.btn-edit {
  background-color: rgba(255, 255, 255, 0.9);
  color: #333;
}

.btn-edit:hover {
  background-color: white;
  transform: scale(1.05);
  color: black;
}

.btn-delete {
  background-color: rgba(255, 255, 255, 0.2);
  color: white;
}

.btn-delete:hover {
  background-color: rgba(255, 255, 255, 0.35);
  transform: scale(1.05);
}

/* Search bar styling */
.search-bar {
  max-width: 400px;
  margin: 0 auto 30px;
}

.search-bar input {
  border-radius: 30px;
  padding: 12px 20px;
  border: 1px solid #ccc;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

.search-bar input:focus {
  border-color: #6a11cb;
  box-shadow: 0 0 5px rgba(106, 17, 203, 0.2);
}
</style>
</head>

<body>
  <div class="container my-5">
    <div class="text-center mb-4">
      <h2 class="fw-bold">My Digital Business Cards</h2>
      <p class="text-muted">Search and manage your beautifully designed cards.</p>
    </div>

    <!-- 🔍 Search Bar -->
    <div class="search-bar text-center mb-5">
      <input type="text" id="searchInput" class="form-control" placeholder="Search by name, email, or title...">
    </div>

    <!-- 🧩 Card Grid -->
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4" id="cardContainer">
      <%
      List<Card> cards = (List<Card>) request.getAttribute("cards");
      if (cards != null && !cards.isEmpty()) {
        int i = 0;
        for (Card c : cards) {
          i++;
      %>
      <div class="col card-wrapper">
        <div class="card-custom gradient-<%=(i % 4) + 1%>" 
             data-name="<%=c.getFullName()%>" 
             data-title="<%=c.getJobTitle()%>" 
             data-email="<%=c.getEmail()%>">
          <i class="fas fa-address-card card-icon"></i>
          <div class="card-text-shadow">
            <h3><%= c.getFullName() %></h3>
            <h5><%= c.getJobTitle() %></h5>
            <p><i class="fas fa-envelope fa-fw me-2"></i><%= c.getEmail() %></p>
            <p><i class="fas fa-phone fa-fw me-2"></i><%= c.getPhone() %></p>
            <p><i class="fas fa-globe fa-fw me-2"></i><%= c.getWebsite() %></p>
          </div>
          <div class="card-actions">
            <a href="EditCardServlet?id=<%=c.getId()%>" class="btn btn-edit">Edit</a>
            <a href="DeleteCardServlet?id=<%=c.getId()%>" class="btn btn-delete">Delete</a>
          </div>
        </div>
      </div>
      <% } } else { %>
        <p class="text-center text-muted">
          You don’t have any cards yet. <a href="createCard.jsp">Create one now</a>.
        </p>
      <% } %>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  <!-- 🔍 Live Search Script -->
  <script>
    const searchInput = document.getElementById('searchInput');
    const cards = document.querySelectorAll('#cardContainer .card-custom');

    searchInput.addEventListener('keyup', function() {
      const filter = this.value.toLowerCase();
      cards.forEach(card => {
        const name = card.dataset.name.toLowerCase();
        const title = card.dataset.title.toLowerCase();
        const email = card.dataset.email.toLowerCase();
        if (name.includes(filter) || title.includes(filter) || email.includes(filter)) {
          card.parentElement.style.display = '';
        } else {
          card.parentElement.style.display = 'none';
        }
      });
    });
  </script>
</body>
</html>
