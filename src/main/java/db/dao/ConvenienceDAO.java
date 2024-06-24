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
}
