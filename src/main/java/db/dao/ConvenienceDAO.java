package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.ConvenienceDTO;
import db.util.DBConnectionManager;

public class ConvenienceDAO {

	static Connection conn = null;
	static PreparedStatement psmt = null;
	static ResultSet rs = null;	
	
	public List<ConvenienceDTO> getConvenienceList() {
		List<ConvenienceDTO> convenienceList = null;
		try {
			conn = DBConnectionManager.connectDB();
			String query = "select * from convenience_list";
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				if(convenienceList == null)
					convenienceList = new ArrayList<ConvenienceDTO>();
				ConvenienceDTO convenience = new ConvenienceDTO(
						rs.getInt("CONVENIENCE_ID"),
						rs.getString("CONVENIENCE_NAME")
						);
				convenienceList.add(convenience);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return convenienceList;
	}
	
	public List<ConvenienceDTO> getConvenienceListByRestaurantId(int restaurantId) {
		List<ConvenienceDTO> convenienceList = null;
		try {
			conn = DBConnectionManager.connectDB();
			String query = " select "
					 	 + " rc.restaurant_id restaurant_id, "
					 	 + " rc.convenience_id convenience_id, "
					 	 + " cl.convenience_name convenience_name "
					 	 + " from "
					 	 + " restaurant_convenience rc, "
					 	 + " convenience_list cl "
					 	 + " where "
					 	 + " rc.convenience_id = cl.convenience_id "
						 + " and rc.restaurant_id = ? ";
			psmt = conn.prepareStatement(query);
			psmt.setInt(1, restaurantId);
			rs = psmt.executeQuery();
			while (rs.next()) {
				if(convenienceList == null)
					convenienceList = new ArrayList<ConvenienceDTO>();
				ConvenienceDTO convenience = new ConvenienceDTO(
						rs.getInt("restaurant_id"),
						rs.getInt("convenience_id"),
						rs.getString("convenience_name")
						);
				convenienceList.add(convenience);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return convenienceList;
	}
}
