<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="user" class = "bean.Member" scope = "session"></jsp:useBean>

<form name = "boardform">
<table align = "right" width = "700">
<tr></tr><tr></tr><tr></tr>
<tr><td>
	<%
		if(user.isLogin()){
	%>
	<input type = "button" name = "write" value = "글쓰기" onClick = "goWrite()">
	<%} %>
	</td></tr>
</table>
</form>

</body>
</html>
<script language = "javascript">
	function goWrite(){
		location.replace("Write.jsp");
	}
</script>