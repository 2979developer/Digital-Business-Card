<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About - BizCard AI</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">

  <style>
    body { background: #f8f9fa; font-family: 'Segoe UI', sans-serif; }

    /* Hero */
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
      top: 0; left: 0; width: 100%; height: 100%;
      background: rgba(0,0,0,0.3);
    }
    .hero h1, .hero p, .hero a { position: relative; z-index: 1; }

    /* Section */
    .section { padding: 60px 20px; }
    .section h2 { font-weight: bold; margin-bottom: 20px; color: #333; }

    /* Feature-style cards */
    .highlight-card {
      border-radius: 12px;
      padding: 25px;
      background: white;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      transition: transform 0.3s ease;
      text-align: center;
    }
    .highlight-card:hover { transform: translateY(-5px); }
    .highlight-icon {
      font-size: 40px;
      color: #2575fc;
      margin-bottom: 15px;
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
      <a class="navbar-brand fw-bold" href="index.jsp">BizCard <span style="color:#4dd0e1;">AI</span></a>
    </div>
  </nav>

  <!-- Hero -->
  <div class="hero" data-aos="fade-down">
    <h1>About BizCard AI</h1>
    <p>Learn more about our mission and vision</p>
    <a href="index.jsp" class="btn btn-light btn-lg mt-3">← Back to Home</a>
  </div>

  <!-- Project Overview -->
  <section class="section container" data-aos="fade-up">
    <h2>Project Overview</h2>
    <p>
      BizCard AI is a platform to design, customize, and manage digital business cards. 
      With AI-powered suggestions, users can generate attractive designs in minutes. 
      The platform supports quick sharing, secure profiles, and professional templates 
      for businesses and individuals.
    </p>
  </section>

  <!-- Mission & Vision Highlights -->
  <section class="section bg-light">
    <div class="container">
      <h2 class="text-center mb-5" data-aos="fade-up">Our Mission & Vision</h2>
      <div class="row g-4">
        <div class="col-md-6" data-aos="fade-right">
          <div class="highlight-card">
            <i class="bi bi-bullseye highlight-icon"></i>
            <h5>Our Mission</h5>
            <p>To simplify digital networking by enabling professionals to 
               create, share, and manage digital business cards effortlessly.</p>
          </div>
        </div>
        <div class="col-md-6" data-aos="fade-left">
          <div class="highlight-card">
            <i class="bi bi-lightbulb highlight-icon"></i>
            <h5>Our Vision</h5>
            <p>To revolutionize professional networking through AI-powered tools, 
               ensuring every connection is impactful and lasting.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Why Choose Us -->
  <section class="section container">
    <h2 class="text-center mb-5" data-aos="zoom-in">Why Choose BizCard AI?</h2>
    <div class="row g-4">
      <div class="col-md-4" data-aos="fade-up">
        <div class="highlight-card">
          <i class="bi bi-magic highlight-icon"></i>
          <h6>AI-Powered Creativity</h6>
          <p>Generate smart, professional designs instantly.</p>
        </div>
      </div>
      <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
        <div class="highlight-card">
          <i class="bi bi-qr-code highlight-icon"></i>
          <h6>Quick Sharing</h6>
          <p>Share your card via QR, social media, or links.</p>
        </div>
      </div>
      <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
        <div class="highlight-card">
          <i class="bi bi-shield-lock highlight-icon"></i>
          <h6>Trusted Security</h6>
          <p>Keep your professional identity safe & secure.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="text-center">
    <p class="mb-0">© 2025 BizCard AI | <a href="features.jsp" class="text-white">Features</a> | <a href="#" class="text-white">Contact</a></p>
  </footer>

  <!-- JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
  <script>
    AOS.init({
      duration: 1000,
      once: true
    });
  </script>
</body>
</html>
