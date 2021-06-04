<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
   
   // check
   response.setContentType("text/xml");
   
   // --AJAX객체에 데이터를 돌려줄 때 클라이언트 브라우저가 이 데이터를 XML 로 인식할 수 있도록
   // 처리해야 하기 때문에 MIME 타입을 MXL 로 선언한다.
   
   // ※ (수신해서 처리해야 하는) 데이터가 한 개 이상일 경우..
   // xml 이나 json 과 같이 구조화시킬 수 있는 데이터로 전달하는 것이
   // 처리과정에서 데이터를 다루기 용이하다(인터넷에서 본걸로는 요즘에는 json 을 더 많이 쓴다고함)
   // 우편 번호에 대한 검색 결과는 당연히 다량으 ㅣ데이터를 전송해야 하기 때문에
   // 텍스트가 아닌 xml 형태로 반환하려고 하는 것이다. 
   
%><?xml version="1.0" encoding="UTF-8"?>
<list>
   <c:forEach var="item" items="${lists}">
   <item>
      <zipcode>${item.zipCode}</zipcode>
      <address>${item.address}</address>
   </item>
   </c:forEach>
</list>