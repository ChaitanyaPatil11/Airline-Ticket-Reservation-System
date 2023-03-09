package airplane;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	
  
    public BookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fcname=request.getParameter("fcname");					//1
		String dcname=request.getParameter("dcname");					//2
		String ddate=request.getParameter("ddate");						//3
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		out.println("<html><head><title>Flight_Information</title> </head><body><center>"); 
		out.println("<div><div><h1 style= 'color:red;font-size:40px; ' align=center > Flight Information </h1></div></div>");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/Airline", "root", "Chaitu");
		    PreparedStatement stmt=con.prepareStatement("SELECT * FROM  bookinginfo WHERE Fromm=? and Too=? and Datee=? ");
		    stmt.setString(1, fcname);
		    stmt.setString(2, dcname);
		    stmt.setString(3, ddate);
		    
		    ResultSet rs = stmt.executeQuery();
		  
		    out.println("<style> .button5 { background-color: white;color: black;border: 2px solid black;} .button5:hover{ background-color:#979A9A; color: black;}  table {max-width: 100%;} .contentclass{opacity :0.9;}  tr:nth-child(odd) { background-color: #e0ebeb; } tr:nth-child(even) { background-color:#f0f5f5; } th{ background-color: #000000; color: white;font-size:25px} th,td { text-align: center;padding: 0.5em 1em; } .tableclass{ display:flex ;  justify-content : center;   align-items : center; } body { background-image: url('flight12.jpg'); background-position: center;\r\n" + 
		    		"  background-repeat: no-repeat;\r\n" + 
		    		"  background-size: cover;}</style>");
		    out.println("<table  width=100% height=70% class='tableclass' >");
		    out.println("<tr><th>Airline Name</th><th>Flight No</th><th>From</th><th>To</th><th>Date</th><th>Seats</th><th>Fare Per Seat(INR)</th><th>Time</th><th>Booking Option</th></tr>");
		   
		    while (rs.next()) 
            {  
                String n1 = rs.getString("AirLine_name");  
                int n2 = rs.getInt("flightno");  
                String n3 = rs.getString("Fromm");
                String n4 = rs.getString("Too");
                String n5 = rs.getString("Datee");
                int n6 = rs.getInt("seats");
                float n7 = rs.getInt("price");
                String n8 = rs.getString("Flighttime");
                
                out.println("<tr class='contentclass'><td>" + n1 + "</td><td>" + n2 + "</td><td>" + n3 + "</td><td>" + n4 +  "</td><td>" + n5 +  "</td><td>" + n6 +  "</td><td>" + n7 +  "</td><td>" + n8 + "</td> <td>"+"<a href='http://localhost:8080/AirLIne/FlightAvailability.jsp' ><input  type='Submit' value='Book Now' name='booking1' class='button5'></a> </td></tr>");   
            } 
		    out.println("</table>");  
            out.println("</center></body></html>");  



		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
	
	}
}

	

