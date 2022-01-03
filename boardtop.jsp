<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD</title>
</head>
<script language="javascript">

function gowrite(){
	window.open("Write.jsp");
}

function sort(){
	var select=document.getElementById("list");
	var selectvalue=select.options[select.selectedIndex].value;
	window.location.replace("board.jsp?target="+selectvalue);

	
}
function sort2(){
	var select=document.getElementById("list2");
	var selectvalue=select.options[select.selectedIndex].value;
	window.location.replace("board.jsp?target="+selectvalue);

	
}
</script>


<body>

<label for ="pet_select">Sort list:</label>

<select name="list" id="list" onchange='sort()'>
<option selected></option>
<option value="cloth">cloth</option>
<option value="game">game</option>
<option value="life">life</option>
<option value="etc">etc</option>
</select>

<select name="list2" id="list2" onchange='sort2()'>
<option selected></option>
<option value="pricehigh">높은 가격 순</option>
<option value="pricelow">낮은 가격 순</option>
<option value="recent">최신 순</option>
</select>

</body>
</html>