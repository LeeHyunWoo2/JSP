<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>RequestWebInfo.jsp : request 요청 처리용 페이지</title></head>
<body>

	<h2>1. RequestMain.jsp에서 넘어온 값 확인용</h2>
	<ul> <!-- ul태그는 순서없는 리스트 번호용 -->
		<li> <!-- 리스트 출력용 -->
		<%= request.getParameter("eng") %>
		</li>
		<hr>
		<li>
		<%= request.getParameter("han") %>
		</li>
	</ul>


</body>
</html>