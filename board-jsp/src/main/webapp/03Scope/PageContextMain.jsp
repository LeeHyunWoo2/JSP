<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	pageContext.setAttribute("pageInt",	8282); // 페이지영역에 값 저장(int)
	pageContext.setAttribute("pageStr", "MBC");
	pageContext.setAttribute("PersonDTO", new Person("김기원", 40));
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageContextMain.jsp : 자바dto를 이용하여 객체 활용</title>
</head>
<body>
	<h2> PageContext 영역의 속성값 출력 </h2>
	
	<%
	int pageContextInt = (Integer)pageContext.getAttribute("pageInt");
	String pageContextStr = (String)pageContext.getAttribute("pageStr");
	// String 이 기본 타입이라서 (String) 이라고 안해도 됨
	Person person = (Person)pageContext.getAttribute("PersonDTO");
	// 위에서 만든 setAttribute를 가져온다.
	%>
	<hr>
	<h2> PageContext 영역의 속성값 출력 </h2>
	<ul>
		<li> 정수 객체 출력 : <%= pageContextInt %> </li>
		<li> 문자열 객체 출력 : <%= pageContextStr %> </li>
		<li> dto 객체 출력 : <%= person.getName() %>, <%= person.getAge() %> </li>
	</ul>

</body>
</html>