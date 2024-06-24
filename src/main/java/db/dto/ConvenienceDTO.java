package db.dto;

public class ConvenienceDTO {

	int convenienceId;
	String convenienceName;
	
	
	public ConvenienceDTO(int convenienceId, String convenienceName) {
		super();
		this.convenienceId = convenienceId;
		this.convenienceName = convenienceName;
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
