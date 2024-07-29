<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieResult.jsp : 메인에서 만든 쿠키값 확인용</title>
</head>
<body>
	<h2> 쿠키값 확인 해보기 </h2>
	<%
		Cookie[] cookies = request.getCookies();
		if(cookies != null){ // 쿠키가 있으면
			for(Cookie c : cookies){ // 배열에 있는 모든 값을 Cookie타입에 c변수로 가져옴
				String cookieName = c.getName();
				String cookieValue = c.getValue();
				int cookieAge = c.getMaxAge();
				out.print("쿠키의 이름 : " + cookieName + " : ");
				out.print("쿠키의 값 : " + cookieValue + " : ");
				out.print("쿠키의 유효시간(초) : " + cookieAge + "<br>");
			}
		}else{ // 쿠키가 없으면
			out.print("현재 쿠키가 없습니다.");
		}
	%>

</body>
</html>