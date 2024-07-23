<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>webxmlAPPJDBCTest.jsp : application 만 활용한 접속테스트</title>
</head>
<body>
	<h2>JDBC 연결 테스트 ver2 (application만 사용)</h2>
	<%
		JDBConnect jdbc = new JDBConnect(application);
		jdbc.close();
	%>


</body>
</html>