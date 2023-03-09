<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="airplane.Messege" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
<link href="Style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div>

<div>
	<marquee scrollamount="30">
		<h1 class="head">Welcome To Airlines Reservation System</h1>
		</marquee>
	</div>
	</div>
	<div class="center" ><br>
	<div align=center>
		<h3>Please Enter Your <br> Username & Email-id..!!</h3>
		</div>
		<form  method="post" action="CheckUnameServlet" >
			<div class="txt_field" >
				<input type="text" name="forcheckuname" required> <span></span> <label>Username**</label>
			</div>
			
			<div class="txt_field">
				<input type="email" name="forcheckemail" required> <span></span> <label>Email-Id**</label>
			</div>
			
			<p>
			<% 
		Messege m1 = (Messege) session.getAttribute("msg");
		if(m1!=null){
		%> 
		<p class="alert alert- <%= m1.getCssClass()%> " role="alert" style="color:red; height:2px;">
		<%= m1.getContent() %>
		</p>
		<% } %>
		
		<%session.removeAttribute("msg");
		%>
			</p>
			<br><br>
			 <input  type="submit" value="Verify" >
			<br><br>
		</form>
		

		
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>