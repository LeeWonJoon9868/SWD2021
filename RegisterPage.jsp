<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<BODY background="gg.jpg">
<html>
<head>
<meta charset="UTF-8">



<title>오이 마켓 회원가입</title>
</head>
<body>
<jsp:include page = "Navbar.jsp"/><br><br>

<form name = "registerform" onsubmit = "return check();" action = "RegisterProcess.jsp" method = "post">
<table border = 1 cellpadding = 0 cellspacing = 0>
<tr><td>Id : </td>
<td><input type = "text" name = "id" size = "15">
</td>
<tr><td>Password : </td>
<td><input type = "password" name = "password" size = "10">
</td>
</tr>
<tr><td>Password 확인: </td>
<td><input type = "password" name = "password2" size = "10">
</td>
</tr>
<tr><td> Name : </td>
<td colspan = "3"><input type = "text" name = "name" size = "15">
</td></tr>
<tr><td> Phone : </td>
<td colspan = "3"><input type = "text" name = "phone" size = "30">
</td></tr>
<tr>
<td colspan = "4" align = "center">
<input type = "submit" name = "submit" value = "register">
</td></tr>
</table>
</form>

</body>
</html>
<script language = "javascript">
	function check(){
		for(i = 0; i < document.registerform.elements.length; i++){
			if(document.registerform.elements[i].value == ""){
				alert("모두 기입해주세요!");
				document.registerform.elements[i].focus();
				return false;
			}
		}
		if(document.registerform.password.value == document.registerform.password2.value){
			return true;
		}
		else{
			alert("비밀번호가 다릅니다.");
			return false;
		}
		return false;
	}
</script>
