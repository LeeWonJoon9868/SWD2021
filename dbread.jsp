<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,
                           com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
                           java.io.File" %>
<%@ page import="bean.ConnectionContext" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<BODY background="gg.jpg">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 정보 </title>
</head>
<jsp:include page="Navbar.jsp"/>
<SCRIPT LANGUAGE="JAVASCRIPT">
function buy(sold,id){
	var check=sold;
	var tid=id;

	if (check==1){
		alert("ALREADY SOLD!");
		history.go(-1);
	}
	else{
		window.open("buy.jsp?target="+id);
	}
	
}

window.onload = function() {
    if(!window.location.hash) {
        window.location = window.location + '#loaded';
        window.location.reload();
    }
    
}

function Love(tid){
	location.replace("dblove.jsp?target="+tid);
}

</SCRIPT>

<body>
<jsp:useBean id="user" class = "bean.Member" scope = "session"/>
<%
String target = request.getParameter("target");
%>
<%
int check=0;
int tid = Integer.parseInt(target);
String title =null;
String cat = null;
String info = null;
int price = 0;
Date date = new Date();
Date updated = new Date();
String num = null;
String sold=null;
int cid = 0;
Connection conn = ConnectionContext.getConnection();
Statement stmt = conn.createStatement(); 
ResultSet rs = stmt.executeQuery("SELECT * FROM item WHERE tid="+tid);
while (rs.next()){
	title = rs.getString("title");
	cid = rs.getInt("cid");
	
	cat = rs.getString("cat");
	info = rs.getString("info");
	price = rs.getInt("price");
	date = rs.getDate("date");
	updated = rs.getDate("updated");

	sold = rs.getString("sold");
	if (sold.equals("yes")){
		check=1;
	}
	else
		check=0;
	
} 

%>
<TABLE WIDTH="600" HEIGHT="350" BORDER="1" CELLPADDING="6" ALIGN="center">
<TR>
<TD> 글 제목 </TD>
<TD> <%=title %></TD></TR>
<TR>
<TD> 카테고리 </TD>
<TD> <%= cat %>
</TD>
</TR>
<TR>
<TD> 본문 </TD>
<TD> 
<%= info %></TD></TR>
<TR>
<TD> 가격 </TD> 
<TD> <%= price %></TD></TR>
<TR>
<TD>작성일</TD>
<TD> 
<%= date %>&nbsp;&nbsp;  
</TD></TR> 
<TD>사진</TD>&nbsp;&nbsp;  
<Td>
<img id="photoImage" src="view.jsp?parameter=<%=tid%>" width="100" onerror="this.src='no_img.gif';" />
</TD></TR>

<%if(sold.equals("yes")) { %>
<TD>판매일</TD>
<TD> 
<%= updated %>&nbsp;&nbsp;  판매완료!
</TD></TR> 
<%} %>
<% if(user.isLogin()){ %>
<TR>
<TD COLSPAN="2" ALIGN="center">
<INPUT TYPE="button" VALUE="BUY" onClick="buy(<%=check%>,<%=tid%>)"></TD>
<TD COLSPAN="2" ALIGN="center">
<INPUT TYPE="button" VALUE="관심" onClick="Love(<%=tid%>)"></TD>
</TR>
<%} %>
</table>
<TABLE WIDTH="400" HEIGHT="350" BORDER="1" CELLPADDING="6" ALIGN="center">
<tr><td>
댓글

<% if(user.isLogin()){ %>
<jsp:include page="writecomment.jsp" flush = "false">
<jsp:param name="target" value= "<%=tid%>" /></jsp:include>
</tr></td> 
<%} %>
</TABLE>
<TABLE WIDTH="400" HEIGHT="350" BORDER="1" CELLPADDING="6" ALIGN="center">
<tr><td>
<jsp:include page="Comment.jsp" flush = "false">
<jsp:param name="target" value= "<%=tid%>" />
</jsp:include> 
</td></tr></TABLE>
</body>
</html>