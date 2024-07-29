<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>IncludeFile.jsp : 날짜 정보를 가지고 있는 페이지</title>
</head>
<body>
	<%
	LocalDate today = LocalDate.now() ; //오늘 날짜를 가지고 있는 객체
	
	LocalDateTime tomorrow = LocalDateTime.now().plusDays(1); // 내일 날짜
	
	%>
	
</body>
</html>