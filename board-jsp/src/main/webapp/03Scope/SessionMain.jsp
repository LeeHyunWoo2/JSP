<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionMain.jsp : 세션영역 값 유지 확인</title>
</head>
<body>
	<%
		ArrayList<String> arrayList = new ArrayList<String>(); // 뒤에쪽은 <String> 안써도 됨
		arrayList.add("MBC");
		arrayList.add("아카데미");
		arrayList.add("컴퓨터");
		arrayList.add("교육센터");
		
		session.setAttribute("lists", arrayList); // 리스트 컬렉션으로 객체를 세션에 저장
	%>
	<h2> 세션 영역에 리스트 저장 완료 </h2>
	
	<a href="SessionLocation.jsp">SessionLocation.jsp로 이동</a>

</body>
</html>