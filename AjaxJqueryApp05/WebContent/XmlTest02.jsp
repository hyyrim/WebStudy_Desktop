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
<title>XmlTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function()
	{
		$("#sendBtn").click(function()
		{
			var params = "title=" + $.trim($("#title").val())
				+ "&content=" + $.trim($("#content").val());
			
			$.ajax(
			{
				type : "POST"
				, url : "XmlTest02_ok.jsp"
				, data : params
				, dataType : "xml"
				, success : function(xml)
				{
					var out = "";
					
					$(xml).find("comment").each(function()
					{
						var item = $(this);
						var id = item.attr("id");
						var title = item.find("title").text();
						var content = item.find("content").text();
						
						out += "<br> >> id=" + id;
						out += "<br> - title=" + title;
						out += "<br> - content=" + content;
						
					})
					
					$("#resultDiv").html(out);
					
					$("#title").val("");
					$("#content").val("");
					$("#title").focus();
						
				}
				, beforeSend : showRequest
				, error : function(e)
				{
					alert(e.responseText);
					console.log(e);
				}
			
			});
		});
	});
	
	function showRequest()
	{
		var flag = true;
		
		if (!$.trim($("#title").val()))
		{
			alert("제목을 입력해주세요");
			$("#title").focus();
			flag = false;
		}
		
		if (!$.trim($("#content").val()))
		{
			alert("내용을 입력해주세요");
			$("#content").focus();
			flag = false;
		}
		
		return flag;
		
	}

</script>


</head>
<body>

<div>
	<h1>jQuery AJAX XML 관련 실습</h1>
	<hr>
</div>

<div>
	제목 : <input type="text" id="title" class="txt"><br>
	내용 : <input type="text" id="content" class="txt"><br>
	<br>
	<input type="button" value="전송확인" id="sendBtn" class="btn">
</div>
<br><br>

<div id="resultDiv">

<!--
>> id=1<br>
- title=aaaa1<br>
- content=bbbb1<br>

>> id=2<br>
- title=aaaa2<br>
- content=bbbb2<br>
-->

</div>


</body>
</html>