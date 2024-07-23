package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {
	// 데이터베이스와 자바를 연결하는 객체 클래스
	// 단점 : url이나 id나 pw가 변경되면 코드 수정 후 컴파일을 다시하고 배포 해야 함!!!!
	// 1단계 : 드라이버
	// 2단계 : url, id, pw
	// 3단계 : 쿼리생성
	// 4단계 : 쿼리실행, 결과출력
	// 5단계 : close();
	
	
	// 필드
	public Connection connection;               // 연결자
	public Statement statement;                 // 정적 쿼리문(모든리스트 출력에 주로 씀)
	public PreparedStatement preparedStatement; // 동적 쿼리문(?로 인파라미터 처리)
	public ResultSet resultSet;                 // select의 결과를 표로 출력
	
	// 생성자
	public JDBConnect() { // 기본 생성자
		try {
			Class.forName("oracle.jdbc.OracleDriver"); // 1단계
			System.out.println("JDBConnect 기본 생성자 1단계 성공");
			String url = "jdbc:oracle:thin:@192.168.111.101:1521:xe";
			String id = "boardjsp";
			String pw = "1234";
			connection = DriverManager.getConnection(url, id, pw); // 2단계
			System.out.println("JDBConnect 기본 생성자 2단계 성공");
		} catch (Exception e) {
			System.out.println("1단계, 2단계, 3단계를 확인하세요.");
			e.printStackTrace();
		}
	}
	
	// 커스텀 생성자
	public JDBConnect(String driver, String url, String id, String pw) {
		// 단점 jsp에서 4개의 매개값을 항시 받아야함
		try {
			Class.forName(driver); // 1단계
			System.out.println("커스텀 생성자로 1단계 성공");
			connection = DriverManager.getConnection(url, id, pw); // 2단계
			System.out.println("커스텀 생성자로 2단계 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("1단계 예외발생");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("2단계, 3단계 예외발생");
			e.printStackTrace();
		}
		
	}
	
	// 커스텀 생성자 ver2 - application을 활용
	public JDBConnect(ServletContext application){
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleURL");
		String id = application.getInitParameter("OracleId");
		String pw = application.getInitParameter("OraclePw");
		
		try {
			Class.forName(driver);
			System.out.println("커스텀 생성자 ver2로 1단계 성공");
			connection = DriverManager.getConnection(url, id, pw);
			System.out.println("커스텀 생성자 ver2로 2단계 성공");
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("커스텀 생성자 ver2로 1~3단계 실패");
			e.printStackTrace();
		}
	}
	
	
	
	// 메서드
	public void close() {
		try {
			if(resultSet != null) resultSet.close();
			if(statement != null) statement.close();
			if(preparedStatement != null) preparedStatement.close();
			if(connection != null) connection.close();
			System.out.println("JDBConnect 생성자 5단계 성공");
		} catch (Exception e) {
			System.out.println("정상으로 close() 되지 않았습니다.");
			System.exit(0); // 강종
			e.printStackTrace();
		}
	}
}