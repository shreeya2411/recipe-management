import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
 

public class likerecipe extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException
	{
	try{
		PrintWriter out=res.getWriter();
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","root");
		
		String nm=req.getParameter("dishname");
		int r_id;
		String ingr;


		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select r_id,ingredients from recipe where dish='"+nm+"'");
		if(rs.next())
		{
				r_id = rs.getInt("r_id");
				 ingr=rs.getString("ingredients");
				
				HttpSession session=req.getSession(false);
				String cookname=(String)session.getAttribute("uname");
				out.println("id: "+r_id+" ingr "+ingr+" name "+cookname);
				//Integer x=Integer.parseInt(v)-Integer.parseInt(amt);
				//out.println("subtracted:"+x);
			 	String op="update cookuser set fav_id='"+r_id+"',grocery='"+ingr+"' where username='"+cookname+"' ";
			 	PreparedStatement stat=con.prepareStatement(op);
				
				stat.executeUpdate();
				String op1="update recipe set likes=likes+1 where r_id='"+r_id+"' ";
			 	PreparedStatement stu=con.prepareStatement(op1);
				
				stu.executeUpdate();

				RequestDispatcher rd= req.getRequestDispatcher("viewrecipe.jsp");
				rd.forward(req,res);
		}







		
		/*PreparedStatement st = con.prepareStatement("select r_id from recipe where dish=?");
		st.setString(1,nm);
		ResultSet rs1= st.executeQuery();
		if(rs1.next()){
			 r_id = rs1.getInt(1);
			 PreparedStatement st1 = con.prepareStatement("update recipe set likes=likes+'1' where dish =?");
			st1.setString(1,nm);
			 st1.executeUpdate();
		}
			
		//PreparedStatement st1 = con.prepareStatement("update recipe set likes=likes+'1' where dish =?");
		//st1.setString(1,nm);
		 //st1.executeUpdate();
		

		/*PreparedStatement stuser = con.prepareStatement("update cookuser set fav_id = ? where u_id = ?");
		stuser.setInt(1,r_id);
		HttpSession session=req.getSession(false);
		String cookname=(String)session.getAttribute("uname");
		stuser.setString(2,cookname);
		stuser.executeUpdate();
		/*if(rs.next())
		{
			//session.setAttribute("uname",nm);
			r_id = rs.getInt(1);
			
			RequestDispatcher rd=req.getRequestDispatcher("signin.html");
			rd.forward(req,res);
		}
		else
		{
			RequestDispatcher rd=req.getRequestDispatcher("signin.html");
			rd.forward(req,res);
		}*/
			
		con.close();
		
	}
	catch(Exception e)
	{
		PrintWriter out=res.getWriter();
		out.println(e);
		e.printStackTrace();
	}
}
}