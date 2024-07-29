<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConnectionTest.jsp : JDBC연결 테스트용</title>
</head>
<body>
	<h2>JDBC 테스트1 - 생성자편</h2>
	<%
		JDBConnect jdbConnect = new JDBConnect(); // 1단계, 2단계
		jdbConnect.close(); // 5단계
	%>

</body>
</html>