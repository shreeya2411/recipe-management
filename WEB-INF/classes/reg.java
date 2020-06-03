import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;

public class reg extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException
	{
		try
		{
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","root");
			String nv=req.getParameter("username");
			/*HttpSession session= req.getSession();

			session.setAttribute("uname",nv);*/
			out.println("<a href='main.html'>BACK TO HOME PAGE </a>");
		String pv=req.getParameter("password");		
		String inq="insert into mydb.cookuser(username,password) values('"+nv+"','"+pv+"')";
		PreparedStatement st=con.prepareStatement(inq);
		out.println("USER REGISTRATION SUCCESSFUL");
		st.execute();
		RequestDispatcher rd= req.getRequestDispatcher("addreci.jsp");
		rd.forward(req,res);
		st.close();
		con.close();
					}
		catch(Exception e)
		{
			PrintWriter out = res.getWriter();
			out.println(e);
		}
	}
}