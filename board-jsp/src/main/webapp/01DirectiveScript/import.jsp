<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>import.jsp (외부패키지연동)</title>
</head><body>
<%
Date today = new Date();  // 날짜용 객체 생성
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 타입변환(포멧팅)
String todaySTR = simpleDateFormat.format(today);  // 적용해서 변수에 넣음
out.println("오늘 날짜 : " + todaySTR);

%> <!-- 스크립틀릿 : 자바의 원시코드 -->


</body>
</html>