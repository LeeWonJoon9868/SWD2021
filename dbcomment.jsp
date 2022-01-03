<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.ConnectionContext" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<BODY background="gg.jpg">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="user" class = "bean.Member" scope = "session"></jsp:useBean>
<%
//request.setCharacterEncoding("utf-8");
String id = request.getParameter("tid");
//String userid = (String)request.getAttribute("userid");
String score_s = request.getParameter("score");
 String review = request.getParameter("review");
String userid = request.getParameter("userid");
if(userid == "")
	userid = "unknown";
int score = Integer.parseInt(score_s);
int tid = Integer.parseInt(id);
Connection conn = ConnectionContext.getConnection();
PreparedStatement pstmt = conn.prepareStatement("INSERT INTO comment (tid,userid,score,review) VALUES (?,?,?,?);");
pstmt.setInt(1,tid);
pstmt.setString(2,userid);
pstmt.setInt(3,score);
pstmt.setString(4,review);
pstmt.executeUpdate();
pstmt.close(); 
response.sendRedirect("dbread.jsp?target="+id);
%>
<input type = "button" name = "return" value = "돌아가기" onClick = "back(<%=tid%>)">
</body>
</html>
<script language = "javascript">
	function back(a){
		location.replace("dbread.jsp"+"?target="+a);
	}

</script>