<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String target = request.getParameter("target");
int tid = Integer.parseInt(target);
String review = null;
int score = -1;
String userid = null;
Connection conn = ConnectionContext.getConnection();
Statement stmt = conn.createStatement(); 
ResultSet rs = stmt.executeQuery("SELECT * FROM comment WHERE tid="+tid);

while (rs.next()){
	review = rs.getString("review");
	score = rs.getInt("score");
	userid = rs.getString("userid");
	if(rs.equals(null))
		out.print("관심");
	%>
	<%=userid%>:<%=score%>.<%=review%> </br>
	<%
}
%>
</body>
</html>