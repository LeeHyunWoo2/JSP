<%@page import="memberShip.MemberDTO"%>
<%@page import="memberShip.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginProcess.jsp : form으로 받은 request값 처리</title>
</head>
<body>
<!-- DTO와 DAO를 이용하여 로그인 처리 -->

	<%
		String userId = request.getParameter("user_id");
		String userPass = request.getParameter("user_pw");
		// form에서 넘어온 데이터를 변수로 넣음
		
		// DAO는 web.xml 2번째 생성자로 적용
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleURL");
		String id = application.getInitParameter("OracleId");
		String pw = application.getInitParameter("OraclePw");
		
		MemberDAO memberDAO = new MemberDAO(driver, url, id, pw); // 1단계 2단계
		MemberDTO memberDTO = memberDAO.getMemberDTO(userId, userPass); // 3단계 4단계
		memberDAO.close(); // 5단계
		// id, pass를 넣고 객체를 받음 -> 성공 dto, 실패 null
		
		// 성공시 세션 -> 실패는 돌아감
		if(memberDTO.getId() != null){
			// db에 정보가 있음
			session.setAttribute("userId", memberDTO.getId()); // 세션에 id 넣음. 비번 넣으면 보안상 위험함
			session.setAttribute("UserName", memberDTO.getName()); // 세션에 name 넣음
			// 돌아가야함
			response.sendRedirect("LoginForm.jsp");
		} else{
			// db에 정보가 없음
			request.setAttribute("LoginErrMsg", "id나 pw를 확인해주세요");
			request.getRequestDispatcher("LoginForm.jsp").forward(request, response); // 이 행은 공식마냥 그냥 외워다 쓰는게 좋다
		}
	%>

</body>
</html>