<%@page import="utils.CookieManager"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String save_check = request.getParameter("save_check");
	
	if("kkw".equals(user_id) && "1234".equals(user_pw)){
		// id와 pw가 같으면
		if(save_check != null && save_check.equals("Y")){
			// 아이디 저장하기를 체크했으면
			CookieManager.makeCookie(response, "loginId", user_id, 86400);
			// 쿠키 생성
		}else{
			// 안했으면
			CookieManager.deleteCookie(response, "loginId");
		}
		JSFunction.alertLocation("로그인 성공", "IdSaveMain.jsp", out);
		// 여기서 out => JSFunction에 JspWriter out 을 의미함
		
	}else{
		// 다르면
		JSFunction.alertBack("로그인 실패 id혹은 pw를 확인해주세요.", out);
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IdSaveProcess.jsp : 로그인처리 (성공or실패 + 쿠키 + 얼럿)</title>
</head>
<body>

</body>
</html>