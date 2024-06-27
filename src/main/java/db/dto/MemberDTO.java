package db.dto;

public class MemberDTO {

	int memberNumber;
	String memberId;
	String memberPw;
	String memberName;
	String memberJuminNumber;
	String memberTel;
	String memberAddress;
	String memberState;
	
	public MemberDTO() {}

	public MemberDTO(int memberNumber, String memberId, String memberPw, String memberName, String memberJuminNumber,
			String memberTel, String memberAddress, String memberState) {
		super();
		this.memberNumber = memberNumber;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberJuminNumber = memberJuminNumber;
		this.memberTel = memberTel;
		this.memberAddress = memberAddress;
		this.memberState = memberState;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberJuminNumber() {
		return memberJuminNumber;
	}

	public void setMemberJuminNumber(String memberJuminNumber) {
		this.memberJuminNumber = memberJuminNumber;
	}

	public String getMemberTel() {
		return memberTel;
	}

	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberState() {
		return memberState;
	}

	public void setMemberState(String memberState) {
		this.memberState = memberState;
	}
	
	
	
	
}
