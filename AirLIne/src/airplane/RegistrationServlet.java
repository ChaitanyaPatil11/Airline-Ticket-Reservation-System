package airplane;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher reqd=request.getRequestDispatcher("WEB-INF/RegMainPage.jsp");
		reqd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String ename=request.getParameter("ename");
		String mname = request.getParameter("mname");
		String cname=request.getParameter("cname");
		String uname=request.getParameter("uname");
		String pname=request.getParameter("pname") ;
		
		
		PrintWriter out=response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/Airline", "root", "Chaitu");
		    PreparedStatement stmt=con.prepareStatement("insert into registration values(?,?,?,?,?,?,?)");
		    stmt.setString(1, fname);
		    stmt.setString(2, lname);
		    stmt.setString(3, ename);
		    stmt.setString(4, mname);
		    stmt.setString(5, cname);
		    stmt.setString(6, uname);
		    stmt.setString(7, pname);
		   
		    
		    int r=stmt.executeUpdate();
		    if(r!=0)
		    {
		    	response.sendRedirect("LoginMainPage.jsp");
		    }else {
		    	out.println("Query not Executed,Saving Unsuccessful");
		    }
		  
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	
	
	}


