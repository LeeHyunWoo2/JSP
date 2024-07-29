<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PopupCookie.jsp : get으로 받은 결과로 쿠키 생성</title>
</head>
<body>
		<%
			String checkValue = request.getParameter("inActiveToday");
			System.out.println(checkValue);
			
			if(checkValue != null && checkValue.equals("1")){
				Cookie cookie = new Cookie("popupClose","off"); // 쿠키생성하면서 (이름, 값) 넣음
				cookie.setPath(request.getContextPath()); // 보통 이걸로 많이 쓴다함 contextpath
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
				System.out.println("쿠키 생성 완료");
				System.out.println(cookie.getName());
				System.out.println(cookie.getValue());
			}
		%>


</body>
</html>