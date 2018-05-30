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
<title>Insert title here</title>
</head>
<body>
<h1>회원가입 되었습니다.</h1>

<a href="mystudy.jsp"><button>Mystudy</button></a>
<a href="index_member.jsp"><button>Home</button></a>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
		try{
			//파일 쓰기
			String filePath = application.getRealPath("/WEB-INF/member.txt");
			BufferedWriter bw = new BufferedWriter(new FileWriter(filePath,true));
			bw.write(id+","+pw+",0");
			bw.newLine();
			bw.close();
		}catch(FileNotFoundException e){
			out.println("파일에 저장 못함");
		}catch(IOException e){
			System.out.println(e);
		}
%>
</body>
</html>