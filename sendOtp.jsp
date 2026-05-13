<%@ page import="java.sql.*,java.util.*,javax.mail.*,javax.mail.internet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
String user = (String) session.getAttribute("username");
String userEmail = (String) session.getAttribute("email");

if(user == null || userEmail == null){
    response.sendRedirect("../visiter/index.jsp");
    return;
}

String bnm   = request.getParameter("bnm");
String date  = request.getParameter("date");
String st    = request.getParameter("st");
String et    = request.getParameter("et");
String hu    = request.getParameter("hu");
String snm   = request.getParameter("snm");
String price = request.getParameter("price");

String otp = String.valueOf(100000 + new Random().nextInt(900000));

Connection con = null;

try{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/db?useSSL=false",
        "root",""
    );

    // ✅ SLOT CHECK (CHECK ALL BOOKINGS)
    String checkQuery = "SELECT * FROM f1 WHERE date=? AND snm=? AND (st < ? AND et > ?)";

    PreparedStatement checkPs = con.prepareStatement(checkQuery);
    checkPs.setString(1, date);
    checkPs.setString(2, snm);
    checkPs.setString(3, et);
    checkPs.setString(4, st);

    ResultSet rs = checkPs.executeQuery();

    if(rs.next()){
%>
        <script>
            alert("❌ This time slot is already booked!");
            window.location="booking.jsp";
        </script>
<%
        con.close();
        return;
    }

    // ✅ INSERT BOOKING (NO STATUS)
    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO f1 (bnm,date,st,et,hu,snm,price,otp) VALUES (?,?,?,?,?,?,?,?)"
    );

    ps.setString(1, bnm);
    ps.setString(2, date);
    ps.setString(3, st);
    ps.setString(4, et);
    ps.setString(5, hu);
    ps.setString(6, snm);
    ps.setString(7, price);
    ps.setString(8, otp);

    ps.executeUpdate();

    session.setAttribute("bookingOtp", otp);

    // ✅ SEND EMAIL
    final String fromEmail = "devagravat534@gmail.com";
    final String appPass   = "nxcrpbpjnyibnjcb";

    Properties props = new Properties();
    props.put("mail.smtp.auth","true");
    props.put("mail.smtp.starttls.enable","true");
    props.put("mail.smtp.host","smtp.gmail.com");
    props.put("mail.smtp.port","587");

    Session mailSession = Session.getInstance(props,
        new Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(fromEmail, appPass);
            }
        }
    );

    Message msg = new MimeMessage(mailSession);
    msg.setFrom(new InternetAddress(fromEmail));
    msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));
    msg.setSubject("OTP for PlayArena Booking");
    msg.setText("Your OTP is: " + otp);

    Transport.send(msg);

    con.close();
    response.sendRedirect("verifyBookingOtp.jsp");

}catch(Exception e){
    out.println("Error: " + e.getMessage());
}
%>
