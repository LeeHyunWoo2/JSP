<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Exception.jsp : 에러페이지</title></head>
<body>
	<%
		int status = response.getStatus(); // 오류코드가 정수 타입으로 넘어옴
		
		if(status == 404){
			out.print("404  에러가 발생했습니다.");
			out.print("<br> 파일 경로를 확인해 주세용!!!");
		}else if(status == 405){
			out.print("405  에러가 발생했습니다.");
			out.print("<br> 요청방식(method)을 확인해 주세용!!!");
		}else if(status == 500){
				out.print("500  에러가 발생했습니다.");
				out.print("<br> 서버코드 에러 발생 관리자에게 문의하세요!!!");
		}
	
	%>
</body>
</html>