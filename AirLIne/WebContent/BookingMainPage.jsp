<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
<link href="Style.css" rel="stylesheet" type="text/css">
</head>
<body>


<div>
	<marquee scrollamount="30">
		<h1 class="head">Welcome To Airlines Reservation System</h1>
		</marquee>
	</div>
	<div class="middle">
		<div class="center">
			<h1>Flight Availability</h1>

			<form method="get" action="BookingServlet">
				<label>From :</label>
				<div>


					<select class="length" id="country" name="fcname">
						<option>Mumbai</option>
						<option>Chennai</option>
						<option>Pune</option>
						<option>Nasik</option>
						<option>Banglore</option>

					</select> <span></span>
				</div>
				<label>To:</label>
				<div>
					<select class="length" id="country" name="dcname"> 
					    <option>Mumbai</option>
						<option>Chennai</option>
						<option>Pune</option>
						<option>Nasik</option>
						<option>Banglore</option> </select> <br>
					<span></span>
				</div>
				<label>Departure Date :</label>
				<div>
					<input class="length" type="text" placeholder="Departure Date : "
						name="ddate"  value="01-01-2023" required><br> <span></span>
				</div>
				<label>Returning Date:</label>
				 <div>
					<input class="length" type="date" placeholder="Returning Date :"
						name="rdate" required><br> <span></span>
				 </div>
				<label>No Of Adults :</label>
				<div>
					<select class="length" id="country" name="acname">
						<option>Adults</option>

						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
					</select> <br> <span></span>
				</div>


				<label>No Of Child :</label>

				<div>
					<select class="length" id="country" name="ccname">
						<option>Children</option>
						<option>0</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option value="AF">9</option>

					</select> <br><span></span>
				</div>
				<label>Select Class :</label>
				<div>
					<select class="length" id="country" name="classname">
						<option>Economy</option>
						<option>Executive</option>
						<option>First</option>

					</select> <br> <br>
				</div>


				<br> <br>
				<input type="submit" value="Search"><br> <br>



			</form>
		</div>
	</div>

<a href="LoginMainPage.jsp" align="right" style="color:red";>LOGOUT</a></b>
</body>
</html>