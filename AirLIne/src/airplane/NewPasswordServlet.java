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




@WebServlet("/NewPasswordServlet")
public class NewPasswordServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out=response.getWriter();
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/Airline", "root", "Chaitu");
			
			String fname= request.getParameter("forupdateuname");
			String sname= request.getParameter("forupdateemail");
			String tname= request.getParameter("forupdatecheckemail");
			
			if(sname.equals(tname)) {
				
			}else {
				Messege m = new Messege("Mismatch Password..!!", "error" ,"danger");
				HttpSession s = request.getSession();
				s.setAttribute("msg", m);
				response.sendRedirect("EditPassword.jsp");
			}
			
			//if condition is correct then we update the new password
			PreparedStatement ps=con.prepareStatement("update registration set pname=? where uname=? ");
			ps.setString(1,sname);
			ps.setString(2, fname);
			
			int rs=ps.executeUpdate();
			
			if(rs == 1)
			{
				
				
				RequestDispatcher rd=request.getRequestDispatcher("LoginMainPage.jsp");
				rd.forward(request, response);
				request.getRequestDispatcher("LoginServlet").include(request, response);
			}
			else 
			{
				Messege m = new Messege("Updation Fail...!!!", "error" ,"danger");
				HttpSession s = request.getSession();
				s.setAttribute("msg", m);
				response.sendRedirect("EditPassword.jsp");
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
