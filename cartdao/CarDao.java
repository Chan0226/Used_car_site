package data.dao.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import data.dto.MyshopDto;
import data.dto.SimpleBoardDto;
import data.dto.cart.CarDto;
import db.DbConnect;
import oracle.gss.util.CharConvBuilder.DataTypeParser;

public class CarDao {
	DbConnect db = new DbConnect();
	
	// ���͸�
	public List<CarDto> getCostCar(String company,int mincost,int maxcost)
	{
		List<CarDto> list=new Vector<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from car where company = ? and cost between ? and ? order by num desc";

		//db����
		conn=db.getMysqlConnection();

		//pstmt ����
		try {
			pstmt=conn.prepareStatement(sql);
			// ���ε�
			// % �� ?�� ������ sql�������� �ۼ� X
			pstmt.setString(1,company);
			pstmt.setInt(2,mincost);
			pstmt.setInt(3,maxcost);
			rs=pstmt.executeQuery();

			while(rs.next())
			{
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
				//list�� �߰�
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return list;
	}
	
	public List<CarDto> getSearchCar(String carname)
	{
		List<CarDto> list=new Vector<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from car where carname like ? order by num desc";

		//db����
		conn=db.getMysqlConnection();

		//pstmt ����
		try {
			pstmt=conn.prepareStatement(sql);
			// ���ε�
			// % �� ?�� ������ sql�������� �ۼ� X
			pstmt.setString(1, "%"+carname+"%");
			rs=pstmt.executeQuery();

			while(rs.next())
			{
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
				//list�� �߰�
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return list;
	}
	//��ü ��ȸ
	public List<CarDto> getAllDatas(){
		List<CarDto> list = new ArrayList<>();
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
				dto.setImage(rs.getString("image"));
				//list�� �߰�
				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return list;
	}
	
	//num�� �ش��ϴ� DTO ��ȯ
	public CarDto getContent(String num) {

		CarDto dto = new CarDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from car where num=?";

		conn=db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			//���ε�
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
				dto.setImage(rs.getString("image"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;
	}

	//insert
	public void insertcar(CarDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into car(carnumber,company,carname,cost,sort,caryear,distance,color,gas,fuel,cc,auto,image) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";

		conn=db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			//���ε�
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
			
			//����
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}

	//��ü���� ��ȯ
	public int getTotalCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int total = 0;

		String sql = "select count(*) from car";

		conn=db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				total=rs.getInt(1); //1����
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return total;
	}

	//���� �ֱٿ� �߰��� ���� num�� ���
	public int getMaxnum() {
		int max = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select max(num) max from car";

		conn = db.getMysqlConnection();

		//pstmt
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				max = rs.getInt("max"); // rs.getInt(1) �̷��� �ᵵ��
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return max;
	}

	//��й�ȣ �´��� üũ�ϴ� �޼���, 0�̸� false, 1�̸� true
	public boolean isPassCheck(String num, String pass) {
		boolean check = false;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from car where num=?";

		conn = db.getMysqlConnection();

		//pstmt
		try {
			pstmt = conn.prepareStatement(sql);

			//���ε�
			pstmt.setString(1,num);
			pstmt.setString(2,pass);

			//����
			rs=pstmt.executeQuery();

			if(rs.next()) {
				//�ʱⰪ�� false�̹Ƿ� else�� ����ε�
				if(rs.getInt(1)==1) { //����� Ʋ�� ��� 0
					check=true;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return check;
	}

	//����
	public void updateBoard(CarDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update car set carnumber=?, company=?"
				+ "carname=?, cost=?, sort=?, caryear=? "
				+ "distance=?, color=?, gas=?, fuel=?,cc=?,auto=?,image=?"
				+"where num=?";

		conn = db.getMysqlConnection();

		//pstmt
		try {
			pstmt = conn.prepareStatement(sql);

			//���ε�
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
			

			//����
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}

	//����
	public void deleteCar(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from car where num=?";

		conn=db.getMysqlConnection();
		try {
			pstmt=conn.prepareStatement(sql);

			//���ε�
			pstmt.setString(1, num);

			//����
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	// �κ� ��ȸ(startNum���� perPage����(������ ���� ����)��ŭ�� ��ȯ)
	public List<CarDto> getPagingList(int startNum, int perPage){
		List<CarDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from car order by num desc limit ?,?";

		conn=db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			// ���ε�
			pstmt.setInt(1,startNum);
			pstmt.setInt(2,perPage);
			
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
				dto.setImage(rs.getString("image"));

				//list�� �߰�
				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return list;
	}
}
