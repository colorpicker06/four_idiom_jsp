<%@page import="java.util.StringTokenizer"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page import = "java.util.Calendar,java.util.Date" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.IOException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/index_design.css" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<title>회원가입</title>
</head>
<script>
function myfunction(){
	var id = document.join.id;
	var idStr = id.value;
	var pw = document.join.pw;
	var pwStr = pw.value;
	var pw_chk = document.join.pw_chk;
	var pw_chkStr = pw_chk.value;
	
	if(idStr==''||pwStr==''||pw_chkStr==''){
		alert("모두 입력해주세요");
	}
	
	if(pwStr!=pw_chkStr){
		alert("비밀번호 확인이 틀렸습니다.");
		location.href="signin.jsp";
	}
	
	else{
		alert("가입이 완료 되었습니다.");
		//location.href="mystudy.jsp";
	}
}
</script>
<body>

<center>
<div style="margin-top:5%;">
  <h3>회원가입</h3>
  <form name="join" action="joinsuccess.jsp" method="post">
  <table style="margin:0px; width:10px;">
  <tr style="margin:0px; width:10px;">
  <td style="margin:0px; width:10px;">
  <input type = "text" name="id" id ="id" placeholder="ID" required></td>
  <td rowspan="3" style="background-color:skyblue;">
  <input type = "submit" value = "Join" style="background-color:skyblue; border:0px; color:white;" onclick="myfunction();"/>
  </td>
  </tr>
  <tr>
  <td><input type = "password" name = "pw" placeholder="PW" id = "pw" required></td>
  </tr>
  <tr>
  <td><input type = "password" name = "pw_chk" id="pw_chk"  placeholder="PW_Check" required></td>
  </tr>
  </table>
  </form>
 </div>
</center>

</body>
</html>