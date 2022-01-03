<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.ConnectionContext" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,
com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
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
<jsp:useBean id="user" class = "bean.Member" scope = "session"/>
<%
int price;
String savePath = "/home/j/eclipse-workspace/jspbook/src/main/webapp/Termproject2/images";
int sizeLimit = 5 * 1024 * 1024;
MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

request.setCharacterEncoding("utf-8");
String title = multi.getParameter("title");
String cat = multi.getParameter("cat");
String info = multi.getParameter("info");
String price_s = multi.getParameter("price");
price = Integer.parseInt(price_s);

Connection conn = ConnectionContext.getConnection();
PreparedStatement pstmt = conn.prepareStatement("INSERT INTO item (title,cat,info,price,date,sold, cid) VALUES (?,?,?,?,?,?,?);");
pstmt.setString(1,title);
pstmt.setString(2,cat);
pstmt.setString(3,info);
pstmt.setInt(4,price);
//pstmt.setString(4, price_s);
pstmt.setDate(5,new java.sql.Date(System.currentTimeMillis()));

pstmt.setString(6,"no");
pstmt.setInt(7, user.getCid()); 

pstmt.executeUpdate();
pstmt.close(); 
%>
<% 
FileInputStream fis = null;

/*String myloc = request.getParameter("upfile");
File image = new File(myloc);*/
pstmt = conn.prepareStatement("INSERT INTO image (image) VALUES (?);");
try{

/* fis=new FileInputStream(image);
pstmt.setBinaryStream(1, (InputStream) fis, (int) (image.length()));
pstmt.executeUpdate();*/
	
	File fl = multi.getFile("upfile");
	String fileName = fl.getName();
	long fileSize = fl.length();
	System.out.println(fileSize);
	File fff = new File(savePath + "/" + fileName);
	fis = new FileInputStream(fff);
	pstmt.setBinaryStream(1, (InputStream) fis, (long) (fl.length()));
	pstmt.executeUpdate();
	response.sendRedirect("board.jsp");
}catch(Exception e){
	out.println("failed");
}
%>

</body>
</html>