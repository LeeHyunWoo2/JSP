package utils;

public class BoardPage {
	// 페이징 처리를 위한 보드 테이블 아래쪽에 블록용 태그주입

	public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl) {

		String pagingStr = "";

		// 단계 3 : 전체 페이지 수 계산
		int totalPages = (int) (Math.ceil(((double) totalCount / pageSize)));

		
		// 단계 4 : '이전 페이지 블록 바로가기' 출력
		int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
		if (pageTemp != 1) {
			pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + (pageTemp - 1) + "'>[이전 블록]</a>";
		} // [첫 페이지] [이전 블록]
		  // ?pageNum=1 ?pageNum=" + (pageTemp - 1)

		
		// 단계 5 : 각 페이지 번호 출력
		int blockCount = 1;
		while (blockCount <= blockPage && pageTemp <= totalPages) {
			if (pageTemp == pageNum) {
				// 현재 페이지는 링크를 걸지 않음
				pagingStr += "&nbsp;" + pageTemp + "&nbsp;";
			} else {
				pagingStr += "&nbsp;<a href='" + reqUrl + "?pageNum=" + pageTemp + "'>" + pageTemp + "</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		} // 6 7 8 9 10
		

		// 단계 6 : '다음 페이지 블록 바로가기' 출력
		if (pageTemp <= totalPages) {
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp + "'>[다음 블록]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages + "'>[마지막 페이지]</a>";
		} // [다음 블록] [마지막 페이지]
		  // ?pageNum=" + pageTemp
		  //               ?pageNum" + totalPages

		return pagingStr;

	}

}
