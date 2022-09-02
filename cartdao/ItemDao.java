package data.dao.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import data.dto.cart.CarDto;
import db.DbConnect;

public class ItemDao {
	public void closeAll(PreparedStatement pstmt,Connection con) throws SQLException {
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close();
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection con) throws SQLException {
		if(rs!=null)
			rs.close();
		closeAll(pstmt, con);
	}
	DbConnect db = new DbConnect();
	/* 1번 기능
	 * getAllItemList() : ArrayList<CarDto>
	 */
	public ArrayList<CarDto> getAllDatas(){
		ArrayList<CarDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from car order by num desc";

		conn=db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
				dto.setImage(rs.getString("carphoto"));
				//list에 추가
				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return list;
	}
	
	
	
	/* 2번 기능
	 * findItemByNo(String itemNo) : CarDto
	 */
	public CarDto findItemByNo(String num){
		CarDto dto = new CarDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from car where num=?";

		conn=db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			//바인딩
			pstmt.setString(1,num);
			rs = pstmt.executeQuery();

			if(rs.next()) {
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
				dto.setImage(rs.getString("carphoto"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;
	}
	
	/* 3번 기능
	 * registerItem(CarDto) : void
	 */
	public void registerItem(CarDto dto){
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into car(carnumber,company,carname,cost,sort,caryear,distance,color,gas,fuel,cc,auto,carphoto) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";

		conn=db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			//바인딩
			pstmt.setString(1, dto.getCarnumber());
			pstmt.setString(2, dto.getCompany());
			pstmt.setString(3, dto.getCarname());
			pstmt.setInt(4, dto.getCost());
			pstmt.setString(5, dto.getSort());
			pstmt.setString(6, dto.getCaryear());
			pstmt.setInt(7, dto.getDistance());
			pstmt.setString(8, dto.getColor());
			pstmt.setString(9, dto.getGas());
			pstmt.setString(10, dto.getFuel());
			pstmt.setString(11, dto.getCc());
			pstmt.setString(12, dto.getAuto());
			
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}

	public void updateBoard(CarDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update car set carnumber=?, company=?"
				+ "carname=?, cost=?, sort=?, caryear=? "
				+ "distance=?, color=?, gas=?, fuel=?,cc=?,auto=?,carphoto=?"
				+"where num=?";

		conn = db.getMysqlConnection();

		//pstmt
		try {
			pstmt = conn.prepareStatement(sql);

			//바인딩
			pstmt.setString(1, dto.getCarnumber());
			pstmt.setString(2, dto.getCompany());
			pstmt.setString(3, dto.getCarname());
			pstmt.setInt(4, dto.getCost());
			pstmt.setString(5, dto.getSort());
			pstmt.setString(6, dto.getCaryear());
			pstmt.setInt(7, dto.getDistance());
			pstmt.setString(8, dto.getColor());
			pstmt.setString(9, dto.getGas());
			pstmt.setString(10, dto.getFuel());
			pstmt.setString(11, dto.getCc());
			pstmt.setString(12, dto.getAuto());
			pstmt.setString(13, dto.getImage());
			pstmt.setString(14, dto.getNum());
			

			//실행
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	//삭제
		public void deleteBoard(String num) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "delete from car where num=?";

			conn=db.getMysqlConnection();
			try {
				pstmt=conn.prepareStatement(sql);

				//바인딩
				pstmt.setString(1, num);

				//실행
				pstmt.execute();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				db.dbClose(conn, pstmt);
			}
		}
}//class
