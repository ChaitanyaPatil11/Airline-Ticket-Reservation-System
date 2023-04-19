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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		try {
			PrintWriter out=response.getWriter();
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Airline","root","Chaitu");
			
			
			String fname= request.getParameter("fusername");
			String sname= request.getParameter("fpassword");
			PreparedStatement ps=con.prepareStatement("select uname from registration where uname=? and pname=?");
			ps.setString(1,fname);
			ps.setString(2, sname);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				RequestDispatcher rd=request.getRequestDispatcher("BookingMainPage.jsp");
				rd.forward(request, response);
				
			}
			else 
			{
				Messege m = new Messege("Username/Password is Invalid...!!!", "error" ,"danger");
				HttpSession s = request.getSession();
				s.setAttribute("msg", m);
				response.sendRedirect("LoginMainPage.jsp");
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
