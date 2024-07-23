<%@page import="common.Person"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplicationMain.jsp : 톰캣이 가지고 있는 영역</title>
</head>
<body>
	<h2> Application 영역에 값 저장 </h2>
	<%
		Map<String, Person> maps = new HashMap<String, Person>();
		maps.put("stu1", new Person("이현우", 20));
		maps.put("stu2", new Person("함시은", 24));
		application.setAttribute("Amaps", maps); // application 영역에 값 저장
		out.print("값 저장 완료");
		// Applicaion 영역에 이 값이 저장되기 때문에 브라우저를 끄던말던 계속 나옴
		// 따라서 해킹당하면 치명적이므로, 직접 사용은 비권장되는 영역
	%>
</body>
</html>