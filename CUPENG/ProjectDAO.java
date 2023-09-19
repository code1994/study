package com.basket;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.db.DBConn;

public class ProjectDAO {

    public BasketList bList = BasketList.getInstance();
    
	public int join(CupengDTO dto) {
	    int result = 0;
	    Connection conn = DBConn.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql;
	    
	    try {
	        // ���̵� �ߺ� �˻�
	        sql = "SELECT id FROM join WHERE id=?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, dto.getId());
	        rs = pstmt.executeQuery();
	        if (rs.next()) { // �ߺ��� ���̵� ���� ���
	            result = -1;
	        } else { // �ߺ��� ���̵� ���� ���
	            // ȸ������
	        	bList.setId(dto.getId());
	            sql = "INSERT INTO join (name, id, pw, addr) VALUES (?, ?, ?, ?)";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, dto.getName());
	            pstmt.setString(2, bList.getId());
	            pstmt.setString(3, dto.getPw());
	            pstmt.setString(4, dto.getAddr());
	            result = pstmt.executeUpdate();
	        }
	        pstmt.close();
	    } catch (Exception e) {
	        System.out.println(e.toString());
	    } 
	    return result;
	}
		
		
	

	//�α���//
	public int login(CupengDTO dto) {


		int result = 0;

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;

		String sql;

		try {
			sql = "SELECT * FROM join WHERE id = ? AND pw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}

//ī�װ� �˻� �޼���//
	
	
	public List<CupengDTO> serchCategory() {
		
	Scanner sc = new Scanner(System.in);
	List<CupengDTO> lists = new ArrayList<CupengDTO>();
	
	Connection conn = DBConn.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql;
	
	try {
		sql = "select cno,c_name from cate";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		
		while(rs.next()) {
			
			CupengDTO dto = new CupengDTO();
			dto.setCno(rs.getInt("cno"));
			dto.setC_name(rs.getString("c_name"));
			
			lists.add(dto);
		}
		
		
		rs.close();
		pstmt.close();
	
		
	} catch (Exception e) {
		System.out.println(e.toString());
		
	}
	return lists;
	}
	
	//ī�װ� ���� �޼���//
	public List<CupengDTO> selcategory(int cno) {

		List<CupengDTO> list = new ArrayList<CupengDTO>();

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
	
		try {
			sql = "select a.cno, rownum num, b.c_name, a.p_name, a.pay, a.cnt from product a inner join cate b on a.cno = b.CNO where a.cno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			    CupengDTO dto = new  CupengDTO();
			    dto.setCno(rs.getInt("cno"));
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
	
	
	//0.������ �α���
public int adminLlogin(CupengDTO dto) {
		
		int result = 0;
		
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		 
	
		 try {
			sql = "SELECT * FROM join WHERE id = admin AND pw = admin123";
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			if(rs.getString("id").equals(dto.getId()) && rs.getString("pw").equals(dto.getPw()))
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}

	   
	//1. ������ /��ü ��ǰ �˻�
	public List<CupengDTO> searchProdct() {
		List <CupengDTO> lists = new ArrayList<CupengDTO>();
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select rownum,p_name,pay,cnt from PRODUCT";

		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CupengDTO dto = new CupengDTO();
				
				dto.setRownum(rs.getInt("rownum"));
				dto.setP_name(rs.getString("p_name"));;
				dto.setPay(rs.getInt("pay"));
				dto.setCnt(rs.getInt("cnt"));	
				
				lists.add(dto);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
		
	}
	
	
	
	
	//2. ������ /��ǰ �߰�
	public int insertProduct(CupengDTO dto) {
		int result=0;
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into product (cno,p_name,pay,cnt) ";
				sql+= "values(?,?,?,?)";
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getCno());
			pstmt.setString(2, dto.getP_name());
			pstmt.setInt(3, dto.getPay());
			pstmt.setInt(4, dto.getCnt());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
		
	}
	
	
	//3. ������ /��ǰ ����
	public int updateProduct(CupengDTO dto) {
	    int result = 0;
	    Connection conn = DBConn.getConnection();
	    PreparedStatement pstmt = null;
	    String sql = "UPDATE product SET p_name = ?, pay = ?, cnt = ? WHERE cno = ?";

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, dto.getP_name());
	        pstmt.setInt(2, dto.getPay());
	        pstmt.setInt(3, dto.getCnt());
	        pstmt.setInt(4, dto.getCno());

	        result = pstmt.executeUpdate();
	        pstmt.close();
	        
	    } catch (Exception e) {
	        System.out.println(e.toString());
	    }
	    return result;
	}
	
	
	//4. ������ /��ǰ ����
	public int deleteProduct(int rownum) {
	    int result = 0;
	    Connection conn = DBConn.getConnection();
	    PreparedStatement pstmt = null;
	    String sql = "DELETE FROM product WHERE rownum = ?";

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, rownum);

	        result = pstmt.executeUpdate();
	        pstmt.close();
	        
	    } catch (Exception e) {
	        System.out.println(e.toString());
	    }
	    return result;
	}
	
	//5. ������ /�Ǹ� ��Ȳ
		public List<CupengDTO> SalesInventory() {
		    List<CupengDTO> inventory = new ArrayList<CupengDTO>();
		    Connection conn = DBConn.getConnection();
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    String sql = "SELECT cno, p_name, cnt, pay FROM product WHERE cnt > 0";

		    try {
		        pstmt = conn.prepareStatement(sql);
		        rs = pstmt.executeQuery();

		        while (rs.next()) {
		        	CupengDTO dto = new CupengDTO();
		            dto.setCno(rs.getInt("cno"));
		            dto.setH_name(rs.getString("p_name"));
		            dto.setCnt(rs.getInt("cnt"));
		            dto.setPay(rs.getInt("pay"));
		            inventory.add(dto);
		        }

		        rs.close();
		        pstmt.close();
		        
		    } catch (Exception e) {
		        System.out.println(e.toString());
		    }

		    return inventory;
		}
	
	//6. ������ /ȸ�� ���� Ȯ��
	public List<CupengDTO> getAllMembers() {
	    List<CupengDTO> members = new ArrayList<>();
	    Connection conn = DBConn.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT * FROM join";

	    try {
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	        	CupengDTO dto = new CupengDTO();
	            dto.setId(rs.getString("id"));
	            dto.setPw(rs.getString("pw"));
	            dto.setName(rs.getString("name"));
	            dto.setAddr(rs.getString("addr"));

	            members.add(dto);
	        }

	        rs.close();
	        pstmt.close();
	        
	    } catch (Exception e) {
	        System.out.println(e.toString());
	    }

	    return members;
	}
	
	// �Ǹ���Ȳ
