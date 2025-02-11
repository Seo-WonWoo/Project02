package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.dto.MemberAppraisalDTO;
import db.util.DBConnectionManager;

public class MemberAppraisalDAO {

	static Connection conn = null;
	static PreparedStatement psmt = null;
	static ResultSet rs = null;	
	
	
	//회원번호, 업소아이디를 통한 리뷰평가 이력 검색 함수(리뷰평가처리페이지)
	public MemberAppraisalDTO findMemberAppraisalByMemberNumberAndRestaurantId(int memberNumber, int restaurantId) {
		MemberAppraisalDTO memberAppraisal = null;
	       try {
	           conn = DBConnectionManager.connectDB();
	           String query = " select * from member_appraisal "
	           				+ " where member_number = ? and restaurant_id = ? ";
	           psmt = conn.prepareStatement(query);
	           psmt.setInt(1, memberNumber);
	           psmt.setInt(2, restaurantId);
	           rs = psmt.executeQuery();	           
	           if (rs.next()) {
	        	   memberAppraisal = new MemberAppraisalDTO(
	                   rs.getInt("MEMBER_NUMBER"),
	                   rs.getInt("RESTAURANT_ID"),
	                   rs.getString("APPRAISAL_STATE")
	               );
	           }
	       } catch (SQLException e) {
	           e.printStackTrace();
	       } finally {
	           DBConnectionManager.disconnectDB(conn, psmt, rs);
	       }
	       return memberAppraisal;
	}
	
	
	//회원번호, 업소아이디를 통한 리뷰평가 이력 추가 함수(리뷰평가처리페이지)
	public int addMemberAppraisal(int memberNumber, int restaurantId) {
		int result = 0;
		try {
			conn = DBConnectionManager.connectDB();
			String query = " insert into member_appraisal values(?, ?, 'T') ";
			psmt = conn.prepareStatement(query);			
			 psmt.setInt(1, memberNumber);
	         psmt.setInt(2, restaurantId);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		}
		return result;
	}
	
}
