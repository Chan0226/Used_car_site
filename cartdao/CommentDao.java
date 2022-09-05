package data.dao.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import data.dto.cart.CarDto;
import data.dto.cart.CommentDto;
import db.DbConnect;


public class CommentDao{
	// 댓글정보를 전달받아 comment테이블에 저장하고 저장행의개수를 반환하는 메소드
		DbConnect db = new DbConnect();
		
		public void insertcommentDto(CommentDto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;

			String sql = "insert into comment (num,comment,userId) values(?,?,?)";;

			conn=db.getMysqlConnection();
			try {
				pstmt = conn.prepareStatement(sql);

				//바인딩
				pstmt.setString(1, dto.getNum());
				pstmt.setString(2, dto.getComment());
				pstmt.setString(3, dto.getUserId());
				
				//실행
				pstmt.execute();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				db.dbClose(conn, pstmt);
			}
		}
		
		// 댓글정보를 전달받아 comment테이블에 저장된 댓글을 변경하고 변경행의 개수를 반환하는 메소드
//		public void updateComment(CommentDto dto) {
//			Connection conn = null;
//			PreparedStatement pstmt = null;
//			String sql = "update comment set userid=?, carid=?"
//					+ "title=?, content=?";
//
//			conn = db.getMysqlConnection();
//
//			//pstmt
//			try {
//				pstmt = conn.prepareStatement(sql);
//
//				//바인딩
//				pstmt.setString(1, dto.getUserId());
//				pstmt.setString(2, dto.getCarId());
//				pstmt.setString(3, dto.getTitle());
//				pstmt.setString(4, dto.getContent());
//				
//
//				//실행
//				pstmt.execute();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}finally {
//				db.dbClose(conn, pstmt);
//			}
//		}
//		
		// 댓글번호를 전달받아 comment테이블에 저장된 댓글을 삭제하고 삭제행의 개수를 반환하는 메소드
//		public void deleteComment(String num) {
//			Connection conn = null;
//			PreparedStatement pstmt = null;
//			String sql = "delete from comment where num=?";
//
//			conn=db.getMysqlConnection();
//			try {
//				pstmt=conn.prepareStatement(sql);
//
//				//바인딩
//				pstmt.setString(1, num);
//
//				//실행
//				pstmt.execute();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}finally {
//				db.dbClose(conn, pstmt);
//			}
//		}

		// 댓글번호를 전달받아 comment테이블에 저장된 댓글을 검색하여 반환하는 메소드
		public List<CommentDto> getComment(String num) {
			List<CommentDto> list=new Vector<>();
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql = "select * from comment where num=? order by createDate desc";

			conn=db.getMysqlConnection();
			try {
				pstmt = conn.prepareStatement(sql);

				//바인딩
				pstmt.setString(1,num);
				rs = pstmt.executeQuery();

				while(rs.next()) {
					CommentDto dto = new CommentDto();
					dto.setIdx(rs.getString("idx"));
					dto.setNum(rs.getString("num"));
					dto.setComment(rs.getString("comment"));
					dto.setUserId(rs.getString("userId"));
					list.add(dto);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				db.dbClose(conn, pstmt, rs);
			}
			return list;
		}
//		
		// comment테이블에 저장된 모든 댓글을 검색하여 반환하는 메소드
//		public List<CommentDto> getAllComments(){
//			List<CommentDto> list = new ArrayList<>();
//			Connection conn = null;
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//
//			String sql = "select * from comment order by num desc";
//
//			conn=db.getMysqlConnection();
//			try {
//				pstmt = conn.prepareStatement(sql);
//				rs = pstmt.executeQuery();
//				while(rs.next()) {
//					CommentDto dto = new CommentDto();
//					dto.setNum(rs.getString("num"));
//					dto.setCarId(rs.getString("userid"));
//					dto.setUserId(rs.getString("carid"));
//					dto.setTitle(rs.getString("title"));
//					dto.setContent(rs.getString("content"));
//					//list에 추가
//					list.add(dto);
//				}
//
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}finally {
//				db.dbClose(conn, pstmt, rs);
//			}
//			return list;
//		}
}