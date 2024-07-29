<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>RequestMain.jsp : 요청에 대한 처리를 담당</title></head>
<body>
	<!-- request는 클라이언트(고객)가 값을 요청할 때 처리되는 내장된 메모리 영역 -->
	<!-- 메서드는 2개가 있는데 get방식, post방식 이 있다. -->
	<!-- get방식은 url을 통해서 요청하는 방법 : 가볍다, 보안상 좋지 않다. -->
	<!-- post방식은 body를 통해서 요청하는 방법 : 보안상 좋고, 대용량 처리가 가능, 무겁다. -->

	<h1> 1. 클라이언트와 서버의 환경정보 읽기 </h1>
	<a href="./RequestWebInfo.jsp?eng=hello&han=안녕"> get방식의 url로 요청함</a>
	<br>
	<hr>
	<form action="RequestWebInfo.jsp" method="get">
	영어 : <input type="text" name="eng" value="Bye" /><br>
	한글 : <input type="text" name="han" value="잘가" /><br>
			<input type="submit" value="get버튼" />	
	</form>
	<hr>
	<form action="RequestWebInfo.jsp" method="post">
	영어 : <input type="text" name="eng" value="Bye" /><br>
	한글 : <input type="text" name="han" value="잘가" /><br>
			<input type="submit" value="post버튼" />	
	</form>
	<hr>
	<h2> 2. 클라이언트의 요청 매개변수 읽기</h2>
	<form method="post"  action="RequestParameter.jsp">
	아이디 : <input type="text" name="id" value="" /> <br>
	
	성별 : <!-- radio : 단일선택용 -->
		<input type="radio" name="sex" value="man" />남자
		<input type="radio" name="sex" value="woman" />여자 <br>
	
	관심사항 : <!--checkbox : 복수선택용  -->
		<input type="checkbox" name="favo" value="eco" />경제
		<input type="checkbox" name="favo" value="pol" />정치
		<input type="checkbox" name="favo" value="ent" />연예 <br>
	
	자기소개 : <!-- textarea : 설명창  -->
		<textarea rows="4" cols="30" name="intro">자기소개합니다.</textarea> <br>
	
		<input type="submit" value="전송" />
		<!-- <input type="submit"> 전송 </input> -->
		
	</form>
	
	<hr>
	<h3> 3. HTTP 요청 헤더 정보 읽기 </h3> <!-- 요청자의 정보를 알고 싶을 때 사용  -->
	<a href="RequestHeader.jsp"> 환영합니다. </a>
	
</body>
</html>