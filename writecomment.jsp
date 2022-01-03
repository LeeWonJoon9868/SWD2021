<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:useBean id = "user" class = "bean.Member" scope = "session"/>
<SCRIPT LANGUAGE="JAVASCRIPT">

function check(){
	var score = document.com.score;
	var review = document.com.review;
	if(score.value==""){
		alert("점수를 입력해주세요");
		document.com.score.focus();
		return false;
	}
	if(review.value==""){
		alert("댓글을써주세요");
		document.com.review.focus();
		return false;
	}
	document.com.submit();
}
</script>
</head>
<body>
<%
String userid = user.getId();
String target = request.getParameter("target");
int tid = Integer.parseInt(target); %>
<FORM action = "dbcomment.jsp" method="get"  name = "com">
<%
	request.setAttribute("tid", target);
	request.setAttribute("userid", userid);
%>
<table border = "0" width = "300">
<tr><td>
<br><br>
</td></tr>
<tr>
<td colspan = "4">
상품번호 :
 <INPUT TYPE="text" NAME="tid" value="<%=tid%>" SIZE="5" readonly></td>
<!-- <%= tid %>&nbsp; &nbsp; &nbsp; &nbsp; -->
<td>아이디 :
<INPUT TYPE="text" NAME="userid" value="<%=userid%>" SIZE="5" readonly>
<!-- <%= user.getName() %> -->
</td></tr>
<td>
점수<INPUT TYPE="text" NAME="score" SIZE="5"></td>
<td>
댓글<INPUT TYPE="text" NAME="review" SIZE="20"></td>
<td>
<INPUT TYPE="button" VALUE="댓글쓰기" onClick="check()"> </td> </tr></table></FORM>
</body>
</html>