<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import = "java.io.*, bean.ConnectionContext, java.sql.*" %>
<meta charset="UTF-8">
<title>회원가입 중...</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id = "client" class = "bean.Member" scope = "session"/>
<jsp:useBean id = "user" class = "bean.Member" scope = "session"/>
<jsp:setProperty property="*" name="client"/>
<%
	Connection conn = ConnectionContext.getConnection();
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("select * from client where id = '" + client.getId() + "';");
	
	boolean isis = false;
	String storedid, storedpwd;
	if(rs.next()){
		isis = false;
		%>
		<script language = "javascript">
			alert("아이디가 존재합니다.");
			location.replace("RegisterPage.jsp");
		</script>
		<%
	}
	else{
		user.setId(client.getId());
		user.setPassword(client.getPassword());
		stmt.executeUpdate("insert into client(id, password, name, phone) values('"+client.getId() + "','" +client.getPassword() + "','"
				+client.getName() + "','"+client.getPhone() + "');");
		%>
		<script language = "javascript">
			location.replace("LoginPage.jsp");
		</script>
		<%
	}
	stmt.close();
%>

</body>
</html>