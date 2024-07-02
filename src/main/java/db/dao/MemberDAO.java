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
	
	//등록회원 전체 리스트 호출 함수(회원관리)
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
	
	
	
	//회원아이디,비밀번호 입력값을 통한 등록회원 호출 함수(로그인처리페이지)
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
	
	
	//회원아이디를 통한 등록회원 호출 함수(리뷰평가처리페이지)
	public MemberDTO findMemberById(String memberId) {
	       MemberDTO member = null;
	       try {
	           conn = DBConnectionManager.connectDB();
	           String query = " select * "
	           				+ " from member_list "
	           				+ " where "
	           				+ " member_id = ? ";
	           psmt = conn.prepareStatement(query);
	           psmt.setString(1, memberId);
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
	
	//회원 등록정보를 통한 회원 추가등록 함수(회원가입페이지)
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
	

	
	//멤버 넘버를 통한 회원 휴먼계정 변경 함수(회원관리페이지)
	public int modifySleepAccountMemberbyMemberNumber(int memberNumber) {		
		int result = 0;
		
		try {
			conn = DBConnectionManager.connectDB();
			String query = " update member_list "
						 + " set member_state = 'F' "
						 + " where member_number = ? ";
			psmt = conn.prepareStatement(query);
			psmt.setInt(1, memberNumber );
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		}
		return result;
	}
	
	
	//멤버 넘버를 통한 회원 휴먼계정 복구 함수(회원관리페이지)
	public int modifyAwakeMemberbyMemberNumber(int memberNumber) {		
		int result = 0;
		
		try {
			conn = DBConnectionManager.connectDB();
			String query = " update member_list "
						 + " set member_state = 'T' "
						 + " where member_number = ? ";
			psmt = conn.prepareStatement(query);
			psmt.setInt(1, memberNumber );
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		}
		return result;
	}
	
	
}
