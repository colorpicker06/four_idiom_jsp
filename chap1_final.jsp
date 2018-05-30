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
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/index_design.css" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<center>
<% 
	request.setCharacterEncoding("utf-8");

	String q1 = request.getParameter("q1");
	q1 = (String)q1;
	String answer = request.getParameter("answer");
	answer = (String)answer;
	
	int mygrade = Integer.parseInt(request.getParameter("mygrade"));
	
	if(q1.equals(answer)){
		out.println("정답입니당");
		mygrade+=5;
		out.println(mygrade);
		
	}
	else{
		out.println("오답입니당");
		out.println("정답은 "+answer);
		out.println("현재 나의 점수"+mygrade);
	}

	
	try{
		//파일 쓰기
		String filePath2 = application.getRealPath("/WEB-INF/grade.txt");
		BufferedWriter bw = new BufferedWriter(new FileWriter(filePath2,true));
		bw.write(mygrade+","+session.getAttribute("signedUser").toString());
		bw.newLine();
		bw.close();
	}catch(FileNotFoundException e){
		out.println("파일에 저장 못함");
	}catch(IOException e){
		System.out.println(e);
	}
	
		
%>

<form action="chap2.jsp">
<button>1단계 업!!</button>
</form>

<form action="index_member.jsp">
<button>홈으로 가기</button>
</form>



</center>
</body>
</html>