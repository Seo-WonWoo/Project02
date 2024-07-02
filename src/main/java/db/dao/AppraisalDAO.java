package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.AppraisalDTO;
import db.util.DBConnectionManager;

public class AppraisalDAO {
	
	static Connection conn = null;
	static PreparedStatement psmt = null;
	static ResultSet rs = null;	
	
	
	//평가 전체 리스트 호출 함수(상세페이지)
	public List<AppraisalDTO> getAppraisalList() {
		List<AppraisalDTO> appraisalList = null;
		try {
			conn = DBConnectionManager.connectDB();
			String query = "select * from appraisal_list";
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				if(appraisalList == null)
					appraisalList = new ArrayList<AppraisalDTO>();
				AppraisalDTO appraisal = new AppraisalDTO(
						rs.getInt("APPRAISAL_ID"),
						rs.getString("APPRAISAL_NAME")
						);
				appraisalList.add(appraisal);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return appraisalList;
	}
	
	//업소 아이디를 통한 평가 데이터 호출 함수(상세페이지)
	public List<AppraisalDTO> getAppraisalListByRestaurantId(int restaurantId) {
		List<AppraisalDTO> appraisalList = null;
		try {
			conn = DBConnectionManager.connectDB();
			String query = " select "
						 + " ra.restaurant_id restaurant_id, "
						 + " ra.appraisal_id appraisal_id, "
						 + " al.appraisal_name appraisal_name, "
						 + " ra.appraisal_check_count appraisal_check_count "
						 + " from "
						 + " restaurant_appraisal ra, appraisal_list al "
						 + " where "
						 + " ra.appraisal_id = al.appraisal_id "
						 + " and ra.appraisal_check_count > 0 "
						 + " and ra.restaurant_id = ? "
						 + " order by ra.appraisal_check_count desc ";
			psmt = conn.prepareStatement(query);
			psmt.setInt(1, restaurantId);
			rs = psmt.executeQuery();
			while (rs.next()) {
				if(appraisalList == null)
					appraisalList = new ArrayList<AppraisalDTO>();
				AppraisalDTO appraisal = new AppraisalDTO(
						rs.getInt("restaurant_id"),
						rs.getInt("appraisal_id"),
						rs.getString("appraisal_name"),
						rs.getInt("appraisal_check_count")
						);
				appraisalList.add(appraisal);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return appraisalList;
	}
	
	
	//업소 아이디를 통한 평가항목 수정 함수(리뷰평가처리페이지)
	public int modifyAppraisal(int restId, int sAppr, int ApprCount) {		
		int result = 0;
		
		try {
			conn = DBConnectionManager.connectDB();
			String query = " update restaurant_appraisal"
						 + " set appraisal_check_count = ?"
						 + " where restaurant_id = ? and appraisal_id = ? ";
			psmt = conn.prepareStatement(query);
			psmt.setInt(1, ApprCount );
			psmt.setInt(2, restId );
			psmt.setInt(3, sAppr);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		}
		return result;
	}
}
