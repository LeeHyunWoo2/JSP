<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.DBConPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ExeUpdate.jsp : 간단한 쿼리문 써보기</title>
</head>
<body>
	<h2>회원 추가 테스트 (executeUpdate()사용)</h2>
	<%
		DBConPool pool = new DBConPool();  // 1 + 2 단계
		
		String id = "jgj";
		String pw = "1234";
		String name = "조건재";
		
		String sql = "insert into member values (?,?,?,sysdate)";
		PreparedStatement pstmt = pool.con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		
		int result = pstmt.executeUpdate();
		out.println(result + "행에 추가 완료");
		
		pool.close(); // 5단계
	%>

</body>
</html>