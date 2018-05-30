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
	
%>

<form action="chap1_3.jsp">
<input type="hidden" value="<%= mygrade %>" name="mygrade">
<button>다음 단계로</button>
</form>

</center>
</body>
</html>