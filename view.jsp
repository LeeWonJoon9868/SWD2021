<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,
                           com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
                           java.io.File" %>
<%@ page import="bean.ConnectionContext" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지보기</title>
</head>
<body>
<% 
Blob image = null;
byte[] imgData = null ;
try{	
String id = request.getParameter("parameter");
int tid=Integer.parseInt(id);
Connection conn = ConnectionContext.getConnection();
Statement stmt = conn.createStatement(); 
ResultSet rs = stmt.executeQuery("SELECT image FROM image WHERE tid="+tid);
out.clear();
out=pageContext.pushBody();

while (rs.next()){
	image = rs.getBlob(1);
	imgData = image.getBytes(1,(int)image.length());
}
response.setContentType("image/jpg");
// response.getOutputStream().write(imgData);
OutputStream o = response.getOutputStream();
//response.getOutputStream().write(imgData);
o.write(imgData);
o.flush();
o.close();

} catch (Exception e) {
	out.println("Unable To Display image");
	out.println("Image Display Error=" + e.getMessage());
	return;
	}
%>
</body>
</html>