<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PlayArena | Forgot Password</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="style.css"/>
<link rel="stylesheet" href="style.css"/>
</head>

<body>

<jsp:include page="head.jsp" />

<!-- ===== FORGOT PASSWORD FORM ===== -->
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-5 col-lg-4">

      <div class="forgot-card">
        <h3 class="text-center mb-3">OTP Send</h3>
        <form action="very.jsp" method="post">
          <div class="mb-3">
            <input type="hidden" name="email" value="<%= request.getParameter("email") %>">
            <label class="form-label">Enter OTP</label>
            <input type="number" name="otp"  class="form-control" required>
          </div>

          <button type="submit" class="btn btn-forgot w-100 text-white">
            Send otp
          </button>
        </form>

        <div class="text-center mt-4">
          <a href="login.jsp" class="auth-link">Back to Login</a>
        </div>

      </div>

    </div>
  </div>
</div>

<!-- ===== FOOTER ===== -->

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

