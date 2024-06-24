package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.CityDTO;
import db.util.DBConnectionManager;

public class CityDAO {

	static Connection conn = null;
	static PreparedStatement psmt = null;
	static ResultSet rs = null;	
	
	public List<CityDTO> getCityList() {
		List<CityDTO> cityList = null;
		try {
			conn = DBConnectionManager.connectDB();
			String query = "select * from city_list";
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				if(cityList == null)
					cityList = new ArrayList<CityDTO>();
				CityDTO city = new CityDTO(
						rs.getInt("CITY_ID"),
						rs.getString("CITY_NAME")
						);
				cityList.add(city);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return cityList;
	}
}
