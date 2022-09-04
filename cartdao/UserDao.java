package data.dao.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import data.dto.MyshopDto;
import data.dto.cart.CarDto;
import data.dto.cart.UserDto;
import db.DbConnect;

public class UserDao {
	DbConnect db = new DbConnect();
	
	private Connection conn; //자바와 데이터베이스를 연결
	private PreparedStatement pstmt; //쿼리문 대기 및 설정
	private ResultSet rs; //결과값 받아오기
	
	//기본 생성자
	//UserDAO가 실행되면 자동으로 생성되는 부분
	//메소드마다 반복되는 코드를 이곳에 넣으면 코드가 간소화된다
	//로그인 영역
		public int login(String userID, String userPassword) {
			conn=db.getMysqlConnection();
			String sql = "select password from user where id = ?";
			try {
				pstmt = conn.prepareStatement(sql); //sql쿼리문을 대기 시킨다
				pstmt.setString(1, userID); //첫번째 '?'에 매개변수로 받아온 'userID'를 대입
				rs = pstmt.executeQuery(); //쿼리를 실행한 결과를 rs에 저장
				if(rs.next()) {
					if(rs.getString(1).equals(userPassword)) {
						return 1; //로그인 성공
					}else
						return 0; //비밀번호 틀림
				}
				return -1; //아이디 없음
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -2; //오류
		}
		
		public void signup(UserDto dto)

		{
			Connection conn=null;
			PreparedStatement pstmt=null;
			String sql="insert into user values (null,?,?,?,?,?,?,now())";

			//db연결
			conn=db.getMysqlConnection();
			try {
				pstmt=conn.prepareStatement(sql);
				//바인딩
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPassword());
				pstmt.setString(3, dto.getName());
				pstmt.setDate(4, dto.getBirthday());
				pstmt.setString(5, dto.getSex());
				pstmt.setString(6, dto.getEmailid()+"@"+dto.getEmailaddr());

				//실행
				pstmt.execute();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				db.dbClose(conn, pstmt);
			}
		}

		
		
		
		
		
		
		
		
		public int checkId(String id) {  // 유저가 입력한 값을 매개변수로 한다
			conn=db.getMysqlConnection();
			String sql = "select * from user where id = ?"; // 입력값이 테이블에 있는지 확인
			int idCheck = 0;
		    try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
						
				if(rs.next() || id.equals("")) {
					idCheck = 0;  // 이미 존재하는 경우, 생성 불가능
				} else {
					idCheck = 1;  // 존재하지 않는 경우, 생성 가능
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			return idCheck;
		}
}