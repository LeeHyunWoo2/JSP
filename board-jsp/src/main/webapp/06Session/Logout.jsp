<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 방법 1 : 회원인증정보 속성 삭제
session.removeAttribute("userId");
session.removeAttribute("UserName");

// 방법 2 : 모든 속성 한꺼번에 삭제
session.invalidate();
// 위 2개중 상황or취향에 맞게 택1해서 쓰면 될듯

// 속성 삭제 후 페이지 이동
response.sendRedirect("LoginForm.jsp");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout.jsp : 로그아웃 구현</title>
</head>
<body>


</body>
</html>