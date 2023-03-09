<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import=" java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ticket_Preview</title>
<link href="ticket.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="box">
  
  <div class="ticket">
    <span class="airline">Airline Reservation System</span>
    <span class="airline airlineslip">PASS</span>
    <span class="boarding"></span>
    <div class="content">
   
    <%
	try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/Airline", "root", "Chaitu");
	PreparedStatement p5 = connection.prepareStatement("SELECT * FROM ticketinfo;",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs5= p5.executeQuery();
	
	// here im used the last method to get the user name
	if(rs5.last()){
		String s=rs5.getString("flightno");
	
	PreparedStatement p = connection.prepareStatement("SELECT * FROM bookinginfo WHERE flightno=?;",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	p.setString(1, s);
	ResultSet rs= p.executeQuery();
	if(rs.last()){
	%>
      <span class="jfk"><%=rs.getString("Fromm") %></span>
      <span class="plane"><?xml version="1.0" ?><svg clip-rule="evenodd" fill-rule="evenodd" height="60" width="60" image-rendering="optimizeQuality" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg"><g stroke="#222"><line fill="none" stroke-linecap="round" stroke-width="30" x1="300" x2="55" y1="390" y2="390"/><path d="M98 325c-9 10 10 16 25 6l311-156c24-17 35-25 42-50 2-15-46-11-78-7-15 1-34 10-42 16l-56 35 1-1-169-31c-14-3-24-5-37-1-10 5-18 10-27 18l122 72c4 3 5 7 1 9l-44 27-75-15c-10-2-18-4-28 0-8 4-14 9-20 15l74 63z" fill="#222" stroke-linejoin="round" stroke-width="10"/></g></svg></span>
      <span class="sfo"><%=rs.getString("Too") %></span>
      
      <span class="jfk jfkslip"><%=rs.getString("Fromm") %></span>
      <span class="plane planeslip"><?xml version="1.0" ?><svg clip-rule="evenodd" fill-rule="evenodd" height="30" width="30" image-rendering="optimizeQuality" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg"><g stroke="#222"><line fill="none" stroke-linecap="round" stroke-width="30" x1="300" x2="55" y1="390" y2="390"/><path d="M98 325c-9 10 10 16 25 6l311-156c24-17 35-25 42-50 2-15-46-11-78-7-15 1-34 10-42 16l-56 35 1-1-169-31c-14-3-24-5-37-1-10 5-18 10-27 18l122 72c4 3 5 7 1 9l-44 27-75-15c-10-2-18-4-28 0-8 4-14 9-20 15l74 63z" fill="#222" stroke-linejoin="round" stroke-width="10"/></g></svg></span>
      <span class="sfo sfoslip"><%=rs.getString("Too") %></span>
      <%
	}
	PreparedStatement p1 = connection.prepareStatement("SELECT * FROM ticketinfo;",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs1= p1.executeQuery();
	if(rs1.last()){
      %>
      
      <div class="sub-content">
      
        <span class="watermark">Airline </span>
        <span class="name">PASSENGER NAME<br><span><%=rs1.getString("fullname") %></span></span>
        <span class="flight">FLIGHT NO&deg;<br><span><%=rs1.getString("flightno") %></span></span>
        <span class="gate">GATE NO <br><span><%   
        int min1 = 1;
  		int max1 = 5;
  		
  		int a1 = (int) ((Math.random() * (max1 - min1 + 1) + min1));
  		 %><%=a1 %></span></span>
        <span class="seat">SEAT NO <br><span><%   
        int min = 10;
  		int max = 99;
  		int x = 65; //65 -A 
  		int y = 70; //70 -F
  		int a = (int) ((Math.random() * (max - min + 1) + min));
  		char b = (char) ((Math.random() * (y - x + 1) + x)); %><%=a %><%=b %></span></span>
        <%
		String r=rs1.getString("flightno");
        PreparedStatement p3 = connection.prepareStatement("SELECT * FROM bookinginfo WHERE flightno=?;",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		p3.setString(1, r);
        ResultSet rs3= p3.executeQuery();
	if(rs3.last()){
        %>
        <span class="boardingtime">BOARDING TIME<br><span><%=rs3.getString("Datee") %>&nbsp;<%=rs3.getString("Flighttime") %></span></span>
              
         <span class="flight flightslip">FLIGHT NO&deg;<br><span><%=rs3.getString("flightno") %></span></span>
          <span class="seat seatslip">SEAT NO <br><span> <%=a %><%=b %></span></span>
          <%
	}}PreparedStatement p4 = connection.prepareStatement("SELECT * FROM ticketinfo;",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs4= p4.executeQuery();
	if(rs4.last()){
          %>
        
         <span class="name nameslip">PASSENGER NAME<br><span><%=rs4.getString("fullname") %></span></span>
         
         <%

}
	}


} catch (Exception e) {
e.printStackTrace();
}
%>
      </div>
    </div>
    <div class="barcode"></div>
    <div class="barcode slip"></div>
  </div>
</div>
<a href="LoginMainPage.jsp" style="color:red";>LOGOUT</a></b>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  
</body>
</html>