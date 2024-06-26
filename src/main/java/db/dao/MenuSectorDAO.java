package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.MenuSectorDTO;
import db.util.DBConnectionManager;

public class MenuSectorDAO {
	
	static Connection conn = null;
	static PreparedStatement psmt = null;
	static ResultSet rs = null;	
	
	public List<MenuSectorDTO> getMenuSectorList() {
		List<MenuSectorDTO> menuSectorList = null;
		try {
			conn = DBConnectionManager.connectDB();
			String query = " select "
						 + " menu_sector_id, "
						 + " menu_sector_name, "
						 + " to_char(menu_sector_price, '999,999') menu_sector_price "
						 + " from menu_sector_list ";
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				if(menuSectorList == null)
					menuSectorList = new ArrayList<MenuSectorDTO>();
				MenuSectorDTO menuSector = new MenuSectorDTO(
						rs.getInt("MENU_SECTOR_ID"),
						rs.getString("MENU_SECTOR_NAME"),
						rs.getString("MENU_SECTOR_PRICE")
						);
								
				menuSectorList.add(menuSector);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return menuSectorList;
	}
}
