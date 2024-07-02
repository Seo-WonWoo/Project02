package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.util.DBConnectionManager;

public class StarScoreDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	//업소 별점 수정 함수(리뷰평가처리페이지)
	public int modifyStarScore(int restId, double starScore, int starCount, int sStarScore) {		
		int result = 0;
		double starScoreCalculate = sStarScore != 0 ?  
				( (starScore * starCount) + sStarScore ) / (starCount + 1) : starScore;
		int starCountCalculate = sStarScore != 0 ? 
				starCount + 1 : starCount;
		try {
			conn = DBConnectionManager.connectDB();
			String query = " update restaurant_star_score "
						 + " set star_score = ?, star_count = ? "
						 + " where restaurant_id = ? ";
			psmt = conn.prepareStatement(query);
			psmt.setDouble(1, starScoreCalculate );
			psmt.setInt(2, starCountCalculate );
			psmt.setInt(3, restId);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		}
		return result;
	}
}
