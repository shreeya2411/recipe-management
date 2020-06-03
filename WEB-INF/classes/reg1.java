import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
 

public class reg1 extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException
	{
	try{
		PrintWriter out=res.getWriter();
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","root");
		
		String nm=req.getParameter("username");
		String pw=req.getParameter("password");
		
		PreparedStatement st = con.prepareStatement("select username,password from cookuser where username=? and password=?");
		st.setString(1,nm);
		st.setString(2,pw);
		ResultSet rs= st.executeQuery();
		HttpSession session=req.getSession();
		if(rs.next())
		{
			session.setAttribute("uname",nm);
			if(nm.equals("admin"))
			{
				if(pw.equals("admin")){
					RequestDispatcher rd=req.getRequestDispatcher("admin.jsp");
				rd.forward(req,res);
				}
				
			}
			RequestDispatcher rd=req.getRequestDispatcher("addreci.jsp");
			rd.forward(req,res);
		}
		else
		{
			RequestDispatcher rd=req.getRequestDispatcher("signin.html");
			rd.forward(req,res);
		}
			
		con.close();
		
	}
	catch(Exception e)
	{
		PrintWriter out=res.getWriter();
		out.println(e);
	}
}
}