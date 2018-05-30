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
	
		while((data=reader2.readLine())!=null){
			
			list = data.split(",");
			
			id.add(list[0]);
			pw.add(list[1]);
			grade.add(list[2]);			
			
		}
		
		for(int i=0; i<id.size(); i++){
			out.println(id.get(i));
		}
		
   
    String id2 = request.getParameter("id");
    String pw2 = request.getParameter("pw");
   
    String redirectUrl = "index.jsp"; // 인증 실패시 재요청 될 url 
    for (int i = 0; i < id.size(); i++) {
        if (id.get(i).equals(id2) && pw.get(i).equals(pw2)) {
            session.setAttribute("signedUser", id2); // 인증되었음 세션에 남김
            redirectUrl = "index_member.jsp"; // 인증 성공 시 재요청 url
        }
    }
    response.sendRedirect(redirectUrl);
%>    
    
</body>
</html>