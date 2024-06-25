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

public class RestaurantDAO {

	static Connection conn = null;
	static PreparedStatement psmt = null;
	static ResultSet rs = null;	
	
	public List<RestaurantDTO> findRestaurantList() {
		
		List<RestaurantDTO> restaurantList = null;
		
		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " select "
							+ " rl.restaurant_name restaurant_name, "
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
							+ " rl.restaurant_name, "
							+ " rm.menu_name, "
							+ " rm.menu_price, "
							+ " rss.star_score, "
							+ " rl.restaurant_address ";					
			
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
			restaurantList = new ArrayList<RestaurantDTO>();
			while (rs.next()) {
				RestaurantDTO restaurant = new RestaurantDTO();
				restaurant.setRestaurantName(rs.getString("restaurant_name"));
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
							+ " rl.restaurant_name restaurant_name, "
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
						+ " rl.restaurant_name, "
						+ " rm.menu_name, "
						+ " rm.menu_price, "
						+ " rss.star_score, "
						+ " rl.restaurant_address ";					
			
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
			restaurantList = new ArrayList<RestaurantDTO>();
			while (rs.next()) {
				RestaurantDTO restaurant = new RestaurantDTO();
				restaurant.setRestaurantName(rs.getString("restaurant_name"));
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
			int sCity, int sCountry, int sDong, int sRS, int sCertification,
			int sConv1, int sConv2, int sConv3, int sConv4,
			int sConv5, int sConv6, int sConv7, int sConv8) {
		
		List<RestaurantDTO> restaurantList = null;
		
		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " select "
							+ " rl.restaurant_name restaurant_name, "
							+ " rm.menu_name menu_name, "
							+ " rm.menu_price menu_price, "
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
							+ " rl.restaurant_name, "
							+ " rm.menu_name, "
							+ " rm.menu_price, "
							+ " rss.star_score, "
							+ " rl.restaurant_address ";
					
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
