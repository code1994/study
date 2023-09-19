package com.basket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.print.event.PrintJobListener;

import com.db.DBConn;

public class BasketDAO {

	public BasketList bList = BasketList.getInstance();

	// 구매시 구매내역
	public int insertHistory(List<CupengDTO> lists) {
		int result = 0;

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;

		String sql;

		try {
			// (?????) -> id, cno, name, pay
			sql = "insert into history values (?,?,?,?,sysdate)";
			
			pstmt = conn.prepareStatement(sql);
			
			Iterator<CupengDTO> it = lists.iterator();
			while (it.hasNext()) {
				
				CupengDTO dto = it.next();
				pstmt.setString(1, bList.getId());
				pstmt.setInt(2, dto.getCno());
				pstmt.setString(3, dto.getP_name());
				pstmt.setInt(4, dto.getPay());
				result = pstmt.executeUpdate();
			}
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}

	// 카드 등록
	public int insertCard(CupengDTO dto) {
		int result = 0;

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql;

		try {
			// 카드 등록 되어있는지 확인해야하고
			sql = "insert into cardpay values (?,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bList.getId());
			pstmt.setString(2, dto.getCard_no());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	public int cardCheck(String id) {
		int result = 0;

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select * from cardpay where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				if (id.equals(rs.getString("id"))) {
					result = 1;
					break;
				}
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}

	// 카드 수정
	public int updateCard(CupengDTO dto) {
		int result = 0;

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql;

		try {
			// 카드 등록 되어있는지 확인해야하고
			sql = "UPDATE CARDPAY SET CARD_NO = ? WHERE ID = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getCard_no());
			pstmt.setString(2, bList.getId());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	// 현재까지 구매한 내역 보기
	public List<CupengDTO> selectHistory(String id) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		List<CupengDTO> lists = new ArrayList<CupengDTO>();
		
		try {
			
			sql = "select DISTINCT a.cno, b.h_name, b.pay, b.cnt from history a ,(select h_name, sum(pay) pay, count(h_name) cnt from HISTORY where id = ? group by h_name) b where a.h_name = b.h_name and id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CupengDTO dto = new CupengDTO();
				dto.setCno(rs.getInt("cno"));
				dto.setH_name(rs.getString("h_name"));
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

	// 로그인성공시 오는곳
	public void startCupeng() {

	}

}
