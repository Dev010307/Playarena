<%
String currentPage = request.getServletPath();
%>

<nav class="navbar navbar-expand-lg fixed-top">
<div class="container">
<a class="navbar-brand" href="index.jsp">PlayArena</a>

<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu">
<span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse" id="menu">
<ul class="navbar-nav ms-auto">

<li class="nav-item">
    <a class="nav-link <%= currentPage.endsWith("index.jsp") ? "active" : "" %>" href="index.jsp">Home</a>
</li>

<li class="nav-item">
    <a class="nav-link <%= 
        (currentPage.endsWith("sports.jsp") || 
         currentPage.endsWith("booking.jsp") || 
         currentPage.endsWith("bookingForm.jsp")) 
         ? "active" : "" %>" 
       href="sports.jsp">Booking</a>
</li>

<li class="nav-item">
    <a class="nav-link <%= currentPage.endsWith("services.jsp") ? "active" : "" %>" href="services.jsp">Services</a>
</li>

<li class="nav-item">
    <a class="nav-link <%= currentPage.endsWith("about.jsp") ? "active" : "" %>" href="about.jsp">About Us</a>
</li>

<li class="nav-item">
    <a class="nav-link <%= currentPage.endsWith("contact.jsp") ? "active" : "" %>" href="contact.jsp">Contact Us</a>
</li>

<li class="nav-item">
    <a class="nav-link <%= currentPage.endsWith("feedback.jsp") ? "active" : "" %>" href="feedback.jsp">Feedback</a>
</li>

<li class="nav-item">
    <a class="nav-link <%= currentPage.endsWith("logout.jsp") ? "active" : "" %>" href="logout.jsp">Logout</a>
</li>

</ul>
</div>
</div>
</nav>
