package airplane;

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





@WebServlet("/CheckUnameServlet")
public class CheckUnameServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out=response.getWriter();
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/Airline", "root", "Chaitu");
			
			
			String fname= request.getParameter("forcheckuname");
			String sname= request.getParameter("forcheckemail");
			PreparedStatement ps=con.prepareStatement("select uname from registration where uname=? and ename=?");
			ps.setString(1,fname);
			ps.setString(2, sname);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				RequestDispatcher rd=request.getRequestDispatcher("EditPassword.jsp");
				rd.forward(request, response);
				request.getRequestDispatcher("NewPasswordServlet").include(request, response);
			}
			else 
			{
				Messege m = new Messege("Doesn't Match Username/Emailid..!!", "error" ,"danger");
				HttpSession s = request.getSession();
				s.setAttribute("msg", m);
				response.sendRedirect("ForgotPass1.jsp");
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

