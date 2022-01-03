<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="bean.ConnectionContext" %>
<%@ page import ="java.sql.*" %>
<BODY background="gg.jpg">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="Navbar.jsp"/>
<body>
<%
String target = request.getParameter("target");
int tid=Integer.parseInt(target);
int money=0;
String sold="";
Connection conn = ConnectionContext.getConnection();

PreparedStatement pstmt = conn.prepareStatement("select * from item where tid=?");
pstmt.setInt(1,tid);
ResultSet rs= pstmt.executeQuery();
while (rs.next()){
	money = rs.getInt("price");
}
String print = "will be drawed out from ur account";

PreparedStatement pstmt1 = conn.prepareStatement("update item set sold=?, updated=? where tid=?");
pstmt1.setString(1,"yes");
pstmt1.setDate(2, new java.sql.Date(System.currentTimeMillis()));
pstmt1.setInt(3,tid);
pstmt1.executeUpdate();

pstmt.close();
rs.close();
pstmt1.close();


%>
<%=money%><%=print%>

</body>
</html>