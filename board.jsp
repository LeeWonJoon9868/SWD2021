<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<BODY background="gg.jpg">
<%
String target = request.getParameter("target");
String targetpage;
if (target==null){
	targetpage="boardmid.jsp";
}
else if (target.equals("all")){
	targetpage="boardmid.jsp";
}
else{
	targetpage="boardmid.jsp?target="+target;
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>오이 마켓 게시판</title>
</head>
<body>
<jsp:include page="Navbar.jsp"/>
<jsp:include page="boardtop.jsp" flush="false" /><br>
<jsp:include page = "<%=targetpage%>" flush="false" /><br>
<jsp:include page = "boardbottom.jsp" flush="false" /><br>

</body>
</html>