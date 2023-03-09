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
<style  type="body{background: #cccccc}.rounded{border-radius: 1rem}.nav-pills .nav-link{color: #555}.nav-pills .nav-link.active{color: white}input[type="radio"]{margin-right: 5px}.bold{font-weight:bold}"></style>
<meta charset="UTF-8">
<title>Payment_Info</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" rel="stylesheet">
</head>
<body>
<div class="container py-5">
    <div class="row mb-4">
        <div class="col-lg-8 mx-auto text-center">
            <h1 class="display-6">Payment Forms</h1>
        </div>
    </div> <!-- End -->
    <div class="row">
        <div class="col-lg-6 mx-auto">
            <div class="card ">
                <div class="card-header">
                    <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">
                        <!-- Credit card form tabs -->
                        <ul role="tablist" class="nav bg-light nav-pills rounded nav-fill mb-3">
                            <li class="nav-item"> <a data-toggle="pill" href="#credit-card" class="nav-link active "> <i class="fas fa-credit-card mr-2"></i> Credit/Debit Card </a> </li>
                        
                        </ul>
                    </div> <!-- End -->
                    <!-- Credit card form content -->
                    <div class="tab-content">
                        <!-- credit card info-->
                        <div id="credit-card" class="tab-pane fade show active pt-3">
                            <form   action="LoadingPage.jsp"  >
                                <div class="form-group"> <label for="username">
                                        <h6>Card Owner</h6>
                                    </label> <input type="text" name="username" placeholder="Card Owner Name" required class="form-control "> </div>
                                <div class="form-group"> <label for="cardNumber">
                                        <h6>Card number</h6>
                                    </label>
                                    <div class="input-group"> <input type="number" name="cardNumber" placeholder="Valid card number" class="form-control " required>
                                        <div class="input-group-append"> <span class="input-group-text text-muted"> <i class="fab fa-cc-visa mx-1"></i> <i class="fab fa-cc-mastercard mx-1"></i> <i class="fab fa-cc-amex mx-1"></i> </span> </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-8">
                                        <div class="form-group"> <label><span class="hidden-xs">
                                                    <h6>Expiration Date</h6>
                                                </span></label>
                                            <div class="input-group"> <input type="number" placeholder="MM" name="" class="form-control" required> <input type="number" placeholder="YY" name="" class="form-control" required> </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group mb-4"> <label data-toggle="tooltip" title="Three digit CV code on the back of your card">
                                                <h6>CVV <i class="fa fa-question-circle d-inline"></i></h6>
                                            </label> <input type="number" min="100" max="999" required class="form-control"> </div>
                                    </div>
                                </div>
    <%
	try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/AirLine", "root", "Chaitu");
	PreparedStatement p = connection.prepareStatement("SELECT * FROM ticketinfo;",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs= p.executeQuery();
	if(rs.last()){ 
		
	String s=rs.getString("flightno");
	PreparedStatement p1 = connection.prepareStatement("SELECT * FROM bookinginfo WHERE flightno=?;",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	p1.setString(1, s);
	ResultSet rs1= p1.executeQuery();
	if(rs1.last()){%>
	
	
	
                                 <div class="col-sm-4">
                                        <div class="form-group mb-4"> <label data-toggle="tooltip" title="Three digit CV code on the back of your card">
                                                <h6>AMOUNT <i class="fa fa-question-circle d-inline"></i></h6>
                                            </label> <h6>  <%=rs1.getString("price") %></h6> </div>
                                    </div>
                                   <% 
	}}} catch (Exception e) {
		e.printStackTrace();
	}
                                   %>
                                </div>
                                
                                
                                
                                <center><div class="card-footer"> <input type="submit" value="Confirm Payment"  >
                            </form>
                        </div></center>
                    </div> <!-- End -->
                   
                       
                        
                    </div> <!-- End -->
                    <!-- End -->
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">$(function() {
    	  $('[data-toggle="tooltip"]').tooltip()
    })</script>

   

</body>
</html>