package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.AppraisalDTO;
import db.dto.ConvenienceDTO;
import db.util.DBConnectionManager;

public class AppraisalDAO {
	
	static Connection conn = null;
	static PreparedStatement psmt = null;
	static ResultSet rs = null;	
	
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
						 + " and ra.restaurant_id = ? ";
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
}
