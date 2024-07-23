<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	public int add(int num1, int num2){
	return num1 + num2;	
	}
%> <!-- 선언부 (필드,메서드) -->
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>ScriptElements.jsp : 스트립트 요소</title></head>
<body>

	<%
		int result = add(10,20); // add 메서드에 10, 20 매개값을 전달 하여 결과를 result에 넣음	
	%>

	덧셈 결과 1 : <%= result %> <br> <!-- 변수에 있는 값을 표현함 -->
	덧셈 결과 2 : <%= add(30,40) %>  <!-- 메서드를 호출해서 표현함 -->
	
</body>
</html>