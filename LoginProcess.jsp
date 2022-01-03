<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.io.*, bean.ConnectionContext, java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 중...</title>
</head>
<body>
<jsp:useBean id = "user" class = "bean.Member" scope = "session"/>
<%
	Connection conn = ConnectionContext.getConnection();
	Statement stmt = conn.createStatement();
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	ResultSet rs = stmt.executeQuery("select * from client where id = '" + id + "';");
	
	boolean isis = false;
	String storedid, storedpwd;
	if(rs.next()){
		storedid = rs.getString("id");
		storedpwd = rs.getString("password");
		int cid = rs.getInt("cid");
		String love = rs.getString("love");
		String name = rs.getString("name");
		String phone = rs.getString("phone");
		if(pwd.equals(storedpwd)){
			user.setId(id);
			user.setPassword(pwd);
			user.setCid(cid);
			user.setName(name);
			user.setPhone(phone);
			user.setLove(love);
			user.setLogin(true);
			%>
			<script language = "javascript">
				location.replace("MainPage.jsp");
			</script>
			<%
			
		}
		else{
			user.setId(id);
			%>
			<script language = "javascript">
				alert("비밀번호 오류입니다.");
				location.replace("LoginPage.jsp");
			</script>
			<%
		}

	}
	else{
		user.setId("");
		user.setPassword("");
		%>
		<script language = "javascript">
			alert("아이디가 존재하지 않습니다.");
			location.replace("LoginPage.jsp");
		</script>
		<%
	}
	
	stmt.close();
%>

</body>
</html>