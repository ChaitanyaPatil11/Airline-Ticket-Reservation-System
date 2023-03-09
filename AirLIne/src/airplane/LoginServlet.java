package airplane;
import airplane.Messege;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet") //@WebServlet annotation is used to map the servlet with the specified name.
public class LoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		try {
			PrintWriter out=response.getWriter();
			Class.forName("com.mysql.cj.jdbc.Driver");//1) JDBC-ODBC bridge driver
			                                           //2) Native-API driver (partially java driver)
		                                                //3) Network Protocol driver (fully java driver)
		                                                //4) Thin driver (fully java driver)
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Airline","root","Chaitu");
			
			
			String fname= request.getParameter("fusername");
			String sname= request.getParameter("fpassword");
			PreparedStatement ps=con.prepareStatement("select uname from registration where uname=? and pname=?");
			ps.setString(1,fname);
			ps.setString(2, sname);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				RequestDispatcher rd=request.getRequestDispatcher("BookingMainPage.jsp");// getRequestDispatcher() method of ServletRequest interface returns the object of RequestDispatcher 
				rd.forward(request, response);
				request.getRequestDispatcher("BookingServlet").include(request, response);
			}
			else 
			{
				Messege m = new Messege("Username/Password is Invalid...!!!", "error" ,"danger");//message.class
				HttpSession s = request.getSession();
				s.setAttribute("msg", m);//key and value
				response.sendRedirect("LoginMainPage.jsp");// redirect to itself page
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
