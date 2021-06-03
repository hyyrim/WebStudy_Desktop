<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	request.setAttribute("result", "박나현테스트");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test01.jsp</title>
</head>
<body>

<div>
	<h1>EL 관련 실습</h1>
	<hr>
</div>

<div>
	<h2>폼 데이터 전송</h2>
	<form action="" method="post">
		정수1 <input type="text" name="su1"><br>
		정수2 <input type="text" name="su2"><br>
		<button type="submit">결과확인</button>
	</form>
</div>
<br>

<div>
	<h2>폼 데이터 수신</h2>
	
	<!-- 폼의 데이터를 수신하는 방법 1 (기존 방법) -->
	<h3><%=request.getParameter("su1") %></h3>
	
	<!-- 폼의 데이터를 수신하는 방법 2 (EL 사용) -->
	<h3>${param.su2 }</h3>
	
</div>
<br>

<div>
	<h2>폼의 데이터를 받아 연산 수행</h2>
	
	<!-- 폼의 데이터를 수신하여 연산을 수행하는 방법 1 (기존 방법) -->
	<%
		String s1str = request.getParameter("su1");
		String s2str = request.getParameter("su2");
		
		int s=0;
		
		int s1; 
		int s2;
		
		if(s1str != null && s2str != null)
		{
			s1 = Integer.parseInt(s1str);
			s2 = Integer.parseInt(s2str);
			
			s = s1 + s2;
		}
		
	%>
	<h3>합 : <%=s%></h3>
	
	<!-- 폼의 데이터를 수신하여 연산을 수행하는 방법 2 (EL 활용) -->
	<h3>합 : ${param.su1 + param.su2 }</h3>
	<!-- → 파라미터 수신도 알아서...
	     → 필요한 캐스팅도 알아서 자동으로 수행...
	     → null 을 대하는 방식 chek~!!!  -->
	
</div>
<br>

<div>
	<h2>setAttribute() 로 넘긴 데이터 수신</h2>
	
	<!-- setAttribute()로 넘긴 데이터를 수신하는 방법 1 (기존방법) -->
	<!-- getAttribute() 사용 -->
	<h3><%=request.getAttribute("result") %></h3>
	
	<!-- setAttribute()로 넘긴 데이터를 수신하는 방법 2 (EL 활용) -->
	<h3>${result }</h3>
	
</div>

</body>
</html>