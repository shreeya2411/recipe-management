import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;

public class nutri extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException
	{
		try
		{
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","root");
			String nv=req.getParameter("n_data");
			String dn=req.getParameter("dishname");
			//HttpSession session= req.getSession();

	
			
		String op="update recipe set nutri='"+nv+"' where dish='"+dn+"' ";
			 	PreparedStatement stat=con.prepareStatement(op);
				
				stat.executeUpdate();
		RequestDispatcher rd= req.getRequestDispatcher("admin.jsp");
		rd.forward(req,res);
		stat.close();
		con.close();
					}
		catch(Exception e)
		{
			PrintWriter out = res.getWriter();
			out.println(e);
		}
	}
}