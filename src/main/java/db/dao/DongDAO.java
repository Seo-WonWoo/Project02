package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.DongDTO;
import db.util.DBConnectionManager;

public class DongDAO {
	
	static Connection conn = null;
	static PreparedStatement psmt = null;
	static ResultSet rs = null;	
	
	public List<DongDTO> getDongList() {
		List<DongDTO> DongList = null;
		try {
			conn = DBConnectionManager.connectDB();
			String query = "select * from dong_list";
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				if(DongList == null)
					DongList = new ArrayList<DongDTO>();
				DongDTO Dong = new DongDTO(
						rs.getInt("DONG_ID"),
						rs.getString("DONG_NAME"),
						rs.getInt("COUNTY_ID"),
						rs.getInt("CITY_ID")
						);
				DongList.add(Dong);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return DongList;
	}
	
	
	public DongDTO findDongByCountryId(int CountryId) {
		DongDTO Dong = null;
		try {
			conn = DBConnectionManager.connectDB();
			String query = "select * from dong_list where country_id = ?";
			psmt = conn.prepareStatement(query);
			psmt.setInt(1, CountryId);
			rs = psmt.executeQuery();			
			if (rs.next()) {
				Dong = new DongDTO(
						rs.getInt("DONG_ID"),
						rs.getString("DONG_NAME"),
						rs.getInt("COUNTY_ID"),
						rs.getInt("CITY_ID")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return Dong;
	}
}
