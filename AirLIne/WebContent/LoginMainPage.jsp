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
<title>Login Page</title>
<link href="Style.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"  >
 
</head>
<body>

	<div>
	<marquee scrollamount="30">
		<h1 class="head">Welcome To Airlines Reservation System</h1>
		</marquee>
	</div>
	<div class="center" >
		<h1>Login</h1>
		
		<form  method="post" action="LoginServlet" >
			<div class="txt_field" >
				<input type="text" name="fusername"required> <span></span> <label>Username</label>
			</div>
			
			<div class="txt_field">
				<input type="password" name="fpassword"required> <span></span> <label>Password</label>
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
		
		<%session.removeAttribute("msg");//after that i close the session
		%>
			</p>
			<!-- for forgot password -->
			<div class="pass"><a href="http://localhost:8080/AirLIne/ForgotPass1.jsp">Forgot Password?</a></div>
			 <input  type="submit" value="Login" >
			<div class="signup_link">
				Not a member? <a
					href="http://localhost:8080/AirLIne/RegMainPage.jsp">Register</a>
			</div>
		</form>
		

		
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>