import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;

public class searchresult extends HttpServlet

{
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException
	{
		
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			
			String nv=req.getParameter("search");
			ResultSet result;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","root");
		PreparedStatement st=con.prepareStatement("select * from recipe where dish=? or cuisine= ?");
		
		result = st.executeQuery();
		if(result > 0)
		{
			RequestDispatcher rd= req.getRequestDispatcher("main.html");
		rd.forward(req,res);
		st.close();
		con.close();
		}
		}
		catch(Exception e)
		{
			
			out.println(e);
		}
	
}
}