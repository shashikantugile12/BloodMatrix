<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="header.html"%>
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="submit"],select
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	margin-left:35%;
	padding:15px;
	width:33%;	
	border-radius: 25px;
}

#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 55%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<div class="contaner">
<br>
<%
String msg=request.getParameter("msg");
if("invalid".equals(msg)){
	

%> 
<center><font color="red" size=5>Something Went Wrong! try again!</font></center>
<% }
%>

<%
if("valid".equals(msg)){	
%> 
<center><font color="red" size=5>Successfully Updated</font></center>
<% }
%>
		<form action="manageStockAction.jsp" method="post">
			<div class="form-group">
				<center>
					<h2>Select Blood Group</h2>
				</center>
				<select name="bloodgroup">
				<option value="A+">A+</option>
				<option value="A-">A-</option>
				<option value="B+">B+</option>
				<option value="B-">B-</option>
				<option value="AB+">AB+</option>
				<option value="AB-">AB-</option>
				<option value="O+">O+</option>
				<option value="O-">O-</option>
				</select>
			</div>
			
			
			<center>
					<h2>Select Increased/decreased</h2>
				</center>
				<select name="incdec">
				<option value="inc">Increase</option>
				<option value="dec">Decrease</option>
				</select>
				
				<center><h2>Units</h2></center>
				<input type="text" placeholder="enter units" name="units">
				<center><button type="submit" class="button">Save</button></center>
				</div>
		</form>
		<br>
		<center>
		<table id="customers">
		<tr>
		<th>bloodgroup</th>
		<th>units</th>
		</tr>
		<tr>
		<%
		try{
			Connection con= ConnectionProvider.getCon();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from stock");
			while(rs.next()){
				%>
				
				<td><%=rs.getString(1)%>
				<td><%=rs.getString(2)%>
				</tr>
				<% 
				}
		}
		catch(Exception e){
			System.out.println(e);
		}
		%>
		</table>
		</center>
<br>
<br>
<br>
<br>
<h3><center>All Right Reserved To Only Team S.A.V.S.</center></h3>
</body>
</html>