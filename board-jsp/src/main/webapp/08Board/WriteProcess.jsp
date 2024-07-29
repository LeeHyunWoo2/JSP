<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %> <!-- 로그인 여부 판단 -->
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content"); // Write.jsp 에서 넘어온 값
	
	BoardDTO boardDTO = new BoardDTO(); // 빈 객체 생성
	boardDTO.setTitle(title);
	boardDTO.setContent(content);
	boardDTO.setId(session.getAttribute("userId").toString());
	// 세션 영역에 있는 값은 객체라서 toString 으로 바꿔넣어야함
	
	//객체에 제목, 내용, 작성자 보관 완료
	
	// 3, 4단계 적용
	BoardDAO boardDAO = new BoardDAO(application); // 1, 2단계
	int result = boardDAO.insertWrite(boardDTO); // 3, 4단계
	
/* 	int result = 0;
	for(int i=1; i<100; i++){ // 글쓰기 1번에 100개 만들어짐
		boardDTO.setTitle(title + "-" + i);
		result = boardDAO.insertWrite(boardDTO);
	} */
	
	boardDAO.close(); // 5단계
	
	if(result == 1){
		// insert 결과값이 1이면 성공
		response.sendRedirect("List.jsp"); // 성공 시 리스트로 감
	} else {
		// 실패
		JSFunction.alertBack("글 저장 실패", out);
	}
	
	
%>