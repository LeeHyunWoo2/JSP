<%@page import="fileupload.MyfileDAO"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%> <!-- cos.jar -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//  method="post" enctype="multipart/form-data" 처리
	// cos.jar에서 필요로하는 요소 4가지 : request, 저장경로, 단일파일크기, 인코딩 방식
	String saveDirectory = application.getRealPath("/Uploads");
	// 저장할 디렉토리 http://192.168.111.101:80/board-jsp/Uploads
	// 그 앞부분까지가 getRealPath
	
try{
	// 1단계 : cos.jar 연결
	int maxPostSize = 1024 * 1024 * 100 ; // 파일 최대 크기 (1kb x 1024 = 1MB * 100 = 100MB)
	String encoding = "UTF-8";
	
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	// MultipartRequest 는 cos.jar 고 얘가 원하는 4가지를 넣어줌
	System.out.println("saveDrirectory : " + saveDirectory);
	System.out.println("maxPostSize : " + maxPostSize);
	
	// 2단계 : ofile, sfile 파일명 결정
	String fileName = mr.getFilesystemName("attachedFile");  // 현재 파일 이름
    String ext = fileName.substring(fileName.lastIndexOf("."));  // 파일 확장자
    String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
    String newFileName = now + ext;  // 새로운 파일 이름("업로드일시.확장자")

    // 3. 파일명 변경
    File oldFile = new File(saveDirectory + File.separator + fileName);
    System.out.println("oldFile : " + oldFile);
    File newFile = new File(saveDirectory + File.separator + newFileName);
    System.out.println("newFile : " + newFile);
    oldFile.renameTo(newFile);
    
    System.out.println("fileName : " + fileName);
    System.out.println("ext : " + ext);
    System.out.println("now : " + now);
    System.out.println("newFileName : " + newFileName);
    
    //4. FileUploadMain에서 넘어온 폼 값 처리 name="fileform"
    String name = mr.getParameter("name");
    String title = mr.getParameter("title");
    String[] cateArray = mr.getParameterValues("cate");
    StringBuffer cateBuf = new StringBuffer(); // add가 가능한 String
    if(cateArray == null){
    	cateBuf.append("선택 없음");
    } else {
    	for(String s : cateArray){
    		cateBuf.append(s + ", ");
    	} // 사진, 과제, 워드, 음원 이런식
    }
    
    // 5. dto에 4번 값 넣기
    
    MyfileDTO dto = new MyfileDTO();
    dto.setName(name);
    dto.setTitle(title);
    dto.setCate(cateBuf.toString());
    dto.setOfile(fileName);
    dto.setSfile(newFileName);
    
    // 6. DAO를 통해 데이터베이스에 반영
    MyfileDAO dao = new MyfileDAO();
    dao.insertFile(dto);
    dao.close();
    
    // 7. 파일 목록 JSP로 리디렉션
    response.sendRedirect("FileList.jsp"); // 성공 시 되돌아감
    
	} catch (Exception e) {
		System.out.println("UploadProcess.jsp 예외 발생");
		e.printStackTrace(); // 로그 출력
		request.setAttribute("errorMessage", "파일 업로드 오류");
		request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
	}
    
	
%>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>UploadProcess.jsp : cos.jar를 활용하여 파일처리 후 dao로 연결</title></head>
<body>
	

</body>
</html>