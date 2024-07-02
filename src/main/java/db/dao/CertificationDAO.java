package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.CertificationDTO;
import db.util.DBConnectionManager;

public class CertificationDAO {

	static Connection conn = null;
	static PreparedStatement psmt = null;
	static ResultSet rs = null;	
	
	//인증 전체 리스트 호출 함수(메인페이지, 상세페이지)
	public List<CertificationDTO> getCertificationList() {
		List<CertificationDTO> certificationList = null;
		try {
			conn = DBConnectionManager.connectDB();
			String query = "select * from certification_list";
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				if(certificationList == null)
					certificationList = new ArrayList<CertificationDTO>();
				CertificationDTO certification = new CertificationDTO(
						rs.getInt("CERTIFICATION_ID"),
						rs.getString("CERTIFICATION_NAME")
						);
				
				certificationList.add(certification);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return certificationList;
	}
	

}
