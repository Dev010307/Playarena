<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
 <head>
      <meta charset="UTF-8">
      <title>PlayArena | Services</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">

      <!-- Bootstrap -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

      <!-- Google Font -->
      <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">

      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
      <link rel="stylesheet" href="../visiter/style.css" />
    </head>

<body>

<jsp:include page="head.jsp" />
<!-- ===== PAGE HEADER ===== -->
<section class="page-header">
  <div class="container">
    <h1>Sports Management Services</h1>
    <p class="mt-3">
     Smart solutions to manage bookings, players, facilities, and events efficiently on PlayArena.
    </p>
  </div>
</section>

<!-- ===== SERVICES ===== -->
<section class="section">
      <section class="py-5 bg-light">
        <div class="container">

          <div class="row g-4">
            <div class="col-md-6 col-lg-4">
              <div class="card service-card h-100 shadow-sm border-0">
                <div class="card-body text-center">
                  <div class="mb-3">
                    <i class="bi bi-calendar-check fs-1 text-primary"></i>
                  </div>
                  <h5 class="fw-semibold">Online Slot Booking</h5>
                  <p class="text-muted">
                    Users can easily check availability and book sports facilities in real-time.
                  </p>
                </div>
              </div>
            </div>

            <div class="col-md-6 col-lg-4">
              <div class="card service-card h-100 shadow-sm border-0">
                <div class="card-body text-center">
                  <div class="mb-3">
                    <i class="bi bi-people fs-1 text-success"></i>
                  </div>
                  <h5 class="fw-semibold">Player Management</h5>
                  <p class="text-muted">
                    Maintain player profiles, participation history, and performance records.
                  </p>
                </div>
              </div>
            </div>

            <div class="col-md-6 col-lg-4">
              <div class="card service-card h-100 shadow-sm border-0">
                <div class="card-body text-center">
                  <div class="mb-3">
                    <i class="bi bi-trophy fs-1 text-warning"></i>
                  </div>
                  <h5 class="fw-semibold">Tournament Hosting</h5>
                  <p class="text-muted">
                    Organize and manage tournaments with automated scheduling and results.
                  </p>
                </div>
              </div>
            </div>

            <div class="col-md-6 col-lg-4">
              <div class="card service-card h-100 shadow-sm border-0">
                <div class="card-body text-center">
                  <div class="mb-3">
                    <i class="bi bi-building fs-1 text-danger"></i>
                  </div>
                  <h5 class="fw-semibold">Facility Management</h5>
                  <p class="text-muted">
                    Manage courts, grounds, and indoor arenas with smart availability tracking.
                  </p>
                </div>
              </div>
            </div>

            <div class="col-md-6 col-lg-4">
              <div class="card service-card h-100 shadow-sm border-0">
                <div class="card-body text-center">
                  <div class="mb-3">
                    <i class="bi bi-credit-card fs-1 text-info"></i>
                  </div>
                  <h5 class="fw-semibold">Membership & Subscription</h5>
                  <p class="text-muted">
                    Offer monthly and yearly membership plans with exclusive benefits and priority bookings.
                  </p>
                </div>
              </div>
            </div>

            <div class="col-md-6 col-lg-4">
              <div class="card service-card h-100 shadow-sm border-0">
                <div class="card-body text-center">
                  <div class="mb-3">
                    <i class="bi bi-bar-chart fs-1 text-dark"></i>
                  </div>
                  <h5 class="fw-semibold">Analytics & Reports</h5>
                  <p class="text-muted">
                    Get insights on bookings, revenue, and user activity with smart reports.
                  </p>
                </div>
              </div>
            </div>

          </div>
        </div>
      </section>
</section>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
