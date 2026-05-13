<%@ page import="java.sql.*,javax.mail.*,javax.mail.internet.*,java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
/* ---------------- SESSION CHECK ---------------- */
String userEmail = (String) session.getAttribute("email");
if (userEmail == null) {
    response.sendRedirect("../visiter/index.jsp");
    return;
}

/* ---------------- GET OTP ---------------- */
String otp = request.getParameter("otp");
if (otp == null || otp.length() != 6) {
%>
<script>
alert("Invalid OTP!");
history.back();
</script>
<%
return;
}

/* ---------------- DB CONNECTION ---------------- */
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/db?useSSL=false&allowPublicKeyRetrieval=true",
    "root",""
);

/* ---------------- VERIFY OTP + FETCH BOOKING DATA ---------------- */
PreparedStatement ps = con.prepareStatement(
    "SELECT * FROM f1"
);

ResultSet rs = ps.executeQuery();

if (!rs.next()) {
%>
<script>
alert("Invalid or Expired OTP!");
history.back();
</script>
<%
con.close();
return;
}

/* ---------------- GET DATA FROM DATABASE ---------------- */
int bookingId = rs.getInt("id");

String bnm   = rs.getString("bnm");
String date  = rs.getString("date");
String st    = rs.getString("st");
String et    = rs.getString("et");
String hu    = rs.getString("hu");
String snm   = rs.getString("snm");
String price = rs.getString("price");

/* ---------------- SEND CONFIRMATION EMAIL ---------------- */
final String fromEmail = "devagravat534@gmail.com";
final String appPass   = "nxcrpbpjnyibnjcb";

Properties props = new Properties();
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.host", "smtp.gmail.com");
props.put("mail.smtp.port", "587");

Session mailSession = Session.getInstance(props,
    new Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(fromEmail, appPass);
        }
    }
);

Message message = new MimeMessage(mailSession);
message.setFrom(new InternetAddress(fromEmail));
message.setRecipients(
    Message.RecipientType.TO,
    InternetAddress.parse(userEmail)
);
message.setSubject("Booking Confirmed | PlayArena");

/* -------- EMAIL BODY -------- */
String body =
"Hello " + bnm + ",\n\n" +
"Your booking is CONFIRMED!\n\n" +
"Booking Details:\n" +
"Sport : " + snm + "\n" +
"Date  : " + date + "\n" +
"Time  : " + st + " to " + et + "\n" +
"Hours : " + hu + "\n" +
"Price : " + price + "\n\n" +
"Thank you for choosing PlayArena.\n" +
"Enjoy your game!\n\n" +
"— PlayArena Team";

message.setContent(body, "text/plain; charset=UTF-8");

Transport.send(message);

/* ---------------- CLEANUP ---------------- */
rs.close();
ps.close();
con.close();

/* ---------------- REDIRECT ---------------- */
response.sendRedirect("index.jsp");
%>