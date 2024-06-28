package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.MemberDTO;
import db.util.DBConnectionManager;

public class MemberDAO {
	static Connection conn = null;
	static PreparedStatement psmt = null;
	static ResultSet rs = null;	
	
	public List<MemberDTO> findMemberList() {
		List<MemberDTO> memberList = null;
		
		try {
			conn = DBConnectionManager.connectDB();
			
			String query = "SELECT * FROM member_list ";					
			
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
			memberList = new ArrayList<MemberDTO>();
			while (rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setMemberNumber(rs.getInt("member_number"));	 			
				member.setMemberId(rs.getString("member_id"));
				member.setMemberPw(rs.getString("member_pw"));
				member.setMemberName(rs.getString("member_name"));				
				member.setMemberJumin(rs.getString("member_juminnumber"));
				member.setMemberTel(rs.getString("member_tel"));
				member.setMemberAddress(rs.getString("member_address"));
				member.setMemberState(rs.getString("member_state"));
				memberList.add(member);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return memberList;
	
	}
}
