<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestForward.jsp : forward는 바로 넘어오는 영역 </title>
</head>
<body>
	<h2> 포워드로 전달된 페이지 입니다. </h2>
	<h3> RequestMain.jsp 속성 값 읽어오기 </h3>
	<%
		Person fPerson = (Person)request.getAttribute("reqPerson");
	%>
	RequestMain에서 전달받은 person 객체 : <%= fPerson.getName() %>, <%= fPerson.getAge() %>
	
	<h4> ?로 전달된 파라미터 출력 테스트 </h4>
	<%
		request.setCharacterEncoding("utf-8"); // post 메서드의 한글처리용
		out.print(request.getParameter("kor"));
		out.print("<br>");
		out.print(request.getParameter("eng"));
	%>

</body>
</html>