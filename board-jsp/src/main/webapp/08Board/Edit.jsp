<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%
	String num = request.getParameter("num"); // 쿼리 스트링으로 받은 번호
	BoardDAO boardDAO = new BoardDAO(application); // 1단계 2단계 처리
	BoardDTO boardDTO = boardDAO.selectView(num); // 객체로 내용을 가져와
	String sessionId = session.getAttribute("userId").toString(); // 로그인한 id 가져옴
	if(!sessionId.equals(boardDTO.getId())){ // 로그인한것과 불일치
		JSFunction.alertBack("작성자 본인만 수정 가능합니다.", out); // 경고창 + 뒤로감
		return;
	}
	boardDAO.close();
%>

<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Edit.jsp : 이미 View.jsp에 있는 객체를 가져와 수정하는 폼</title></head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>회원제 게시판 - 글 수정(Edit)</h2>
	<form name="writeFrm" method="post" action="EditProcess.jsp"
	      onsubmit="return validateForm(this);">
	      <input type="hidden"name="num"value="<%= boardDTO.getNum() %>"/> <!-- 요청값 -->
	    <table border="1" width="90%">
	        <tr>
	            <td>제목</td>
	            <td>
	                <input type="text" name="title" style="width:90%;"value="<%= boardDTO.getTitle() %>" />
	            </td>
	        </tr>
	        <tr>
	            <td>내용</td>
	            <td>
	                <textarea name="content" style="width: 90%; height: 100px;"><%= boardDTO.getContent() %></textarea>
	            </td>
	        </tr>
	        <tr>
	            <td colspan="2" align="center">
	                <button type="submit">작성 완료</button>
	                <button type="reset">다시 입력</button>
	                <button type="button" onclick="location.href='List.jsp';">
	                    목록 보기</button>
	            </td>
	        </tr>
	    </table>
	</form>
</body>
</html>