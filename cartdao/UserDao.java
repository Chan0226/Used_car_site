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
	
	private Connection conn; //�ڹٿ� �����ͺ��̽��� ����
	private PreparedStatement pstmt; //������ ��� �� ����
	private ResultSet rs; //����� �޾ƿ���
	
	//�⺻ ������
	//UserDAO�� ����Ǹ� �ڵ����� �����Ǵ� �κ�
	//�޼ҵ帶�� �ݺ��Ǵ� �ڵ带 �̰��� ������ �ڵ尡 ����ȭ�ȴ�
	//�α��� ����
		public int login(String userID, String userPassword) {
			conn=db.getMysqlConnection();
			String sql = "select password from user where id = ?";
			try {
				pstmt = conn.prepareStatement(sql); //sql�������� ��� ��Ų��
				pstmt.setString(1, userID); //ù��° '?'�� �Ű������� �޾ƿ� 'userID'�� ����
				rs = pstmt.executeQuery(); //������ ������ ����� rs�� ����
				if(rs.next()) {
					if(rs.getString(1).equals(userPassword)) {
						return 1; //�α��� ����
					}else
						return 0; //��й�ȣ Ʋ��
				}
				return -1; //���̵� ����
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -2; //����
		}
		
		public void signup(UserDto dto)

		{
			Connection conn=null;
			PreparedStatement pstmt=null;
			String sql="insert into user values (null,?,?,?,?,?,?,now())";

			//db����
			conn=db.getMysqlConnection();
			try {
				pstmt=conn.prepareStatement(sql);
				//���ε�
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPassword());
				pstmt.setString(3, dto.getName());
				pstmt.setDate(4, dto.getBirthday());
				pstmt.setString(5, dto.getSex());
				pstmt.setString(6, dto.getEmailid()+"@"+dto.getEmailaddr());

				//����
				pstmt.execute();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				db.dbClose(conn, pstmt);
			}
		}

		
		
		
		
		
		
		
		
		public int checkId(String id) {  // ������ �Է��� ���� �Ű������� �Ѵ�
			conn=db.getMysqlConnection();
			String sql = "select * from user where id = ?"; // �Է°��� ���̺� �ִ��� Ȯ��
			int idCheck = 0;
		    try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
						
				if(rs.next() || id.equals("")) {
					idCheck = 0;  // �̹� �����ϴ� ���, ���� �Ұ���
				} else {
					idCheck = 1;  // �������� �ʴ� ���, ���� ����
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			return idCheck;
		}
}