//    - ī�װ���
//    - �Ѹ���
//    - �������� / �⵵�� ����?
	
	// ī�װ��� ������Ȳ
	public List<CupengDTO> catecorySal(int cno){
		
		List<CupengDTO> lists = new ArrayList<CupengDTO>();
		Connection conn = DBConn.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT DISTINCT A.ID,A.CNO,B.H_NAME,B.TOTAL,B.CNT\r\n"
	    		+ "FROM HISTORY A , (SELECT COUNT(H_NAME) CNT, H_NAME, SUM(PAY) total FROM HISTORY WHERE CNO = ? GROUP BY H_NAME) B\r\n"
	    		+ "WHERE A.H_NAME = B.H_NAME\r\n"
	    		+ "AND A.CNO = ?";
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, cno);
	        pstmt.setInt(2, cno);
	        
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	        	
	        	CupengDTO dto = new CupengDTO();
	            dto.setId(rs.getString("id"));
	            dto.setCno(rs.getInt("cno"));
	            dto.setH_name(rs.getString("h_name"));
	            dto.setTotal(rs.getInt("total"));
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
	
	
	// �� ���� ��Ȳ
	public List<CupengDTO> totalSal(){
		
		List<CupengDTO> lists = new ArrayList<CupengDTO>();
		Connection conn = DBConn.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    // CNO ���� �� ������Ȳ
	    String sql = "SELECT DISTINCT A.ID,A.CNO,B.H_NAME,B.TOTAL,B.CNT\r\n"
	    		+ "FROM HISTORY A , (SELECT COUNT(H_NAME) CNT, H_NAME, SUM(PAY) total FROM HISTORY  GROUP BY H_NAME) B\r\n"
	    		+ "WHERE A.H_NAME = B.H_NAME ORDER BY CNO";
	    
	    // �׳� �� ���⸸ ��������
	    //sql = "SELECT SUM(PAY) FROM HISTORY WHERE CNO=0";
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        
	        rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	        	
	        	CupengDTO dto = new CupengDTO();
	            //dto.setId(rs.getString("id"));
	            dto.setCno(rs.getInt("cno"));
	            dto.setH_name(rs.getString("h_name"));
	            dto.setCnt(rs.getInt("cnt"));
	            dto.setTotal(rs.getInt("total"));
	            
	            lists.add(dto);
	        }
	        
	        rs.close();
	        pstmt.close();
	        
	    } catch (Exception e) {
	        System.out.println(e.toString());
	    }
		return lists;
	}
	
	// ��Ÿ ���� ��Ȳ
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}