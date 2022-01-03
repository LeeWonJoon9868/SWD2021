<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<BODY background="gg.jpg">
<%@ page import="bean.ConnectionContext" %>
<%@ page import ="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Navbar.jsp"/>

<br><Br>
<jsp:useBean id = "user" class = "bean.Member" scope = "session"/>
<center><b>내가 올린 물품<Br></b></center>
<%
	String targetpage="boardmid.jsp?target="+user.getCid();
%>
<%
String itemtid="";
String itemtitle="";
String itemcat="";
String iteminfo="";
int itemprice=0;
String itemsold="";

Connection conn = ConnectionContext.getConnection();

PreparedStatement pstmt = conn.prepareStatement("select * from item where cid="+user.getCid()+";");

ResultSet rs= pstmt.executeQuery();


out.print("<table border =" + "2 " + "width =" + "700 " + "align ="
        + "center " + "bordercolor =" + "green " + "cellspacing ="
        + "2 " + " bordercolor =" + "green >");
out.print("<tr>");

out.print("<th>" + "ITEM" + "</th>");
out.print("<th>" + "TITLE" + "</th>");
out.print("<th>" + "CATEGORY" + "</th>");
out.print("<th>" + "PRICE" + "</th>");
out.print("<th>" + "SOLD" + "</th>");
out.print("</tr>");


while(rs.next()){
	
	itemtid = rs.getString("tid");
	itemcat = rs.getString("cat");
	itemtitle = rs.getString("title");
	iteminfo = rs.getString("info");
	itemprice = rs.getInt("price");
	itemsold=rs.getString("sold");		
	//out.println("<td>" + "<a href='dbread.jsp?target="+itemtid+"'><IMG  SRC='bird2.jpg' alt='gobuy'></a>" + "</td>");
	out.println("<td>" + "<a href='dbread.jsp?target="+itemtid+"'><img id='photoImage' src='view.jsp?parameter="+itemtid+"' width='100' onerror='this.src=no_img.gif;' /></a>" + "</td>");
	out.println("<td>" + itemtitle + "</td>");
	out.println("<td>" + itemcat + "</td>");
	out.println("<td>" + itemprice + "</td>");
	out.println("<td>" + itemsold + "</td>");
	
	out.println("</tr>");
	
}
out.println("</TABLE>");
pstmt.close();
rs.close();
%>
<br><br>
<center><b>쪼아연!<Br></b></center>

<%
try{
	pstmt = conn.prepareStatement("select love from client where cid="+user.getCid()+";");
	

	rs = pstmt.executeQuery();
	if(rs.next()){
		
		String ss = rs.getString("love");
		if(ss != ""){
		int ll = Integer.parseInt(ss);
		
		out.print("<table border =" + "2 " + "width =" + "700 " + "align ="
		        + "center " + "bordercolor =" + "green " + "cellspacing ="
		        + "2 " + " bordercolor =" + "green >");
		out.print("<tr>");

		out.print("<th>" + "ITEM" + "</th>");
		out.print("<th>" + "TITLE" + "</th>");
		out.print("<th>" + "CATEGORY" + "</th>");
		out.print("<th>" + "PRICE" + "</th>");
		out.print("<th>" + "SOLD" + "</th>");
		out.print("</tr>");

		
		while(ll != 0){
			int k = ll % 10;
			
			PreparedStatement pstmt2 = conn.prepareStatement("select * from item where tid="+k+";");
			ResultSet rs2 = pstmt2.executeQuery();
			if(rs2.next()){
			itemtid = rs2.getString("tid");
			itemcat = rs2.getString("cat");
			itemtitle = rs2.getString("title");
			iteminfo = rs2.getString("info");
			itemprice = rs2.getInt("price");
			itemsold=rs2.getString("sold");		
			//out.println("<td>" + "<a href='dbread.jsp?target="+itemtid+"'><IMG  SRC='bird2.jpg' alt='gobuy'></a>" + "</td>");
			out.println("<td>" + "<a href='dbread.jsp?target="+itemtid+"'><img id='photoImage' src='view.jsp?parameter="+itemtid+"' width='100' onerror='this.src=no_img.gif;' /></a>" + "</td>");
			out.println("<td>" + itemtitle + "</td>");
			out.println("<td>" + itemcat + "</td>");
			out.println("<td>" + itemprice + "</td>");
			out.println("<td>" + itemsold + "</td>");
			
			out.println("</tr>");
			}
			ll = ll / 10;
			pstmt2.close();
		}
		out.println("</TABLE>");
		
	}
	}
	pstmt.close();
}
catch(Exception e){}
%>

</body>
</html>