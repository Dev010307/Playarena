<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user = (String) session.getAttribute("username");

    if (user == null) {
        response.sendRedirect("../visiter/index.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PlayArena | About Us</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../visiter/style.css"/>
</head>

<body>

<jsp:include page="head.jsp" />
<!-- ===== PAGE HEADER ===== -->
<section class="page-header">
  <div class="container">
    <h1>About PlayArena</h1>
    <p class="mt-3">
      PlayArena is a modern sports facility booking platform built to simplify
      how players and facility owners connect and manage sports activities.
    </p>
  </div>
</section>

<!-- ===== ABOUT CONTENT ===== -->
<section class="section">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-10">
        <div class="about-card">

          <h4>Who We Are</h4>
          <p>
            PlayArena was created to solve common problems faced in sports
            facility booking such as manual scheduling, double bookings,
            and lack of transparency. Our platform focuses on simplicity
            and operational clarity.
          </p>

          <h4 class="mt-4">Our Mission</h4>
          <p>
            Our mission is to provide a reliable and easy-to-use booking
            system that helps players book sports facilities quickly
            while enabling owners to manage operations efficiently.
          </p>

          <h4 class="mt-4">Our Vision</h4>
          <p>
            We envision a connected sports ecosystem where booking,
            scheduling, and facility management are seamless,
            scalable, and accessible to everyone.
          </p>

        </div>
      </div>
    </div>
  </div>
</section>

<jsp:include page="../visiter/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
