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
	
	public List<MemberDTO> getMemberList() {
	       List<MemberDTO> memberList = null;
	       try {
	           conn = DBConnectionManager.connectDB();
	           String query = "select * from member_list ";
	           psmt = conn.prepareStatement(query);
	           rs = psmt.executeQuery();
	           memberList = new ArrayList<MemberDTO>();
	           while (rs.next()) {
	        	   MemberDTO member = new MemberDTO(
	        			   rs.getInt("MEMBER_NUMBER"),	                   
	                       rs.getString("MEMBER_ID"),
	                       rs.getString("MEMBER_PW"),
	                       rs.getString("MEMBER_NAME"),
	                       rs.getString("MEMBER_JUMINNUMBER"),
	                       rs.getString("MEMBER_TEL"),
	                       rs.getString("MEMBER_ADDRESS"),
	                       rs.getString("MEMBER_POSITION"),
	                       rs.getString("MEMBER_STATE")
	               );
	               memberList.add(member);
	           }
	       } catch (SQLException e) {
	           e.printStackTrace();
	       } finally {
	           DBConnectionManager.disconnectDB(conn, psmt, rs);
	       }
	       return memberList;
	   }
	
	
	
	
	public MemberDTO findMemberByIdAndPw(String memberId, String memberPw) {
       MemberDTO member = null;
       try {
           conn = DBConnectionManager.connectDB();
           String query = " select * "
           				+ " from member_list "
           				+ " where "
           				+ " member_id = ? "
           				+ " and member_pw = ? ";
           psmt = conn.prepareStatement(query);
           psmt.setString(1, memberId);
           psmt.setString(2, memberPw);
           rs = psmt.executeQuery();	           
           if (rs.next()) {
        	   member = new MemberDTO(
                   rs.getInt("MEMBER_NUMBER"),	                   
                   rs.getString("MEMBER_ID"),
                   rs.getString("MEMBER_PW"),
                   rs.getString("MEMBER_NAME"),
                   rs.getString("MEMBER_JUMINNUMBER"),
                   rs.getString("MEMBER_TEL"),
                   rs.getString("MEMBER_ADDRESS"),
                   rs.getString("MEMBER_POSITION"),
                   rs.getString("MEMBER_STATE")
               );	               
           }
       } catch (SQLException e) {
           e.printStackTrace();
       } finally {
           DBConnectionManager.disconnectDB(conn, psmt, rs);
       }
       return member;
	}
	
	public int addMember(String memberId, String memberPw, String memberName,
			String memberJuminNumber, String memberTel, String memberAddress) {
		int result = 0;
		try {
			conn = DBConnectionManager.connectDB();
			String query = " insert into member_list values(\r\n"
					+ "(select max(member_number)+1 from member_list), ?, ?, ?, ?, ?, ?, 'G', 'T')";
			psmt = conn.prepareStatement(query);			
			psmt.setString(1, memberId);
			psmt.setString(2, memberPw);
			psmt.setString(3, memberName);
			psmt.setString(4, memberJuminNumber);
			psmt.setString(5, memberTel);
			psmt.setString(6, memberAddress);
			result = psmt.executeUpdate();
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		}
		return result;
	}
	
	public int sleeperAccountMember(int memberNumber) {
		int result = 0;
		try {
			conn = DBConnectionManager.connectDB();
			String query = " update member_list"
						 + " set member_state = 'F' "
						 + " where member_number = ? ";
			psmt = conn.prepareStatement(query);
			psmt.setInt(1, memberNumber);
			result = psmt.executeUpdate();
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		}
		return result;
	}
	
	
}
