<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<BODY background="gg.jpg">
<SCRIPT LANGUAGE="JAVASCRIPT">
function check(){
	var title = document.reg.title;
	var price = document.reg.price;
	var info = document.reg.info;
	if(title.value==""){
		alert("제목을 입력해 주세요");
		document.reg.title.focus();
		return false;
	}
	if(info.value==""){
		alert("본문을 입력해 주세요");
		document.reg.info.focus();
		return false;
	}
	if(price.value==""){
		alert("가격을 입력해 주세요");
		document.reg.price.focus();
		return false;
	}
	document.reg.submit();
}
</SCRIPT>
</head>
<body>
<jsp:include page="Navbar.jsp"/>
<FORM action = "dbreg2.jsp" enctype="multipart/form-data" method="post"  name = "reg">
<TABLE WIDTH="600" HEIGHT="350" BORDER="1" CELLPADDING="6" ALIGN="center">
<TR>
<TD> 글 제목 </TD>
<TD> <INPUT TYPE="text" NAME="title" SIZE="20"></TD></TR>
<TR>
<TD> 카테고리 </TD>
<TD>
<select name="cat">
<option selected>cloth</option>
<option>life</option>
<option>game</option>
<option>etc</option>
</select>
</TD>
</TR>
<TR>
<TD> 본문 </TD>
<TD> 
<INPUT TYPE="text" NAME="info" SIZE="100"> </TD></TR>
<TR>
<TD> 가격 </TD> 
<TD> <INPUT TYPE="number" NAME="price" SIZE="10"></TD></TR>

<TD>사진</TD>
<TD> 
<input type="file" name="upfile">&nbsp;&nbsp;  
</TD></TR>


<TR>
<TD COLSPAN="2" ALIGN="center">
<INPUT TYPE="button" VALUE="등록" onClick="check()">&nbsp;&nbsp;
<INPUT TYPE="reset" VALUE="취소하기"></TD></TR>
</TABLE></FORM></body></html>