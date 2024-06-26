package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.RestaurantDTO;
import db.util.DBConnectionManager;

public class RestaurantDAO {

	static Connection conn = null;
	static PreparedStatement psmt = null;
	static ResultSet rs = null;	
	
	public List<RestaurantDTO> findRestaurantList() {
		
		List<RestaurantDTO> restaurantList = null;
		
		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " select "
							+ " rl.restaurant_id restaurant_id, "
							+ " rl.restaurant_name restaurant_name, "
							+ " rl.restaurant_tel restaurant_tel, "
							+ " rm.menu_name menu_name, "
							+ " to_char(nvl(rm.menu_price, 0), '999,999') menu_price, "
							+ " round(rss.star_score, 1) star_score, "
							+ " rl.restaurant_address restaurant_address "
							+ " from "
							+ " restaurant_list rl, "
							+ " restaurant_sector rs, "
							+ " restaurant_menu rm, "
							+ " certification_list cl, "
							+ " restaurant_convenience rc, "
							+ " restaurant_star_score rss "
							+ " where "
							+ " rl.restaurant_sector_id = rs.restaurant_sector_id "
							+ " and rl.restaurant_id = rm.restaurant_id "
							+ " and rl.certification_id = cl.certification_id "
							+ " and rl.restaurant_id = rc.restaurant_id "
							+ " and rl.restaurant_id = rss.restaurant_id "
							+ " and rm.menu_number = 1 "
							+ " and rl.restaurant_state = 'T' "
							+ " group by "
							+ " rl.restaurant_id, "
							+ " rl.restaurant_name, "
							+ " rl.restaurant_tel, "
							+ " rm.menu_name, "
							+ " rm.menu_price, "
							+ " rss.star_score, "
							+ " rl.restaurant_address ";					
			
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
			restaurantList = new ArrayList<RestaurantDTO>();
			while (rs.next()) {
				RestaurantDTO restaurant = new RestaurantDTO();
				restaurant.setRestaurantId(rs.getInt("restaurant_id"));				
				restaurant.setRestaurantName(rs.getString("restaurant_name"));
				restaurant.setRestaurantTel(rs.getString("restaurant_tel"));
				restaurant.setMenuName(rs.getString("menu_name"));				
				restaurant.setMenuPrice(rs.getString("menu_price"));
				restaurant.setStarScore(rs.getDouble("star_score"));
				restaurant.setRestaurantAddress(rs.getString("restaurant_address"));
				restaurantList.add(restaurant);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return restaurantList;
	}
	
public List<RestaurantDTO> findRestaurantList(
		int sCity, int sCountry, int sDong, int sRS, int sCert,
		int sConv1, int sConv2, int sConv3, int sConv4,
		int sConv5, int sConv6, int sConv7, int sConv8,
		String sRN, String sKW) {
		
		List<RestaurantDTO> restaurantList = null;
		
		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " select "
							+ " rl.restaurant_id restaurant_id, "
							+ " rl.restaurant_name restaurant_name, "
							+ " rl.restaurant_tel restaurant_tel, "
							+ " rm.menu_name menu_name, "							
							+ " to_char(nvl(rm.menu_price, 0), '999,999') menu_price, "
							+ " round(rss.star_score, 1) star_score, "
							+ " rl.restaurant_address restaurant_address "
							+ " from "
							+ " restaurant_list rl, "
							+ " restaurant_sector rs, "
							+ " restaurant_menu rm, "
							+ " certification_list cl, "
							+ " restaurant_convenience rc, "
							+ " restaurant_star_score rss "
							+ " where "
							+ " rl.restaurant_sector_id = rs.restaurant_sector_id "
							+ " and rl.restaurant_id = rm.restaurant_id "
							+ " and rl.certification_id = cl.certification_id "
							+ " and rl.restaurant_id = rc.restaurant_id "
							+ " and rl.restaurant_id = rss.restaurant_id "
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
			if( sCert > 0)
				query += " and rl.certification_id = " + sCert;
			
			
			if( sConv1 > 0 || sConv2 > 0 || sConv3 > 0 || sConv4 > 0 || sConv5 > 0 || sConv6 > 0 || sConv7 > 0 || sConv8 > 0 )
				query += " and rc.convenience_id in ( " + sConv1 + ", " + sConv2 + ", " + sConv3 + ", " + sConv4 + ", " + sConv5 + ", " + sConv6 + ", " + sConv7 + ", " + sConv8 + ") ";
			
			
			if( sRN != null)
				query += " and rl.restaurant_name like '%" + sRN + "%' ";
			
			if( sKW != null)
				query += " and rm.menu_name like '%" + sRN + "%' ";
			
			query += " group by "
						+ " rl.restaurant_id, "
						+ " rl.restaurant_name, "
						+ " rl.restaurant_tel, "
						+ " rm.menu_name, "
						+ " rm.menu_price, "
						+ " rss.star_score, "
						+ " rl.restaurant_address ";					
			
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
			restaurantList = new ArrayList<RestaurantDTO>();
			while (rs.next()) {
				RestaurantDTO restaurant = new RestaurantDTO();
				restaurant.setRestaurantId(rs.getInt("restaurant_id"));				
				restaurant.setRestaurantName(rs.getString("restaurant_name"));
				restaurant.setRestaurantTel(rs.getString("restaurant_tel"));
				restaurant.setMenuName(rs.getString("menu_name"));				
				restaurant.setMenuPrice(rs.getString("menu_price"));
				restaurant.setStarScore(rs.getDouble("star_score"));
				restaurant.setRestaurantAddress(rs.getString("restaurant_address"));
				restaurantList.add(restaurant);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return restaurantList;
	}
	
	public List<RestaurantDTO> shutDownRestaurantList() {
	
	List<RestaurantDTO> restaurantList = null;
	
	try {
		conn = DBConnectionManager.connectDB();
		
		String query = " select "
					 + " restaurant_name, "
					 + " restaurant_tel, "
					 + " restaurant_state "
					 + " from restaurant_list "
					 + " where restaurant_state in('P', 'F') ";
		
		psmt = conn.prepareStatement(query);
		rs = psmt.executeQuery();
		restaurantList = new ArrayList<RestaurantDTO>();
		while (rs.next()) {
			RestaurantDTO restaurant = new RestaurantDTO();
			restaurant.setRestaurantName(rs.getString("restaurant_name"));
			restaurant.setRestaurantTel(rs.getString("restaurant_tel"));
			restaurant.setRestaurantState(rs.getString("restaurant_state"));
			restaurantList.add(restaurant);	
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		DBConnectionManager.disconnectDB(conn, psmt, rs);
	}
	return restaurantList;
}

}
