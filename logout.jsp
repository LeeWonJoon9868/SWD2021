<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오이 마켓 로그아웃 중...</title>
</head>
<body>
<jsp:useBean id="user" class = "bean.Member" scope = "session"/>
<%
	user.setLogin(false);
	user = new bean.Member();
	session.setAttribute("user", user);
	response.sendRedirect("MainPage.jsp");
%>

</body>
</html>