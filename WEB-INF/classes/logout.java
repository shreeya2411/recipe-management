import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class logout extends HttpServlet
{
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException
	{
		try
		{
			HttpSession session= req.getSession();
			session.removeAttribute("username");
			session.invalidate();
			RequestDispatcher rd=req.getRequestDispatcher("main.html");
			rd.forward(req,res);
		}
		catch(Exception e)
		{
			PrintWriter out=res.getWriter();
			out.println(e);
		}
	}
}