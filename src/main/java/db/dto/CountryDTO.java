package db.dto;

public class CountryDTO {
	
	int countryId;
	String countryName;
	int cityId;
	
	public CountryDTO() {}
	
	public CountryDTO(int countryId, String countryName, int cityId) {
		super();
		this.countryId = countryId;
		this.countryName = countryName;
		this.cityId = cityId;
	}

	public int getCountryId() {
		return countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	
	
}
