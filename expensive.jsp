<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="bean.ConnectionContext" %>
<%@ page import ="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

<%
String itemtids="";
String itemtitles="";
String itemcats="";
String iteminfos="";
int itemprices=0;
String itemsolds="";

	String itemtid="";
	String itemtitle="";
	String itemcat="";
	String iteminfo="";
	int itemprice=0;
	String itemsold="";
	int temp=0;
	

	Connection conn = ConnectionContext.getConnection();

	PreparedStatement pstmt = conn.prepareStatement("select * from item");

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
		
		if (itemprice>temp){
			
			temp=itemprice;
			itemtids = rs.getString("tid");
			itemcats = rs.getString("cat");
			itemtitles = rs.getString("title");
			iteminfos = rs.getString("info");
			itemprices = rs.getInt("price");
			itemsolds=rs.getString("sold");
		}
		
		
		//out.println("<td>" + "<a href='dbread.jsp?target="+itemtid+"'><IMG  SRC='bird2.jpg' alt='gobuy'></a>" + "</td>");

	}
	out.println("<td>" + "<a href='dbread.jsp?target="+itemtids+"'><img id='photoImage' src='view.jsp?parameter="+itemtids+"' width='100' onerror='this.src=no_img.gif;' /></a>" + "</td>");
	
	out.println("<td>" + itemtitles + "</td>");
	out.println("<td>" + itemcats + "</td>");
	out.println("<td>" + itemprices + "</td>");
	out.println("<td>" + itemsolds + "</td>");
	
	out.println("</tr>");
	pstmt.close();
	rs.close();

%>
</body>
</html>