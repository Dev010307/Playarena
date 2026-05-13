<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.itextpdf.text.*" %>
<%@ page import="com.itextpdf.text.pdf.*" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%
int bookingId = Integer.parseInt(request.getParameter("id"));
String fileName = "Bill_" + bookingId + ".pdf";

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {

    String folderPath = application.getRealPath("/bills");
    File folder = new File(folderPath);
    if (!folder.exists()) folder.mkdirs();

    String fullPath = folderPath + File.separator + fileName;

    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/db","root",""
    );

    ps = con.prepareStatement("SELECT * FROM f1 WHERE id=?");
    ps.setInt(1, bookingId);
    rs = ps.executeQuery();

    if (rs.next()) {

        Document document = new Document(PageSize.A4);
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(fullPath));
        document.open();

        // ===== LIGHT BLUE PAGE BACKGROUND =====
        PdfContentByte canvas = writer.getDirectContentUnder();
        canvas.setColorFill(new BaseColor(220, 235, 255));
        canvas.rectangle(0, 0, PageSize.A4.getWidth(), PageSize.A4.getHeight());
        canvas.fill();

        // ===== COLORS =====
        BaseColor darkBlue = new BaseColor(30, 70, 160);
        BaseColor white = BaseColor.WHITE;

        // ===== FONTS =====
        Font titleFont = new Font(Font.FontFamily.HELVETICA, 24, Font.BOLD, darkBlue);
        Font labelFont = new Font(Font.FontFamily.HELVETICA, 13, Font.BOLD, darkBlue);
        Font valueFont = new Font(Font.FontFamily.HELVETICA, 13, Font.NORMAL, BaseColor.BLACK);

        // ===== TITLE =====
        Paragraph title = new Paragraph("PlayArena Booking Invoice", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        title.setSpacingAfter(30f);
        document.add(title);

        int hours = rs.getInt("hu");
        String priceStr = rs.getString("price").replaceAll("[^0-9]", "");
        int price = Integer.parseInt(priceStr);
        int total = price * hours;

        // ===== WHITE CARD TABLE =====
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(85);
        table.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.setSpacingBefore(10f);

        table.addCell(createCardCell("Name", labelFont));
        table.addCell(createCardCell(rs.getString("bnm"), valueFont));

        table.addCell(createCardCell("Date", labelFont));
        table.addCell(createCardCell(rs.getString("date"), valueFont));

        table.addCell(createCardCell("Start Time", labelFont));
        table.addCell(createCardCell(rs.getString("st"), valueFont));

        table.addCell(createCardCell("End Time", labelFont));
        table.addCell(createCardCell(rs.getString("et"), valueFont));

        table.addCell(createCardCell("Hours", labelFont));
        table.addCell(createCardCell(String.valueOf(hours), valueFont));

        table.addCell(createCardCell("Sport Name", labelFont));
        table.addCell(createCardCell(rs.getString("snm"), valueFont));

        table.addCell(createCardCell("Price per Hour", labelFont));
        table.addCell(createCardCell("Rs. " + price, valueFont));

        table.addCell(createCardCell("Total Bill", labelFont));
        table.addCell(createCardCell("Rs. " + total, valueFont));

        document.add(table);

        document.add(new Paragraph(" "));
        Paragraph footer = new Paragraph("Thank You For Choosing PlayArena!", valueFont);
        footer.setAlignment(Element.ALIGN_CENTER);
        footer.setSpacingBefore(25f);
        document.add(footer);

        document.close();
    }

    response.sendRedirect(request.getContextPath() + "/bills/" + fileName);

} catch (Exception e) {
    out.println("<script>alert('PDF Not Generated!');window.location='booking.jsp';</script>");
} finally {

    if(rs!=null) rs.close();
    if(ps!=null) ps.close();
    if(con!=null) con.close();
}
%>

<%! 
// ===== WHITE CARD CELL DESIGN =====
public PdfPCell createCardCell(String text, Font font) {
    PdfPCell cell = new PdfPCell(new Phrase(text, font));
    cell.setBackgroundColor(BaseColor.WHITE);
    cell.setBorderColor(new BaseColor(200, 220, 255));
    cell.setPadding(10);
    return cell;
}
%>
