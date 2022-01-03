<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.ConnectionContext" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<BODY background="gg.jpg">
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 완료</title>
<jsp:include page="Navbar.jsp"/>

<SCRIPT LANGUAGE="JAVASCRIPT">
function goback(){
	location.replace("board.jsp");
}

</SCRIPT>

</head>
<body>
<%
String title = request.getParameter("title");
String cat = request.getParameter("cat");
String info = request.getParameter("info");
String price_s = request.getParameter("price");

int price = Integer.parseInt(price_s);

Connection conn = ConnectionContext.getConnection();
PreparedStatement pstmt = conn.prepareStatement("INSERT INTO item (title,cat,info,price,date,sold) VALUES (?,?,?,?,?,?);");
pstmt.setString(1,title);
pstmt.setString(2,cat);
pstmt.setString(3,info);
pstmt.setInt(4,price);
pstmt.setDate(5,new java.sql.Date(System.currentTimeMillis()));

pstmt.setString(6,"no");

pstmt.executeUpdate();
pstmt.close(); 
%>
<% 
FileInputStream fis = null;
String myloc = request.getParameter("upfile");
File image = new File(myloc);
pstmt = conn.prepareStatement("INSERT INTO image (image) VALUES (?);");
try{

fis=new FileInputStream(image);
pstmt.setBinaryStream(1, (InputStream) fis, (int) (image.length()));
pstmt.executeUpdate();
}catch(Exception e){
	out.println("failed");
}
%>

</body>
</html>