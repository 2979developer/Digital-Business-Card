<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Features - BizCard AI</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">

  <style>
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f8f9fa;
    }
    .hero {
        background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
        color: white;
        padding: 80px 20px;
        text-align: center;
        border-radius: 0 0 25px 25px;
    }
    .hero h1 { font-weight: 700; }
    
    /* New Feature Section Styling */
    .feature-section {
        padding: 80px 0;
        overflow: hidden;
    }
    .feature-section:nth-of-type(odd) { /* Alternating background color */
        background-color: #fff;
    }
    .feature-content h2 {
        font-weight: 600;
        color: #333;
    }
    .feature-content .lead {
        color: #6c757d;
    }
    .feature-list li {
        margin-bottom: 0.75rem;
    }
    .feature-list i {
        color: #0d6efd;
    }
    .feature-image img {
        border-radius: 20px;
        box-shadow: 0 15px 40px rgba(0,0,0,0.12);
    }
    
    /* Call to Action Section */
    .cta-section {
        padding: 80px 20px;
        background: linear-gradient(135deg, #2575fc, #6a11cb);
        color: white;
        text-align: center;
        border-radius: 20px;
    }
    .cta-section h2 { font-weight: 700; }
    .cta-section .btn-light {
        font-weight: 600;
        padding: 12px 30px;
        border-radius: 50px;
        transition: transform 0.3s;
    }
    .cta-section .btn-light:hover {
        transform: scale(1.05);
    }
    
    /* Footer */
    .footer {
        background-color: #212529;
        color: white;
        padding: 40px 0;
    }
    .footer a {
        color: rgba(255, 255, 255, 0.7);
        text-decoration: none;
    }
    .footer a:hover {
        color: #fff;
    }
    
    /* Responsive Adjustments */
    @media (max-width: 767.98px) {
        .hero { padding: 60px 20px; }
        .feature-section { text-align: center; }
        .feature-content { margin-bottom: 2rem; }
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container">
      <a class="navbar-brand fw-bold" href="index.jsp">BizCard <span style="color:#4dd0e1;">AI</span></a>
       <a href="index.jsp" class="btn btn-outline-light btn-sm ms-auto">← Back to Home</a>
    </div>
  </nav>

  <!-- Hero Section -->
  <div class="hero" data-aos="fade-down">
    <h1 class="display-4">Unlock Your Potential</h1>
    <p class="lead">Explore the powerful tools that make BizCard AI the ultimate digital business card solution.</p>
  </div>
 
  <!-- Feature 1 -->
  <section class="feature-section">
    <div class="container">
        <div class="row align-items-center g-5">
            <div class="col-lg-6" data-aos="fade-right">
                <div class="feature-content">
                    <h2 class="display-5 mb-3">AI Design Suggestions</h2>
                    <p class="lead">Don't guess what looks good. Our intelligent AI analyzes your information and suggests stunning, professional layouts, color schemes, and font pairings to ensure your card is always impressive.</p>
                </div>
            </div>
            <div class="col-lg-6" data-aos="fade-left">
                <div class="feature-image">
                    <img src="https://placehold.co/600x400/E8F5FF/0d6efd?text=AI+Suggestions" class="img-fluid" alt="AI Design Feature">
                </div>
            </div>
        </div>
    </div>
  </section>

  <!-- Feature 2 -->
  <section class="feature-section">
    <div class="container">
        <div class="row align-items-center g-5">
            <div class="col-lg-6 order-lg-2" data-aos="fade-left">
                 <div class="feature-content">
                    <h2 class="display-5 mb-3">Customizable Templates</h2>
                    <p class="lead">Start with dozens of pre-designed, modern templates and personalize every detail. Change colors, fonts, and layouts to perfectly match your personal or corporate brand identity.</p>
                </div>
            </div>
            <div class="col-lg-6 order-lg-1" data-aos="fade-right">
                <div class="feature-image">
                     <img src="https://placehold.co/600x400/E6F9F1/198754?text=Templates" class="img-fluid" alt="Templates Feature">
                </div>
            </div>
        </div>
    </div>
  </section>

  <!-- Feature 3 -->
  <section class="feature-section">
    <div class="container">
        <div class="row align-items-center g-5">
            <div class="col-lg-6" data-aos="fade-right">
                <div class="feature-content">
                    <h2 class="display-5 mb-3">Instant QR Sharing</h2>
                    <p class="lead">Networking has never been faster. Share your card instantly with a dynamic QR code. A simple scan is all it takes for someone to save your contact details directly to their phone.</p>
                </div>
            </div>
            <div class="col-lg-6" data-aos="fade-left">
                <div class="feature-image">
                    <img src="https://placehold.co/600x400/FFF8E1/ffc107?text=QR+Code" class="img-fluid" alt="QR Code Feature">
                </div>
            </div>
        </div>
    </div>
  </section>

  <!-- Feature 4 -->
  <section class="feature-section">
    <div class="container">
        <div class="row align-items-center g-5">
            <div class="col-lg-6 order-lg-2" data-aos="fade-left">
                 <div class="feature-content">
                    <h2 class="display-5 mb-3">Powerful Analytics</h2>
                    <p class="lead">Gain valuable insights. Our built-in analytics dashboard lets you track how many times your card is viewed and how many people save your contact, helping you measure your networking impact.</p>
                </div>
            </div>
            <div class="col-lg-6 order-lg-1" data-aos="fade-right">
                <div class="feature-image">
                     <img src="https://placehold.co/600x400/FEF2F2/dc3545?text=Analytics" class="img-fluid" alt="Analytics Feature">
                </div>
            </div>
        </div>
    </div>
  </section>

  <!-- Call to Action -->
  <div class="container my-5" data-aos="zoom-in">
    <div class="cta-section">
        <h2 class="mb-4">Ready to Create Your Digital Identity?</h2>
        <a href="index.jsp" class="btn btn-light btn-lg">Get Started Now</a>
    </div>
  </div>

  <!-- Footer -->
  <footer class="footer">
    <div class="container text-center">
        <p class="mb-0 py-3">© 2025 BizCard AI | <a href="About.jsp">About</a> | <a href="contact.jsp">Contact</a></p>
    </div>
  </footer>

  <!-- JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
  <script>
    AOS.init({
      duration: 800,
      once: true
    });
  </script>
</body>
</html>
