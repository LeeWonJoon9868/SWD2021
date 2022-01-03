<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.ConnectionContext" %>
<%@ page import="java.util.Date" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest,
com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 완료</title>
</head>
<body>
<jsp:useBean id="user" class = "bean.Member" scope = "session"></jsp:useBean>

<%
	FileInputStream fis = null;
	String savePath = "/home/j/eclipse-workspace/jspbook/src/main/webapp/Termproject/images";

	String title = request.getParameter("title");
	String cat = request.getParameter("cat");
	String info = request.getParameter("info");
	String price_s = request.getParameter("price");
	String nego = request.getParameter("nego");
	String myloc = request.getParameter("upfile");
	
	
	
	String unknown = "unknown";
	Connection conn = ConnectionContext.getConnection();
	PreparedStatement pstmt = conn.prepareStatement("INSERT INTO item (title,cat,info,price2,date,cid,interest,nego, image) VALUES (?,?,?,?,?,?,?,?,?);");
	pstmt.setString(1,title);
	pstmt.setString(2,cat);
	pstmt.setString(3,info);
	pstmt.setString(4,price_s);
	pstmt.setDate(5,new java.sql.Date(System.currentTimeMillis()));
	pstmt.setString(6,user.getId());
	pstmt.setInt(7,0);
	pstmt.setString(8,nego);
	
	
		/* File image = new File(myloc);
		fis = new FileInputStream(image);
		pstmt.setBinaryStream(9, (InputStream) fis, (int) (image.length()));
		*/
		
	int sizeLimit = 5 * 1024 * 1024;
	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	File fl = multi.getFile("upfile");
	String fileName = fl.getName();
	long fileSize = fl.length();
	System.out.println(fileSize);
	File fff = new File(savePath + "/" + fileName);
	fis = new FileInputStream(fff);
	System.out.println(fis);
	pstmt.setBinaryStream(9, (InputStream) fis, (int) (fl.length()));
		
	pstmt.executeUpdate();
	fis.close();
	pstmt.close(); 
%>
</body>
</html>