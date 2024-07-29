<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.DBConPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ExeQuery.jsp</title>
</head>
<body>
	<h2>회원 목록 테스트 (executeQuery()사용)</h2>
	<%
	
	DBConPool pool = new DBConPool();  // 1 + 2 단계
	
	String sql = "select id pass name regidate from member";
	Statement stmt = pool.con.createStatement();
	
	ResultSet set = stmt.executeQuery(sql);
	
	while(set.next()){
		String id = set.getString(1);
		String pass = set.getString(2);
		String name = set.getString("name");
		java.sql.Date regidate = set.getDate("regidate");
		
		out.println(String.format("%s %s %s %s",id ,pass, name, regidate) + "<br/>");
		
	}
	pool.close();
	
	%>
		

</body>
</html>