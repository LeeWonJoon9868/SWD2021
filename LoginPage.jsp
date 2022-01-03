<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<BODY background="gg.jpg">
<html>
<head>
<meta charset="UTF-8">
<title>오이 마켓 로그인</title>
</head>
<body>
<jsp:include page="Navbar.jsp"/><br><br>
<jsp:useBean id = "user" class = "bean.Member" scope = "session"/>

<form name = "loginform" onsubmit = "return loginprocess();" action = "LoginProcess.jsp" method = "post">
로그인<br>
또는 <a href = "RegisterPage.jsp">계정을 만드세요.</a><br>

사용자  ID<br>
<% if(user.getId() == null){ %>
<input type = "text" name = "id" size = "20"><br>
비밀번호 <br>
<input type = "password" name = "pwd" size = "20"><br> 
<input type = "submit" name = "login" value = "로그인" ><br>
<%} else { %>
<input type = "text" name = "id" size = "20" value = "<%= user.getId() %>"><br>
비밀번호 <br>
<input type = "password" name = "pwd" size = "20" value = "<%= user.getPassword() %>"><br> 
<input type = "submit" name = "login" value = "로그인" ><br>
<%} %>

</form>

</body>
</html>
<script language = "javascript">
	
	function loginprocess(){
		if(document.loginform.id.value != ""){
			if(document.loginform.pwd.value != ""){
				return true;
			}
			else {
				alert("비밀번호를 입력하세요!");
				document.loginform.pwd.focus();
				return false;
			}
		}
		else {
			alert("id를 입력하세요!");
			document.loginform.id.focus();
			return false;
		}
	}
</script>