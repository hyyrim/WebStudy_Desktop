<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); 	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PostTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.txtNum
	{
		width: 100px;
		text-align: right;
	}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	// ○ 『$.post(url, data, callback);』
	//     - 매개변수로 넘겨받은 url 을 사용하여 서버에 대한 POST 요청을 전송한다.
	//	     · url      : (String) POST 메소드로 연결하는 서버 측 URL
	//	     · data     : (Object) 이름과 값이 쌍으로 프로퍼티를 가진 객체.
	//	  			       미리 구성 및 인코딩 된 쿼리 스트링.
	//	     · callback : (Function) 요청이 완료되면 호출되는 함수.
	
	$(function()
	{
		$("#sendButton").click(function()
		{
			var su1 = $("#su1").val();
			var su2 = $("#su2").val();
			var oper = $("#oper").val();
			
			// check~!!!
			// post 방식
			$.post("PostTest01_ok.jsp"
			, {su1 : su1, su2 : su2, oper : oper}
			, function(args)
			{
				$("#result").html(args);		
			})
		})
	});

</script>

</head>
<body>

<div>
	<h1>jQuery 의 post() 메소드 실습</h1>
	<hr>
</div>

<!-- jQuery 에서 Ajax 처리를 get/post 방식을 선택적으로 처리할 수 있다. -->

<div>
	<input type="text" id="su1" class="txt txtNum">
	<select id="oper">
		<option value="add">덧셈</option>
		<option value="sub">뺄셈</option>
		<option value="mul">곱셈</option>
		<option value="div">나눗셈</option>
	</select>
	<input type="text" id="su2" class="txt txtNum">
	<input type="button" value=" = " id="sendButton" class="btn">
</div>
<br>
<div id="result">
</div>

</body>
</html>