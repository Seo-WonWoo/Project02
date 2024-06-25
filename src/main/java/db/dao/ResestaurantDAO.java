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
	
	public List<RestaurantDTO> findRestaurantList(
			int sCity, int sCountry, int sDong, int sRS, int sCertification,
			int sConv1, int sConv2, int sConv3, int sConv4,
			int sConv5, int sConv6, int sConv7, int sConv8) {
		
		List<RestaurantDTO> restaurantList = null;
		
		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " select "
					+ " rs.restaurant_sector_name restaurant_sector_name, "
					+ " rl.restaurant_name restaurant_name, "
					+ " rm.menu_name menu_name, "
					+ " rm.menu_price menu_price, "
					+ " rl.restaurant_tel restaurant_tel, "
					+ " cl.certification_name certification_name, "
					+ " rl.restaurant_address restaurant_address "
					+ " from "
					+ " restaurant_list rl, "
					+ " restaurant_sector rs, "
					+ " restaurant_menu rm, "
					+ " certification_list cl, "
					+ " restaurant_convenience rc "
					+ " where "
					+ " rl.restaurant_sector_id = rs.restaurant_sector_id "
					+ " and rl.restaurant_id = rm.restaurant_id "
					+ " and rl.certification_id = cl.certification_id "
					+ " and rl.restaurant_id = rc.restaurant_id "
					+ " and rm.menu_number = 1 "
					+ " and rl.restaurant_state = 'T' ";
			if( sCity > 0)
				query += " and rl.city_id = " + sCity;
			if( sCountry > 0)
				query += " and rl.county_id = " + sCountry;
			if( sDong > 0)
				query += " and rl.dong_id = " + sDong;
			if( sRS > 0)
				query += " and rl.restaurant_sector_id = " + sRS;
			if( sCertification > 0)
				query += " and rl.certification_id = " + sCertification;
			if( sConv1 > 0)
				query += " and rc.convenience_id = " + sConv1;
			if( sConv2 > 0)
				query += " and rc.convenience_id = " + sConv2;
			if( sConv3 > 0)
				query += " and rc.convenience_id = " + sConv3;
			if( sConv4 > 0)
				query += " and rc.convenience_id = " + sConv4;
			if( sConv5 > 0)
				query += " and rc.convenience_id = " + sConv5;
			if( sConv6 > 0)
				query += " and rc.convenience_id = " + sConv6;
			if( sConv7 > 0)
				query += " and rc.convenience_id = " + sConv7;
			if( sConv8 > 0)
				query += " and rc.convenience_id = " + sConv8;

			query += " group by rs.restaurant_sector_name, rl.restaurant_name, rm.menu_name, rm.menu_price, "
					+ "rl.restaurant_tel, cl.certification_name, rl.restaurant_address ";
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
			restaurantList = new ArrayList<RestaurantDTO>();
			while (rs.next()) {
				RestaurantDTO restaurant = new RestaurantDTO();
				restaurant.setRestaurantId(rs.getInt("RESTAURANT_ID"));
				restaurant.setRestaurantSectorId(rs.getInt("RESTAURANT_SECTOR_ID"));
				restaurant.setRestaurantName(rs.getString("RESTAURANT_NAME"));
				restaurant.setRestaurantTel(rs.getString("RESTAURANT_TEL"));
				restaurant.setCityId(rs.getInt("CITY_ID"));
				restaurant.setCountryId(rs.getInt("COUNTY_ID"));
				restaurant.setDongId(rs.getInt("DONG_ID"));
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

 public List<RestaurantDTO> findRestaurantList2() {
		
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
				restaurant.setCityId(rs.getInt("CITY_ID"));
				restaurant.setCountryId(rs.getInt("COUNTY_ID"));
				restaurant.setDongId(rs.getInt("DONG_ID"));
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
