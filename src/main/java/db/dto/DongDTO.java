package db.dto;

public class DongDTO {

	int dongId;
	String dongName;
	int countryId;
	int cityId;
	
	public DongDTO() {}

	public DongDTO(int dongId, String dongName, int countryId, int cityId) {
		super();
		this.dongId = dongId;
		this.dongName = dongName;
		this.countryId = countryId;
		this.cityId = cityId;
	}

	public int getDongId() {
		return dongId;
	}

	public void setDongId(int dongId) {
		this.dongId = dongId;
	}

	public String getDongName() {
		return dongName;
	}

	public void setDongName(String dongName) {
		this.dongName = dongName;
	}

	public int getCountryId() {
		return countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	
	
	
	
}
