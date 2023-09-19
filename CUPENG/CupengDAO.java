package com.basket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConn;

public class CupengDAO {
	public BasketList bList = BasketList.getInstance();
	
	// ��ǰ��˻�
	public List<CupengDTO> searchPname(String p_name) {

		List<CupengDTO> lists = new ArrayList<CupengDTO>();

		// db����
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "select cno,rownum,p_name,pay,cnt ";
			sql += "from PRODUCT where p_name like ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + p_name + "%");

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				CupengDTO dto = new CupengDTO();
				
				dto.setCno(rs.getInt("cno"));
				dto.setRownum(rs.getInt("rownum"));
				dto.setP_name(rs.getString("p_name"));
				dto.setPay(rs.getInt("pay"));
				dto.setCnt(rs.getInt("cnt"));

				lists.add(dto);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}

	// �����ۼ�
	public int insertReview(CupengDTO dto) {
		int result = 0;
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "insert into review (no,id,board,reviewdate) ";
			sql += "values(?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNo());
			pstmt.setString(2, bList.getId());
			pstmt.setString(3, dto.getBoard());
			pstmt.setString(4, dto.getreviewdate());
			
			java.sql.Date hireDate = java.sql.Date.valueOf(dto.getreviewdate());
			pstmt.setDate(4, hireDate);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	// ������ȸ
	// getReviewList�� ����
	public List<CupengDTO> getReviewList() {
		List<CupengDTO> lists = new ArrayList<CupengDTO>();
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		// ���� �ҷ��ö� �������� ������ ���� ������  
		try {
			sql = "select no,id,board,reviewdate ";
			sql += "from review order by no desc";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CupengDTO dto = new CupengDTO();
				dto.setNo(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setBoard(rs.getString(3));
				dto.setreviewdate(rs.getString(4));

				lists.add(dto);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;

	}
	
	public int insertReview2(CupengDTO dto) {
		int result=0;
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into review (no,id,board,reviewdate) ";
				sql+= "values(re_seq.nextval,?,?,sysdate)";
				
		try {
				
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, bList.getId());
		pstmt.setString(2, dto.getBoard());
		
		//java.sql.Date hireDate = java.sql.Date.valueOf(dto.getreviewdate());
		//pstmt.setDate(4, hireDate);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	//ī�װ� ���� �޼���//
		public List<CupengDTO> selcategory(int cno) {

			List<CupengDTO> list = new ArrayList<CupengDTO>();

			Connection conn = DBConn.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
		
			try {
				sql = "select rownum num, b.c_name, a.p_name, a.pay, a.cnt from product a inner join cate b on a.cno = b.CNO where a.cno = ?";
				//sql = "select rownum num, c_name, p_name, pay, cnt from product a, cate b where a.cno = b.cno and a.cno = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cno);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
				    CupengDTO dto = new CupengDTO();
				    dto.setRownum(rs.getInt("num"));
				    dto.setC_name(rs.getString("c_name"));
				    dto.setP_name(rs.getString("p_name"));
				    dto.setPay(rs.getInt("pay"));
				    dto.setCnt(rs.getInt("cnt"));
					
					list.add(dto);
				}
				rs.close();
				pstmt.close();
			
				
			} catch (Exception e) {
				System.out.println(e.toString());
				
			}
			return list;
	}
}
