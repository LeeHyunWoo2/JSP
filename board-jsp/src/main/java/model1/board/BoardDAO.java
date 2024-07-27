package model1.board;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {

	// 생성자를 이용해서 1단계, 2단계를 처리
	public BoardDAO(ServletContext application) {
		super(application); // (3번째방법) 개선한 JDBC 연결
	}

	// board 테이블의 게시물 갯수를 알아와야 함!!!!
	public int selectCount(Map<String, Object> map) {
		// 스트링,스트링 해도 되지만 오브젝트로 하면 날짜 정수 등등 다받아짐
		int totalCount = 0; // 리턴값

		// 3단계 : 쿼리문 생성
		String query = "select count(*) from board";

		if (map.get("searchWord") != null) {
			// 검색어가 있으면
			query += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
			// searchField : 제목, 내용, 작성자
			// searchWord : input text로 넘어온 글자
			// select count(*) from board where 제목 like '%검색어%' ;
			// 붙여서 쓰는거니까 띄어쓰기 조심
		} // 검색어가 있으면 조건이 추가 된다.

		// 4단계 : 쿼리문 실행
		try {
			statement = connection.createStatement(); // 쿼리문 연결
			resultSet = statement.executeQuery(query); // 쿼리문을 실행하여 결과를 표로 받음
			resultSet.next();
			totalCount = resultSet.getInt(1); // 첫번째 칼럼 값을 가져옴.
			System.out.println("totalCount : " + totalCount);
		} catch (SQLException e) {
			System.out.println("BoardDAO.selectCount()메서드 오류");
			System.out.println("게시물 개수를 구하는 오류 발생");
			e.printStackTrace();
		}
		return totalCount;
	}

	
	
	
	// 게시물의 리스트 출력
	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> listBoardDTO = new Vector<BoardDTO>();

		// 3단계 : 쿼리문 생성
		String query = "select B.*, M.name from member M inner join board B on M.id = B.id";
		// 조건 추가 (조건이 추가될 수 있으니 Map으로 받아온것)
		if (map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
		} // 검색어 조건 추가 (위에서 복붙한거)
		
		query += " order by num desc"; // 정렬 기준 추가
		// 3단계 쿼리문 완성
		
		try {
			// 4단계 : 쿼리문 실행
			statement = connection.createStatement(); // 쿼리문 생성
			resultSet = statement.executeQuery(query); // 쿼리문 실행 후 결과표 완성
			
			// 위 메서드는 결과가 하나만 나오니까 루프 안돌렸지만 여기선 while 씀
			
			while(resultSet.next()) {
				BoardDTO boardDTO = new BoardDTO(); // 빈 객체 생성
				boardDTO.setNum(resultSet.getString("num"));
				boardDTO.setId(resultSet.getString("id"));
				boardDTO.setTitle(resultSet.getString("title"));
				boardDTO.setContent(resultSet.getString("content"));
				boardDTO.setPostdate(resultSet.getDate("postdate"));
				boardDTO.setVisitcount(resultSet.getString("visitcount"));
				// name 필드 null
				boardDTO.setName(resultSet.getString("name"));
				
				listBoardDTO.add(boardDTO); // 위에서 만든 객체를 리스트에 넣음
				
			} // while 종료
		} catch (SQLException e) {
			System.out.println("BoardDAO.selectList() 메서드 오류");
			System.out.println("board테이블 모든리스트 출력 오류");
			e.printStackTrace();
		}
		return listBoardDTO;
	}
	
	
	// 게시글 등록용 메서드
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		
		// 3단계
		
		String query = "insert into board(num, title, content, id, visitcount) values(seq_board_num.nextval, ?, ? ,? ,0)";
		
		try {
			preparedStatement = connection.prepareStatement(query); // 쿼리문 연결
			preparedStatement.setString(1, dto.getTitle());
			preparedStatement.setString(2, dto.getContent());
			preparedStatement.setString(3, dto.getId()); // 쿼리문 완성 (인파라미터)
			
			result = preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("BoardDAO.insertWrite() 메서드 오류 발생");
			System.out.println("쿼리문을 확인하세요");
			e.printStackTrace();
		}
		return result;
	}
	
	
	// 게시글의 제목을 클릭했을 때 상세보기 페이지
	public BoardDTO selectView(String num) {
		// 메서드 호출 시 입력은 num(board pk) 받고 가져온 데이터를 BoardDTO 객체에 넣어 리턴
		BoardDTO viewDTO = new BoardDTO();
		
		// 3단계 (쿼리문 생성) member pk -> board fk
		// String query = "select * from board where num=?"; // 작성자인지 판단 불가
		
		// member에 있는 작성자를 가져올 수 있도록 join 처리용
		
		String query = "select B.*, M.name from member M inner join board B on M.id = B.id where num=?";
		// member 테이블의 별칭은 M 으로, board테이블의 별칭은 B로 선언
		// 부모테이블인 M에 inner join으로 B를 이용하고 id가 같은 자료를 찾음
		// 조건은 파라미터로 받은 num을 이용
		// 찾아온 값은 board의 모든것과 member의 name을 가져옴 -> dto에 name필드를 추가
		
		// join 활용도 매우 높으니 기억해둘것
		
		

		try {
			// 4단계 (쿼리문 실행)
			preparedStatement = connection.prepareStatement(query); // 객체 생성
			preparedStatement.setString(1, num);
			resultSet = preparedStatement.executeQuery(); // 쿼리 실행 -> 표로 받음

				if(resultSet.next()) {
					viewDTO.setNum(resultSet.getString("num"));
					viewDTO.setTitle(resultSet.getString("title"));
					viewDTO.setContent(resultSet.getString("content"));
					viewDTO.setPostdate(resultSet.getDate("postdate"));
					viewDTO.setId(resultSet.getString("id"));
					viewDTO.setName(resultSet.getString("name")); // dto 객체의 값 저장
					viewDTO.setVisitcount(resultSet.getString("visitcount"));
					
				}
				System.out.println("상세보기 테스트" + viewDTO.toString()); // 확인용 테스트코드. toString 오버라이드 해주면됨
				
		} catch (SQLException e) {
			System.out.println("BoardDAO.selectView() 메서드 예외 발생");
			System.out.println("쿼리문을 확인하세요");
			e.printStackTrace();
		}

		return viewDTO;
		
	}
	
	
	// 리스트에서 제목을 클릭 했을때 조회수 증가용 코드 
	public void updateVisitCount(String num) {
		// void 메서드면 resultSet 이런거 안씀
		
		String query = "update board set visitcount = visitcount+1 where num=?";
		// 조건이 num값에 대한 visitcount를 1씩 증가
		
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, num);
			preparedStatement.executeQuery(); // 실행만 하고 결과는 안봄
		} catch (SQLException e) {
			System.out.println("BoardDAO.updateVisitCount() 메서드 예외발생");
			System.out.println("쿼리문을 확인하세요");
			e.printStackTrace();
		}
		
		
	}
	
	public int updateEdit(BoardDTO boardDTO) {
		int result = 0;
			
			String query = "update board set title=?, content=? where num=?";
			
			try {
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, boardDTO.getTitle());
				preparedStatement.setString(2, boardDTO.getContent());
				preparedStatement.setString(3, boardDTO.getNum()); // 3단계
				
				result = preparedStatement.executeUpdate(); // 4단계
				System.out.println(result);
				
			} catch (SQLException e) {
				System.out.println("BoardDAO.updateEdit() 메서드 예외 발생");
				System.out.println("쿼리문을 확인하세요");
				e.printStackTrace();
			}
			
		return result;
	}
	
	
	
	// 삭제 메서드 (dto를 받아서 삭제 후에 int로 리턴)
	public int deletePost(BoardDTO boardDTO) {
		int result = 0;
		
		String query = "delete from board where num=?";
		
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, boardDTO.getNum());
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.out.println("BoardDAO.deletePost() 메서드 예외 발생");
			System.out.println("쿼리문을 확인하세요");
			e.printStackTrace();
		}
		
		return result;
	}

}