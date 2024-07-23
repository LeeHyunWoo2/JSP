<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionLocation.jsp : 세션 값 확인 해보기</title>
</head>
<body>
	<%
		ArrayList<String> lists = (ArrayList<String>)session.getAttribute("lists");
		for(String str : lists){
			out.print(str + "<br>");
		}
	%>
	
	<!-- 메인에서 작동시켜서 출력해보면 탭을 아무리 늘려도 뜨는데 (정보 유지) -->
	<!-- 브라우저를 끄고 다시켜서 링크입력해서 들어가보면 500에러뜸 (정보 증발) -->

</body>
</html>