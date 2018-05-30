<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index_design.css" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
</head>
<body>

<center>
<h1>사 자 성 어 게 임</h1>
<div class="container">
    <a href="chap1.jsp" title="Button push blue/green" class="button btnPush btnBlueGreen">Chap1</a>
    <a href="chap2.jsp" title="Button push lightblue" class="button btnPush btnLightBlue">Chap2</a>
    <a href="chap3.jsp" title="Button push orange" class="button btnPush btnOrange">Chap3</a>
    <div class="clear"></div><br><br><br><br>
  </div>
</div>
  
  <div>
  <h3>로그인</h3>
  <form action="login.jsp" method="post">
  <table style="margin:0px; width:10%;">
  <tr style="margin:0px; width:10px;">
  <td style="margin:0px; width:10px;"><input type = "text" name="id" id = "id" placeholder="ID"/></td>
  <td rowspan="2" style="background-color:skyblue;">
  <input type = "submit" value = "login" style="background-color:skyblue; border:0px; color:white;"/>
  </td>
  </tr>
  <tr>
  <td><input type = "password" name = "pw" placeholder="PW" id = "pw"/></td>
  </tr>
  </table>
  <a href ="signin.jsp" style="color:white;">Join</a>  
  </form>
  
  </div>

</center>
</body>
</html>