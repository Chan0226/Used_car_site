package data.dao.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.cart.CarDto;
import data.dto.cart.CartDto;
import db.DbConnect;

public class CartDao {
	DbConnect db = new DbConnect();

	public List<String> findFavorByUserId(String userId) {
		List<CarDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT carId FROM cart WHERE userId = ?";
		List<String> result = new ArrayList<>();
		
		conn=db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result.add(rs.getString("carId"));
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		return null;
	}
	
	public List<CarDto> findUsercart(String userId){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM car WHERE num IN (select carId from cart where userId= ?)";
		List<CarDto> result = new ArrayList<>();
		
		conn=db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CarDto dto = new CarDto();
				dto.setNum(rs.getString("num"));
				dto.setCarnumber(rs.getString("carnumber"));
				dto.setCompany(rs.getString("company"));
				dto.setCarname(rs.getString("carname"));
				dto.setCost(rs.getInt("cost"));
				dto.setSort(rs.getString("sort"));
				dto.setCaryear(rs.getString("caryear"));
				dto.setDistance(rs.getInt("distance"));
				dto.setColor(rs.getString("color"));
				dto.setGas(rs.getString("gas"));
				dto.setFuel(rs.getString("fuel"));
				dto.setCc(rs.getString("cc"));
				dto.setAuto(rs.getString("auto"));
				dto.setImage(rs.getString("image"));
				result.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		return result;
	}
	
	/*
	 * public List<CartDto> findByUserId(String userId) {
	 * 
	 * Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
	 * StringBuffer sb = new StringBuffer(); sb.
	 * append("SELECT cart.id,  cart.carId, car.carname, car.cost, car.carphoto "
	 * ); sb.
	 * append("FROM cart INNER JOIN car ON cart.carId = car.id WHERE userId = ?"
	 * ); String sql = sb.toString(); List<CartDto> list = new ArrayList<>();
	 * 
	 * conn=db.getMysqlConnection(); try { pstmt = conn.prepareStatement(sql);
	 * pstmt.setString(1, userId); rs = pstmt.executeQuery(); while (rs.next()) {
	 * CartDto dto = new CartDto(); dto.setId(rs.getInt("id"));
	 * dto.setUserId(rs.getString("userId")); dto.setCarId(rs.getString("carId"));
	 * dto.setCreateDate(rs.getTimestamp("createdate")); //list에 추가 list.add(dto); }
	 * return list; } catch (Exception e) { e.printStackTrace(); } finally {
	 * db.dbClose(conn, pstmt, rs); } return null; }
	 */
	// 장바구니에 상품이 있는지 확인
	public boolean isCart(int userId, int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM cart WHERE userId = ? AND carId = ?";
		
		conn=db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userId);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
		return false;
	}
	
	public int addCart(String userId,String carId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO cart(userId, carId,createDate) VALUES (?, ?,now())";
		
		conn=db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, carId);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
		return -1;
	}
	
	public int rmvCart(String userId,String carId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM cart WHERE userId = ? AND carId = ?";
		
		conn=db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, carId);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
		return -1;
	}
	public int getTotalCount(){	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		int total = 0;
	
		String sql = "select count(*) from cart";
	
		conn=db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				total=rs.getInt(1); //1번열
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
	return total;
	}
}