<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="bean.ConnectionContext" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="user" class = "bean.Member" scope = "session"/>
<%
	String target = request.getParameter("target");

	int tt = Integer.parseInt(target);
	String ss = user.getLove();
	boolean isis = true;
	if(ss.equals(null)){
		int ll = Integer.parseInt(ss);
		while(ll != 0){
			int k = ll % 10;
			if(k == tt){
				isis = false;
				%>
				<script language = "javascript">
				alert("쪼아요 두 번 금지!");
				history.go(-1);
				</script>
				<%
				//response.sendRedirect("board.jsp");
			}
			ll = ll / 10;
		}
	}
	
	if(isis){
	Connection conn = ConnectionContext.getConnection();
	PreparedStatement pstmt = conn.prepareStatement("update client set love=? where cid="+user.getCid()+";");
	user.setLove(user.getLove() + target);
	pstmt.setString(1, user.getLove());
	pstmt.executeUpdate();
	pstmt.close();

	response.sendRedirect("board.jsp");
	}
%>
</body>
</html>