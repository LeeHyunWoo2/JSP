<%@page import="utils.JSFunction"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	try{
	String saveDirectory = application.getRealPath("./Uploads"); //가져올 폴더
	String saveFileName = request.getParameter("sName"); // 저장 파일명
	String originalFileName = request.getParameter("oName"); // 원본 파일명
	
	// 하드디스크에 있는 파일을 찾아 와야 함
	
	File file = new File(saveDirectory, saveFileName); // 경로와 파일명으로 객체 생성
	InputStream inputStream = new FileInputStream(file); // 바이트형식으로 객체 생성
	
	// 윈도우용(ksc5601), 리눅스용(utf-8), 유닉스용(utf-8)
	String client = request.getHeader("User-Agent"); // 웹 브라우저 종류 판단하는 키
	if(client.indexOf("WOW64") == -1){
		originalFileName = new String(originalFileName.getBytes("utf-8"),"iso-8859-1");
		// 리눅스, 유닉스 (크롬 브라우져, 파이어폭스, 모질라)
	} else {
		originalFileName = new String(originalFileName.getBytes("ksc5601"), "iso-8859-1");
		// 윈도우 (ie = internet Explorer)
	}
	
	
	// 파일 다운로드용 응답 헤더 설정
	response.reset(); // 초기화
	response.setContentType("application/octet-stream"); // 8비트씩 처리(1byte)
	response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFileName + "\"");
	// 응답헤더에 파일명을 보냄
	response.setHeader("Content-Length", "" + file.length());
	// 응답헤더에 파일크기를 보냄
	out.clear(); // 출력 스트림 초기화
	
	
	// 출력 스트림에 파일 내용 출력
	OutputStream outputStream = response.getOutputStream(); // 출력용 객체 응답헤더에 생성
	
	byte b[] = new byte[(int)file.length()]; // 파일의 크기만큼 배열 생성
	int readBuffer = 0;
	while((readBuffer = inputStream.read(b))>0){
		outputStream.write(b, 0, readBuffer); // 다운로드에서 내 하드에 저장
	}
	inputStream.close();
	outputStream.close();
	} catch (FileNotFoundException e) {
		JSFunction.alertBack("파일을 찾을 수 없습니다.", out);
		e.printStackTrace();
	} catch (Exception e){
		JSFunction.alertBack("다운로드중 예외 발생.", out);
		e.printStackTrace();
	}
%>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Download.jsp : 파일 다운로드용 프로세서</title></head>
<body>
	

</body>
</html>