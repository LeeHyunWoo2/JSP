<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>webxmlJDBCTest.jsp : application 영역을 활용한 접속테스트</title>
</head>
<body>
	<h2>JDBC 연결 테스트(application + jsp)</h2>
	<%
		// 단점 : 매번 페이지마다 필수 코드가 있다.
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleURL");
		String id = application.getInitParameter("OracleId");
		String pw = application.getInitParameter("OraclePw");

		JDBConnect jdbc = new JDBConnect(driver, url, id, pw);
		// 1단계, 2단계 완성
		// 3단계(쿼리문 생성), 4단계(쿼리문 실행) 진행
		// 5단계(닫기)진행
		
		jdbc.close();
	
	%>
	
	

</body>
</html>