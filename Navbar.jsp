<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오이 마켓</title>
</head>
<body>
<jsp:useBean id = "user" class = "bean.Member" scope = "session"/>


<table border = "0" width = "1000">
<tr><Td>
	<input type = "button" name = "home" value = "오이 마켓" onClick = "home()">
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
	</Td><td>
	<input type = "button" name = "board" value = "BOARD" onClick = "goBoard()">
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	</td>
	<td> 
	<%
		if(user.isLogin() == false){
			%>
				<input type = "button" name = "login" value = "로그인" onClick = "location.replace('LoginPage.jsp')">
				
			<%
		}
		else{
			String name= user.getId();
			String print="Welcome! "+name;
			%>
				<input type = "button" name = "mine" value = "내 물품" onClick = "location.replace('showMine.jsp')">
				<input type = "button" name = "logout" value = "로그아웃" onClick = "logout()"><br>
				<%=print%>
			<%
		}
	%>
	</td>
</table>
</body>
</html>

<script language = "javascript">
	function home(){
		location.replace("MainPage.jsp");
	}
	function logout(){
		location.replace("logout.jsp");
	}
	function goBoard(){
		location.replace("board.jsp");
	}
	
</script>