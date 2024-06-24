package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.util.DBConnectionManager;
import db.dto.ProductDTO;

public class ProductDAO {
	
	static Connection conn = null;
	static PreparedStatement psmt = null;
	static ResultSet rs = null;	
	
	public List<ProductDTO> findProductList() {
		
		List<ProductDTO> productList = null;
		
		try {
			conn = DBConnectionManager.connectDB();
			String query = "select * from product ";
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
			productList = new ArrayList<ProductDTO>();
			while (rs.next()) {
				ProductDTO product = new ProductDTO();
				product.setP_code(rs.getInt("p_code"));
				product.setP_name(rs.getString("p_name"));
				product.setP_price(rs.getInt("p_price"));

				productList.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return productList;
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
