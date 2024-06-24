package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.ProductDTO;
import db.dto.RestaurantDTO;
import db.util.DBConnectionManager;

public class ResestaurantDAO {

	static Connection conn = null;
	static PreparedStatement psmt = null;
	static ResultSet rs = null;	
	
	public List<RestaurantDTO> findRestaurantList() {
		
		List<RestaurantDTO> restaurantList = null;
		
		try {
			conn = DBConnectionManager.connectDB();
			
			String query = "select * from restaurant_list ";
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
			restaurantList = new ArrayList<RestaurantDTO>();
			while (rs.next()) {
				RestaurantDTO restaurant = new RestaurantDTO();
				
				restaurant.setRestaurantId(rs.getInt("RESTAURANT_ID"));
				restaurant.setRestaurantSectorId(rs.getInt("RESTAURANT_SECTOR_ID"));
				restaurant.setRestaurantName(rs.getString("RESTAURANT_NAME"));
				restaurant.setRestaurantTel(rs.getString("RESTAURANT_TEL"));
				restaurant.setRestaurantCity(rs.getString("RESTAURANT_CITY"));
				restaurant.setRestaurantCountry(rs.getString("RESTAURANT_COUNTY"));
				restaurant.setRestaurantDong(rs.getString("RESTAURANT_DONG"));
				restaurant.setRestaurantAddress(rs.getString("RESTAURANT_ADDRESS"));
				restaurant.setCertificationId(rs.getInt("CERTIFICATION_ID"));
				restaurant.setRestaurantState(rs.getString("RESTAURANT_STATE"));
				
				restaurantList.add(restaurant);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return restaurantList;
	}

public List<RestaurantDTO> findRestaurantList1() {
		
		List<RestaurantDTO> restaurantList = null;
		
		try {
			conn = DBConnectionManager.connectDB();
			String query = "select * from restaurant_list ";
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
			restaurantList = new ArrayList<RestaurantDTO>();
			while (rs.next()) {
				RestaurantDTO restaurant = new RestaurantDTO();
				
				restaurant.setRestaurantId(rs.getInt("RESTAURANT_ID"));
				restaurant.setRestaurantSectorId(rs.getInt("RESTAURANT_SECTOR_ID"));
				restaurant.setRestaurantName(rs.getString("RESTAURANT_NAME"));
				restaurant.setRestaurantTel(rs.getString("RESTAURANT_TEL"));
				restaurant.setRestaurantCity(rs.getString("RESTAURANT_CITY"));
				restaurant.setRestaurantCountry(rs.getString("RESTAURANT_COUNTY"));
				restaurant.setRestaurantDong(rs.getString("RESTAURANT_DONG"));
				restaurant.setRestaurantAddress(rs.getString("RESTAURANT_ADDRESS"));
				restaurant.setCertificationId(rs.getInt("CERTIFICATION_ID"));
				restaurant.setRestaurantState(rs.getString("RESTAURANT_STATE"));
				
				restaurantList.add(restaurant);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return restaurantList;
	}
	
	public ProductDTO findProductByPCode(int p_code) {
		ProductDTO product = null;
		try {
			conn = DBConnectionManager.connectDB();
			String query = "select * from product where p_code = ?";
			psmt = conn.prepareStatement(query);
			psmt.setInt(1, p_code);
			rs = psmt.executeQuery();			
			if (rs.next()) {
				product = new ProductDTO();
				product.setP_code(rs.getInt("p_code"));
				product.setP_name(rs.getString("p_name"));
				product.setP_price(rs.getInt("p_price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return product;
	}
}
