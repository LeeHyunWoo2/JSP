<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="IncludeFile.jsp" %> <!-- 외부파일을 가져옴 -->
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>IncludeMain.jsp : 다른파일을 가져와 삽입</title></head>
<body>
	<%
	
	out.println("오늘 날짜 : " + today);
	out.println("<br>");
	out.println("내일 날짜 : " + tomorrow);
	
	%>
</body>
</html>