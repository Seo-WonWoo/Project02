package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.RestaurantSectorDTO;
import db.util.DBConnectionManager;

public class RestaurantSectorDAO {

	static Connection conn = null;
	static PreparedStatement psmt = null;
	static ResultSet rs = null;	
	
	
	//업종 전체 리스트 호출 함수(메인페이지, 검색페이지)
	public List<RestaurantSectorDTO> getRestaurantSectorList() {
		List<RestaurantSectorDTO> restaurantSectorList = null;
		try {
			conn = DBConnectionManager.connectDB();
			String query = "select * from restaurant_sector";
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				if(restaurantSectorList == null)
					restaurantSectorList = new ArrayList<RestaurantSectorDTO>();
				RestaurantSectorDTO restaurantSector = new RestaurantSectorDTO(
						rs.getInt("RESTAURANT_SECTOR_ID"),
						rs.getString("RESTAURANT_SECTOR_NAME")
						);
								
				restaurantSectorList.add(restaurantSector);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return restaurantSectorList;
	}
}
