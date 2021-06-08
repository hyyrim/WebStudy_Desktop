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
<title>AjaxTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function()
	{
		$("#sendBtn").click(function()
		{
			var params = "name=" + $.trim($("#name").val())
				+ "&content=" + $.trim($("#content").val());
			
			// jQuery 의 ajax() 함수 사용(호출)
			$.ajax(
			{								// Json 형식
				type : "GET"				// 순서는 상관없고 이름과 값만 일치하면 된다.
				, url : "AjaxTest01_ok.jsp"
				, data : params				// 위의 페이지를 요청할때 전송하게 되는 데이터
				, success : function(args)	// callBack → ajax 가 성공했을때 이게 들어가겠다.
				{
					$("#resultDiv").html(args);
					
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();
				}
				, beforeSend : showRequest	// ajax 처리 하기 위해서 데이터를 전송하기 전에 무엇을 확인할지?
											// 결과값이 true / false 로 만들어주면 된다.
				, error : function(e)		// ajax 처리 과정 중 에러가 발생하면 이렇게 처리하겠다.
				{
					alert(e.responseText);
				}
			});
			
		});
	});
	
	
	function showRequest()
	{
		if (!$.trim($("#name").val()))
		{
			alert("이름을 입력해야 합니다.");
			$("#name").focus();
			return false;
		}
		
		if (!$.trim($("#content").val()))
		{
			alert("내용을 입력해야 합니다.");
			$("#content").focus();
			return false;
		}
		
		return true;
	}
	
</script>

</head>
<body>

<div>
	<h1>jQuery 의 ajax() 메소드 실습</h1>
	<hr>
</div>

<div>
	이름 : <input type="text" id="name" class="txt" /><br>
	내용
	<textarea id="content" cols="50" rows="3"></textarea>
	<br><br>
	
	<input type="button" value="등록하기" id="sendBtn" class="btn"/>
</div>
<br><br>

<div id="resultDiv">
</div>

</body>
</html>