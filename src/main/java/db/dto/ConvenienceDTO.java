package db.dto;

public class ConvenienceDTO {

	int resraurantId;
	int convenienceId;
	String convenienceName;
	
	public ConvenienceDTO() {}
	
	
	public ConvenienceDTO(int convenienceId, String convenienceName) {
		super();
		this.convenienceId = convenienceId;
		this.convenienceName = convenienceName;
	}


	public ConvenienceDTO(int resraurantId, int convenienceId, String convenienceName) {
		super();
		this.resraurantId = resraurantId;
		this.convenienceId = convenienceId;
		this.convenienceName = convenienceName;
	}


	public int getResraurantId() {
		return resraurantId;
	}


	public void setResraurantId(int resraurantId) {
		this.resraurantId = resraurantId;
	}


	public int getConvenienceId() {
		return convenienceId;
	}


	public void setConvenienceId(int convenienceId) {
		this.convenienceId = convenienceId;
	}


	public String getConvenienceName() {
		return convenienceName;
	}


	public void setConvenienceName(String convenienceName) {
		this.convenienceName = convenienceName;
	}

	
	
	
}
