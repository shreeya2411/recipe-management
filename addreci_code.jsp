	<%@ page import="java.sql.*,java.io.*" %>
	<%@page import="java.util.ArrayList"%>
	<%@ page import="java.util.*" %>
    <%@ page import="java.util.Iterator" %>
	<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.FileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.FileItem"%>
    <%@ page import="org.apache.commons.fileupload.FileUpload"%>

	
	
	<%
	
 final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    
 final String DB_URL = "jdbc:mysql://localhost:3306/mydb";
	
 final String USERNAME = "root";
	
 final String PASSWORD = "root";
	

Connection conn = null;
    
Statement stmt = null;
	
	 FileItemFactory factory = new DiskFileItemFactory();
     ServletFileUpload upload = new ServletFileUpload(factory);
	 List items = null;

	//gets path of web app on the server		
	String path = application.getRealPath("/");
	//get path up to root directory of web application

	/*out.println("path="+path);
	int x=1;
	if(x==1)
	 return;
	String str=path.substring(0,path.indexOf(".metadata")-1);
	//get application name
	String str1=path.substring(path.lastIndexOf("\\", path.length()-2));
	//concatenate root directory with application name
	path=str+str1+"WebContent/";*/
	//construct file object for the above path and with sub directory uploads to store uploaded files
	File ProjectDir = new File(path+"/uploads"); 

			
	if(! ProjectDir.exists()) // if uploads directory does not exist in the application 
	{
		ProjectDir.mkdirs();  //creates uploads directory/folder
	} 		
      

	   try
       {
    	   //gets all html form fields and stores into items	
            items = upload.parseRequest(request);
       }
       catch (Exception e)
       {
               out.println("Error"+e.getMessage());
       }
       Iterator itr = items.iterator(); 
       //this will create iterator object from list..used for traversing the data.
        String uploadpath=path+"/uploads";
		ArrayList<String> colnames=new ArrayList<String>();
		ArrayList<String> colvalues=new ArrayList<String>();
		//String columnnames="(";
		
		//Iterates through all html form fields
       while (itr.hasNext())
       {
    	  
           FileItem item = (FileItem) itr.next(); 
		    //Ignoring the confirm password
		  /* if(!item.getFieldName().equals("cpassword")  && !item.getFieldName().equalsIgnoreCase("submit"))
			{
					columnnames+=item.getFieldName()+",";
			}*/
			
           if (item.isFormField())  //check the html form field is not file type
            {
				 //Ignoring the confirm password
				if(!item.getFieldName().equals("cpassword"))
				{
                       String name = item.getFieldName();  //reads form field name
                       String value = item.getString();      //reads form field value 
					   colvalues.add(value);  //adds value to colvalues arraylist
				}
                       
                       
            }
            else                                      //this else part for process about  file
             {
                try
                {
                	 //generate random number for creating unique file name
					 int r=generateRandomNumber(1000999, 888845465);
					 
					
					 
					 
					 //gets the filename uploaded
                	String fileName = new File(item.getName()).getName();
					colvalues.add(r+fileName); //adds filename to colvalues
					
                	String contentType = getServletContext().getMimeType(fileName);
					
                	//if(contentType.equals("application/pdf")) //if file uploaded is pdf
	                	item.write( new File(uploadpath + File.separator +(r+fileName))); //creates file in uploads directory created above
               }
                catch(Exception ste)
                {
                    out.println("Exception Uploading File : "+ste);
                }
             }                
          }
		 /* columnnames=columnnames.substring(0,columnnames.length()-1);
		  columnnames+=")";
		  */
		  
			
			String cookname=(String)session.getAttribute("uname");	
			String qry="insert into recipe (dish,cuisine,ingredients,steps,time,pic1,likes,cook) values ("+"'"+colvalues.get(0)+"',"+"'"+colvalues.get(1)+"',"+"'"+colvalues.get(2)+"',"+"'"+colvalues.get(3)+"',"+"'"+colvalues.get(4)+"',"+"'"+colvalues.get(5)+"',"+"'0',"+"'"+cookname+"')";	 
try{
     
      
Class.forName(JDBC_DRIVER);
	  conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
      stmt = conn.createStatement();
	  int n=stmt.executeUpdate(qry);
	  if(n>0)
		  out.println("<script language='javascript'>window.alert('Record Added Successfully.');window.location='viewrecipe.jsp';</script>");
	  else
		  out.println("<script language='javascript'>window.alert('Record Not Added.  Try Again!');window.location='addreci.jsp';</script>");
		  
	  stmt.close();
	  conn.close();
	 }
	 catch(Exception ee)
	 {
		 out.println("<h3>Error :"+ee.toString());
	 }
	 %>	<%!
	

	//function to generate random number
public int generateRandomNumber(int start, int end ){
    Random random = new Random();
    long fraction = (long) ((end - start + 1 ) * random.nextDouble());
    return ((int)(fraction + start));
}

%>