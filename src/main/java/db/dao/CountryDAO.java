package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.CountryDTO;
import db.util.DBConnectionManager;

public class CountryDAO {

	static Connection conn = null;
	static PreparedStatement psmt = null;
	static ResultSet rs = null;	
	
	//구 전체 리스트 호출 함수
	public List<CountryDTO> getCountryList() {
		List<CountryDTO> CountryList = null;
		try {
			conn = DBConnectionManager.connectDB();
			String query = "select * from county_list";
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				if(CountryList == null)
					CountryList = new ArrayList<CountryDTO>();
				CountryDTO Country = new CountryDTO(
						rs.getInt("COUNTY_ID"),
						rs.getString("COUNTY_NAME"),
						rs.getInt("CITY_ID")
						);
				CountryList.add(Country);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return CountryList;
	}
		
	//시 아이디를 통한 구 리스트 호출 함수(검색페이지)
	public List<CountryDTO> findCountryByCityId(int cityId) {
		List<CountryDTO> CountryList = null;
		try {
			conn = DBConnectionManager.connectDB();
			String query = "select * from county_list where city_id = ?";
			psmt = conn.prepareStatement(query);
			psmt.setInt(1, cityId);
			rs = psmt.executeQuery();		
			
			while (rs.next()) {
				if(CountryList == null)
					CountryList = new ArrayList<CountryDTO>();
				CountryDTO Country = new CountryDTO(
						rs.getInt("COUNTY_ID"),
						rs.getString("COUNTY_NAME"),
						rs.getInt("CITY_ID")
						);
				CountryList.add(Country);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return CountryList;
	}
}
