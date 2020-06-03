<!DOCTYPE html>
<html lang="en">
<head>
  <title>FAVORITES</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
</head>
<body style="background-color: #339a7b;">

<header>
<div class="navbar">
<ul>

<li><a href="viewrecipe.jsp"><i class="fa fa-newspaper-o" aria-hidden="true"></i>FEED</a></li>
<li><a href="viewrecipe.jsp"><i class="fa fa-search" aria-hidden="true"></i>SEARCH</a></li>
<li><a href="addreci.jsp"><i class="fa fa-glass" aria-hidden="true"></i>ADD RECIPE</a></li>
<li><a href="favorite.jsp"><i class="fa fa-heart-o" aria-hidden="true"></i>FAVORITES</a></li>
<li><a href="grocery.jsp"><i class="fa fa-shopping-basket" aria-hidden="true"></i>GROCERY LIST</a></li>
<li><a href="logout"><i class="fa fa-sign-out" aria-hidden="true"></i>LOGOUT</a></li>

</ul>
</div>
</header>

<div class="container" style="background-color:rgba(44,62,80,0.7);">
  <h2 id="viewrecord">FAVORITE RECIPE</h2>
  <form name='f1' method='post' action="#" enctype="">
	
        
        	<%@ page import="java.sql.*,java.io.*" %>
	<%@page import="java.util.ArrayList"%>
	<%@ page import="java.util.*" %>
 	<%
	
 final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    
 final String DB_URL = "jdbc:mysql://localhost:3306/mydb";
	

 final String USERNAME = "root";
	
 final String PASSWORD = "root";
	

Connection conn = null;
    
Statement stmt = null;
	
String path=request.getContextPath(); //returns application path
	
%>

	
   <br>

	
	
	
   </form>
   
   
   <div class="container" style='margin-top:-40px'>
   	<%
	 
try{
     
      

	  //gets path of web app on the server		
	  // String path = application.getRealPath("/");
	  Class.forName(JDBC_DRIVER);
	  conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
      stmt = conn.createStatement();
      String uname=(String)session.getAttribute("uname");


      Statement st=conn.createStatement();
	ResultSet rs=st.executeQuery("select fav_id from cookuser where username='"+uname+"'");
		if(rs.next())
		{
			int r_id = rs.getInt("fav_id");
			  String qry1="select dish,cuisine,ingredients,steps,time,likes,cook,pic1 from recipe where r_id = '"+r_id+"'";
	  ResultSet rs1=stmt.executeQuery(qry1);
	  if(rs1.next())
	  {
		out.println("<br><table class='table table-bordered display' id='table_id'>");
		out.println("<thead class='thead'>");
		out.println("<tr>");out.println("<th>dish</th>");out.println("<th>cuisine</th>");out.println("<th>ingredients</th>");out.println("<th>steps</th>");out.println("<th>time</th>");out.println("<th>likes</th>");out.println("<th>cook</th>");out.println("<th>image</th>");out.println("</tr>");
		out.println("</thead>");
		out.println("<tbody>");
						
		do
		{
			out.println("<tr>");
			
		 out.println("<td>"+rs1.getString("dish")+"</td>");
		 out.println("<td>"+rs1.getString("cuisine")+"</td>");
		 out.println("<td>"+rs1.getString("ingredients")+"</td>");
		 out.println("<td>"+rs1.getString("steps")+"</td>");
		 out.println("<td>"+rs1.getString("time")+"</td>");
		 
		 out.println("<td>"+rs1.getString("likes")+"</td>");
		 out.println("<td>"+rs1.getString("cook")+"</td>");
		 out.println("<td><img src='"+path+"/uploads/"+rs1.getString("pic1")+"' width='100px' height='100px'></img></td>");
		 		out.println("</tr>");
		}while(rs.next());
		out.println("</tbody>");
		out.println("<thead class='thead-dark'>");
		out.println("<tr>");
				out.println("</tr>");
		out.println("</thead>");
		out.println("</table></div>");
	  }
	 else
	  {
	 	  out.println("<h3>No Favorites Yet.</h3>");
	  }
	  stmt.close();
	  conn.close();
		}








	
	  
	 }
	 catch(Exception ee)
	 {
		 out.println(".:");
	 }
	%>
   </div>
   <br>
   
  
</div>
		<script>
		$(document).ready( function () {
    $('#table_id').DataTable();
} );
		</script>
		
</body>
</html>
