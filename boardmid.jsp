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

<%
String target = request.getParameter("target");
%>


<body>

<%
if (target==null){
	
	String itemtid="";
	String itemtitle="";
	String itemcat="";
	String iteminfo="";
	int itemprice=0;
	String itemsold="";

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
		//out.println("<td>" + "<a href='dbread.jsp?target="+itemtid+"'><IMG  SRC='bird2.jpg' alt='gobuy'></a>" + "</td>");
		out.println("<td>" + "<a href='dbread.jsp?target="+itemtid+"'><img id='photoImage' src='view.jsp?parameter="+itemtid+"' width='100' onerror='this.src=no_img.gif;' /></a>" + "</td>");
		out.println("<td>" + itemtitle + "</td>");
		out.println("<td>" + itemcat + "</td>");
		out.println("<td>" + itemprice + "</td>");
		out.println("<td>" + itemsold + "</td>");
		
		out.println("</tr>");
	}
	pstmt.close();
	rs.close();
}
else if (target.equals("pricehigh"))
{

String itemtid="";
String itemcat="";
String iteminfo="";
String itemtitle="";
int itemprice=0;
String itemsold="";

Connection conn = ConnectionContext.getConnection();

PreparedStatement pstmt = conn.prepareStatement("select * from item order by price desc");
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

	//out.println("<td>" + "<a href='dbread.jsp?target="+itemtid+"'><IMG SRC='bird2.jpg' alt='gobuy'></a>" + "</td>");
	out.println("<td>" + "<a href='dbread.jsp?target="+itemtid+"'><img id='photoImage' src='view.jsp?parameter="+itemtid+"' width='50' onerror='this.src=no_img.gif;' /></a>" + "</td>");
	
	out.println("<td>" + itemtitle + "</td>");
	out.println("<td>" + itemcat + "</td>");
	out.println("<td>" + itemprice + "</td>");
	out.println("<td>" + itemsold + "</td>");
	
	out.println("</tr>");
}
pstmt.close();
rs.close();
}

else if (target.equals("pricelow"))
{

String itemtid="";
String itemcat="";
String iteminfo="";
String itemtitle="";
int itemprice=0;
String itemsold="";

Connection conn = ConnectionContext.getConnection();

PreparedStatement pstmt = conn.prepareStatement("select * from item order by price asc");
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

	//out.println("<td>" + "<a href='dbread.jsp?target="+itemtid+"'><IMG SRC='bird2.jpg' alt='gobuy'></a>" + "</td>");
	out.println("<td>" + "<a href='dbread.jsp?target="+itemtid+"'><img id='photoImage' src='view.jsp?parameter="+itemtid+"' width='50' onerror='this.src=no_img.gif;' /></a>" + "</td>");
	
	out.println("<td>" + itemtitle + "</td>");
	out.println("<td>" + itemcat + "</td>");
	out.println("<td>" + itemprice + "</td>");
	out.println("<td>" + itemsold + "</td>");
	
	out.println("</tr>");
}
pstmt.close();
rs.close();
}

else if (target.equals("recent"))
{

String itemtid="";
String itemcat="";
String iteminfo="";
String itemtitle="";
int itemprice=0;
String itemsold="";

Connection conn = ConnectionContext.getConnection();

PreparedStatement pstmt = conn.prepareStatement("select * from item order by tid desc");
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

	//out.println("<td>" + "<a href='dbread.jsp?target="+itemtid+"'><IMG SRC='bird2.jpg' alt='gobuy'></a>" + "</td>");
	out.println("<td>" + "<a href='dbread.jsp?target="+itemtid+"'><img id='photoImage' src='view.jsp?parameter="+itemtid+"' width='50' onerror='this.src=no_img.gif;' /></a>" + "</td>");
	
	out.println("<td>" + itemtitle + "</td>");
	out.println("<td>" + itemcat + "</td>");
	out.println("<td>" + itemprice + "</td>");
	out.println("<td>" + itemsold + "</td>");
	
	out.println("</tr>");
}
pstmt.close();
rs.close();
}

else
{

String itemtid="";
String itemcat="";
String iteminfo="";
String itemtitle="";
int itemprice=0;
String itemsold="";

Connection conn = ConnectionContext.getConnection();

PreparedStatement pstmt = conn.prepareStatement("select * from item where cat=?");
pstmt.setString(1,target);
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

	//out.println("<td>" + "<a href='dbread.jsp?target="+itemtid+"'><IMG SRC='bird2.jpg' alt='gobuy'></a>" + "</td>");
	out.println("<td>" + "<a href='dbread.jsp?target="+itemtid+"'><img id='photoImage' src='view.jsp?parameter="+itemtid+"' width='50' onerror='this.src=no_img.gif;' /></a>" + "</td>");
	
	out.println("<td>" + itemtitle + "</td>");
	out.println("<td>" + itemcat + "</td>");
	out.println("<td>" + itemprice + "</td>");
	out.println("<td>" + itemsold + "</td>");
	
	out.println("</tr>");
}
pstmt.close();
rs.close();
}

%>

</body>
</html>