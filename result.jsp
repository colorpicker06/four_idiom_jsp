<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.ArrayList"%>
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
<title>Insert title here</title>
</head>
<body>
<center>
<% 
	request.setCharacterEncoding("utf-8");

String[] list;
ArrayList<String> grade = new ArrayList<>();
ArrayList<String> id = new ArrayList<>();
ArrayList<String> pw = new ArrayList<>();

String filePath = application.getRealPath("/WEB-INF/member.txt");
BufferedReader reader2 = new BufferedReader(new FileReader(filePath));
String data="";

	while((data=reader2.readLine())!=null){
		
		list = data.split(",");
		
		id.add(list[0]);
		pw.add(list[1]);
		grade.add(list[2]);			
		
	}
	
	int num=0;
	String user = session.getAttribute("signedUser").toString();
	
	for(int i=0; i<grade.size(); i++){
		if(user.equals(id.get(i))){
			num = i;
		}
	}

	String q1 = request.getParameter("q1");
	q1 = (String)q1;
	String answer = request.getParameter("answer");
	answer = (String)answer;
	
	System.out.println(q1.getClass());
	System.out.println(answer.getClass());
	
	int mygrade = 0;
	
	if(q1.equals(answer)){
		
		out.println("정답입니당");
		mygrade = Integer.parseInt(grade.get(num));
		mygrade+=5;
		request.setAttribute("mygrade",mygrade);
		out.println("현재 나의 점수"+mygrade);
	}
	else{
		out.println("오답입니당");
		out.println("정답은 "+answer);
		out.println("현재 나의 점수"+mygrade);
	}
	
%>

<form action="chap1_1.jsp">
<button>다음 단계로</button>
<input type="hidden" value="<%= mygrade %>" name="mygrade">
</form>

</center>
</body>
</html>