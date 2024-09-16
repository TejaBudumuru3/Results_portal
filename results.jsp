<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html" %>
<%@ page errorPage="exception.jsp" %>

<%
String roll = request.getParameter("roll");

String uname ="root";
String pwd = "";
String url = "jdbc:mysql://localhost:3306/results";
String qry="";

if(!roll.equals("")){
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(url,uname,pwd);
if (con!=null) {
	Statement st = con.createStatement();
	qry = "SELECT * FROM cse_vi WHERE roll ='"+roll+"'";

	ResultSet rs = st.executeQuery(qry);
	
	
out.print("<h1 align='center'>Results</h1><br>");

out.print("<table border='1' align='center'>");
out.print("<tr>");
		out.print("<th>Roll</th>");
		out.print("<th>Name</th>");
		out.print("<th>CGPA</th></tr>");

	while(rs.next()){
		out.print("<br>");
		out.print("<tr>");
			out.print("<td>"+rs.getString("Roll")+"</td>");
			out.print("<td>"+rs.getString("Name")+"</td>");
			out.print("<td>"+rs.getString("CGPA")+"</td></tr>");
	
	}
		out.print("</table>");
}
}
else{
	out.print("<h2 align='center'>Invalid Roll</h2>");

}
%>

