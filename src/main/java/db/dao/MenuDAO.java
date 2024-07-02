package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.MenuDTO;
import db.util.DBConnectionManager;

public class MenuDAO {

	static Connection conn = null;
	static PreparedStatement psmt = null;
	static ResultSet rs = null;	
	
	//업소 아이디를 통한 전체 메뉴 리스트 호출 함수(상세페이지)
	public List<MenuDTO> getMenuByRestaurantId(int restaurantId) {
	       List<MenuDTO> menuList = null;
	       try {
	           conn = DBConnectionManager.connectDB();
	           String query = "SELECT restaurant_id, menu_number, menu_name, to_char(menu_price, '999,999') menu_price, menu_sector_id, menu_state FROM restaurant_menu WHERE restaurant_id = ?";
	       psmt = conn.prepareStatement(query);
	       psmt.setInt(1, restaurantId);
	       rs = psmt.executeQuery();
	       menuList = new ArrayList<MenuDTO>();
	       while (rs.next()) {
	           MenuDTO menu = new MenuDTO(
	               rs.getInt("restaurant_id"),
	               rs.getInt("menu_number"),
	               rs.getString("menu_name"),
	               rs.getString("menu_price"),
	               rs.getInt("menu_sector_id"),
	               rs.getString("menu_state")
	               );
	               menuList.add(menu);
	           }
	       } catch (SQLException e) {
	           e.printStackTrace();
	       } finally {
	           DBConnectionManager.disconnectDB(conn, psmt, rs);
	       }
	       return menuList;
	}	
}
