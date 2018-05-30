<%@page import="java.util.Random"%>
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
<title>사자성어 게임_chap1_1</title>
<link rel="stylesheet" href="css/index_design.css" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
</head>
<body>
<script>
window.onkeydown = function() {
	var kcode = event.keyCode;
	if(kcode == 8 || kcode == 116) event.returnValue = false;
}
</script>
<%
request.setCharacterEncoding("utf-8");
String[] list;
ArrayList<String> result = new ArrayList<>();
ArrayList<String> result2 = new ArrayList<>();
ArrayList<String> result3 = new ArrayList<>();
ArrayList<String> imgsrc = new ArrayList<>();
//text 파일의 사자성어 랜덤으로 출력하기
String filePath = application.getRealPath("/WEB-INF/four_idiom/question.txt");
BufferedReader reader2 = new BufferedReader(new FileReader(filePath));
String data="";

	while((data=reader2.readLine())!=null){
		
		list = data.split("#");
		
		result.add(list[0]);
		result2.add(list[1]);
		result3.add(list[2]);
		imgsrc.add(list[3]);

	}
	
	int count = result.size();
	
	//4문제 랜덤 뽑기
	Random random = new Random();
	
	int[] randomnum = new int[4];
	
	int ran = 0, ran2 = 0;
	boolean cheak;
	Random r = new Random();
	
	for(int i = 0; i<randomnum.length; i++){
		ran = r.nextInt(count);
		cheak = true;
		for(int j = 0; j<i; j++){
			if(randomnum[j]==ran){
				i--;
				cheak=false;
			}
		}
		if(cheak){
			randomnum[i] = ran;
		}
		
	}
	
	  int a[] = new int[6];
	  Random r2 = new Random();
	  for(int i=0;i<4;i++)
	  {
	      a[i] = r.nextInt(4);
	      for(int j=0;j<i;j++)
	      {
	          if(a[i]==a[j])  
	          {
	              i--;
	          }
	      }
	  }

	  //String answer = "ss";
	  
	 
request.setCharacterEncoding("utf-8");
String q1 = request.getParameter("q1");
String answer = result2.get(randomnum[0]);	

%>

<center>
<h1>1단계</h1>

<img src ="<%= imgsrc.get(randomnum[0]) %>" width=50% > <br><br>

<form action="result.jsp">

<input type="hidden" value="<%= answer %>" name="answer">
<table>

<tr>

<td>
<pre>
<input type="radio" name="q1" value="<%= result2.get(randomnum[a[0]]) %>" required>
<%= result.get(randomnum[a[0]]) %>
<%= result2.get(randomnum[a[0]]) %>
<%= result3.get(randomnum[a[0]]) %>
</pre>
</td>

<td>
<pre>
<input type="radio" name="q1" value="<%= result2.get(randomnum[a[1]]) %>" required>
<%= result.get(randomnum[a[1]]) %>
<%= result2.get(randomnum[a[1]]) %>
<%= result3.get(randomnum[a[1]]) %>
</pre>
</td>

</tr>

<tr>

<td>
<pre>
<input type="radio" name="q1" value="<%= result2.get(randomnum[a[2]]) %>" required>
<%= result.get(randomnum[a[2]]) %>
<%= result2.get(randomnum[a[2]]) %>
<%= result3.get(randomnum[a[2]]) %>
</pre>
</td>

<td>
<pre>
<input type="radio" name="q1" value="<%= result2.get(randomnum[a[3]] ) %>" required>
<%= result.get(randomnum[a[3]]) %>
<%= result2.get(randomnum[a[3]]) %>
<%= result3.get(randomnum[a[3]]) %>
</pre>
</td>
</tr>
</table>

<input type="submit" value="제출">
</form>

<script type="text/javascript">

<%--
function popupOpen(){
	
	if(<%=q1%>==<%=result.get(randomnum[0])%>){
		pageContext.forward("chap1_2.jsp");
	}
	
	else{
		var popUrl = "result.jsp";	//팝업창에 출력될 페이지 URL

		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

			window.open(popUrl,"",popOption);
	}

	

	}
	--%>

</script>

</center>
</body>
</html>