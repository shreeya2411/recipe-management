import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;


import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig(maxFileSize = 16177216)
public class add extends HttpServlet

{
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException
	{
		
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			
			String nv=req.getParameter("dish");
			HttpSession session=req.getSession(false);
      		String cook=(String)session.getAttribute("uname");
			out.println("<a href='main.html'>BACK TO HOME PAGE </a>");
		String pv=req.getParameter("cuisine");
		String mv=req.getParameter("ingredients");
		String sex=req.getParameter("steps");
		String pasv=req.getParameter("time");
		Part part = req.getPart("pic");
		int result =0;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","root");
		PreparedStatement st=con.prepareStatement("insert into mydb.recipe(dish,cuisine,ingredients,steps,time,pic,cook) values('"+nv+"','"+pv+"','"+mv+"','"+sex+"','"+pasv+"',?,'"+cook+"')");
		InputStream is = part.getInputStream();
		st.setBlob(1,is);
		result = st.executeUpdate();
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