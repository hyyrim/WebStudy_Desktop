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
<title>XmlTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function()
	{
		$("#sendBtn").click(function()
		{
			var params = "name=" + $.trim($("#name").val())
				+ "&content=" + $.trim($("#content").val());
			
			$.ajax(
			{
				type : "POST"
				, url : "XmlTest01_ok.jsp"
				, data : params
				, dataType : "xml"			//-- check~!!! xml 을 다루기 위해 써줘야함
				, success : function(args)	// args 로 받게되는건 XmlTest01.jsp 의 xml 을 다 받게되는 것
				{
					var out = "";
					out = ">> 게시물 갯수 : " + $(args).find("total_dataCount").text() + "<br>";	
					// ★find 함수★를 통해 total_dataCount 의 text 를 찾아라
					
					// check~!!!
					// comment 는 5개이기 때문에 이 때 쓰는 함수가 each()
					$(args).find("comment").each(function()
					{
						var item = $(this);
						var num = item.attr("num");
						var name = item.find("name").text();
						var content = item.find("content").text();
						
						out += "<br>=============================";
						out += "<br> 번호 : " + num;
						out += "<br> 이름 : " + name;
						out += "<br> 내용 : " + content;
						out += "<br>=============================<br>";
						
					});
					
					$("#resultDiv").html(out);
					
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();
					
				}
				, beforeSend : showRequest	// true / false
				, error : function(e)
				{
					alert(e.responseText);	// (클라이언트)
					console.log(e);			// 이렇게 찍기도 한다. (서버)
				}
			});
			
		});
	});
	
	function showRequest(xhr)
	{
		var flag = true;
		
		if (!$.trim($("#name").val()))	// 공백이 제거된 이름 문자열이 없으면
		{
			alert("이름을 입력해야 합니다.");
			$("#name").focus();
			flag = false;
		}
		
		if (!$.trim($("#content").val()))
		{
			alert("내용을 입력해야 합니다.");
			$("#content").focus();
			flag = false;
		}
		
		return flag;
	}
	
</script>

</head>
<body>

<div>
	<h1>jQuery 의 ajax() 메소드 실습</h1>
	<p>xml control</p>
	<hr>
</div>

<div>
	이름 : <input type="text" id="name" class="txt"><br>
	내용
	<textarea id="content" cols="50" rows="3"></textarea>
	<br><br>
	
	<input type="button" value="등록하기" id="sendBtn" class="btn">
</div>
<br><br>

<div id="resultDiv">
</div>


</body>
</html>