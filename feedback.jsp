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
<title>PlayArena | Feedback</title>
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
    <h1>Feedback PlayArena</h1>
    <p>PlayArena offers exciting sports and fun activities for all age groups in a safe and friendly environment.
Your feedback helps us improve our services and give you a better experience every time.</p>
  </div>
</section>
<!-- ===== FEEDBACK FORM ===== -->
<section class="section">
<div class="container" style="margin-top:10px;">
  <div class="row justify-content-center">
    <div class="col-md-6">

      <div class="feedback-card">
        <form action="fd.jsp" method="post">

          <div class="mb-3">
            <label>Your Name</label>
            <input type="text" name="nm" class="form-control" required>
          </div>

          <div class="mb-3">
            <label>Email Address</label>
            <input type="email" name="email" class="form-control" required>
          </div>

          <div class="mb-3">
            <label>Rating</label>
            <select name="ros" class="form-select" required>
              <option value="">-- Select Rating --</option>
              <option>Excellent</option>
              <option>Very Good</option>
              <option>Good</option>
              <option>Average</option>
              <option>Poor</option>
            </select>
          </div>

          <div class="mb-4">
            <label>Your Feedback</label>
            <textarea name="com" class="form-control" rows="4" required></textarea>
          </div>

          <button type="submit" class="btn btn-feedback w-100 text-white">
            Submit Feedback
          </button>

        </form>
      </div>

    </div>
  </div>
</div>
</section>
<!-- ===== FOOTER ===== -->
<jsp:include page="../visiter/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
