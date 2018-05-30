<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.ArrayList"%>

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
<%  
request.setCharacterEncoding("UTF-8");


String[] list;
ArrayList<String> id = new ArrayList<>();
ArrayList<String> pw = new ArrayList<>();
ArrayList<String> grade = new ArrayList<>();

String filePath = application.getRealPath("/WEB-INF/member.txt");
BufferedReader reader2 = new BufferedReader(new FileReader(filePath));
String data="";
String data2="";

	while((data=reader2.readLine())!=null){
		
		list = data.split(",");
		
		id.add(list[0]);
		pw.add(list[1]);
		grade.add(list[2]);			
		
	}

// 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
    if (session.getAttribute("signedUser") == null) {
        response.sendRedirect("logout.jsp");
    }

	int num=0;
	String user = session.getAttribute("signedUser").toString();
	
	for(int i=0; i<id.size(); i++){
		if(user.equals(id.get(i))){
			num = i;
			out.println(num);
		}
	}
	
	String filePath3 = application.getRealPath("/WEB-INF/grade.txt");
	BufferedReader reader3 = new BufferedReader(new FileReader(filePath3));
	String[] list2;
	ArrayList<String> gradeid = new ArrayList<>();
	ArrayList<String> mygrade = new ArrayList<>();
	int final1=0;
	
	while((data2=reader3.readLine())!=null){
			
			list2 = data2.split(",");
			
			mygrade.add(list2[0]);
			gradeid.add(list2[1]);
			
		}
	
	for(int i=0; i<mygrade.size(); i++){
		if(session.getAttribute("signedUser").equals(gradeid.get(i))){
			final1 = Integer.parseInt(mygrade.get(i));
			for(int j=0; j<i; j++){
				if(gradeid.get(i).equals(gradeid.get(j))){
					final1 += Integer.parseInt(mygrade.get(i));
				}
			}
		}
	}
	
%>
<h1><%= session.getAttribute("signedUser") %>님 <small>의 마지막 시험 점수는<%= final1 %></small></h1>

<a href="logout.jsp">로그아웃</a>
<a href="index_member.jsp"><button>홈으로 가기</button></a>
</body>
</html>