package db.dto;

public class AppraisalDTO {

	int restaurantId;
	int appraisalId;
	String appraisalName;
	int appraisalCheckCount;
	
	public AppraisalDTO() {}	
	
	
	public AppraisalDTO(int appraisalId, String appraisalName) {
		super();
		this.appraisalId = appraisalId;
		this.appraisalName = appraisalName;
	}

	public AppraisalDTO(int restaurantId, int appraisalId, String appraisalName, int appraisalCheckCount) {
		super();
		this.restaurantId = restaurantId;
		this.appraisalId = appraisalId;
		this.appraisalName = appraisalName;
		this.appraisalCheckCount = appraisalCheckCount;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public int getAppraisalId() {
		return appraisalId;
	}

	public void setAppraisalId(int appraisalId) {
		this.appraisalId = appraisalId;
	}

	public String getAppraisalName() {
		return appraisalName;
	}

	public void setAppraisalName(String appraisalName) {
		this.appraisalName = appraisalName;
	}

	public int getAppraisalCheckCount() {
		return appraisalCheckCount;
	}

	public void setAppraisalCheckCount(int appraisalCheckCount) {
		this.appraisalCheckCount = appraisalCheckCount;
	}
	
	
	
}
