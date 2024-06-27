package db.dto;

public class MemberAppraisalDTO {

	int memberNumber;
	int restaurantId;
	String appraisalState;
	
	public MemberAppraisalDTO() {}
	
	public MemberAppraisalDTO(int memberNumber, int restaurantId, String appraisalState) {
		super();
		this.memberNumber = memberNumber;
		this.restaurantId = restaurantId;
		this.appraisalState = appraisalState;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public String getAppraisalState() {
		return appraisalState;
	}

	public void setAppraisalState(String appraisalState) {
		this.appraisalState = appraisalState;
	}
	
	
}
