package db.dto;

public class RestaurantDTO {
	int restaurantId;
	int restaurantSectorId;
	String restaurantSectorName;
	String restaurantName;
	String menuName;
	int menuPrice;
	String restaurantTel;
	int cityId;
	int countryId;
	int dongId;
	String restaurantAddress;
	int certificationId;
	String certificationName;
	String restaurantState;
	
	
	public RestaurantDTO() {}


	public RestaurantDTO(int restaurantId, int restaurantSectorId, String restaurantSectorName, String restaurantName,
			String restaurantTel, int cityId, int countryId, int dongId, String restaurantAddress, int certificationId,
			String certificationName, String restaurantState) {
		super();
		this.restaurantId = restaurantId;
		this.restaurantSectorId = restaurantSectorId;
		this.restaurantSectorName = restaurantSectorName;
		this.restaurantName = restaurantName;
		this.restaurantTel = restaurantTel;
		this.cityId = cityId;
		this.countryId = countryId;
		this.dongId = dongId;
		this.restaurantAddress = restaurantAddress;
		this.certificationId = certificationId;
		this.certificationName = certificationName;
		this.restaurantState = restaurantState;
	}


	public int getRestaurantId() {
		return restaurantId;
	}


	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}


	public int getRestaurantSectorId() {
		return restaurantSectorId;
	}


	public void setRestaurantSectorId(int restaurantSectorId) {
		this.restaurantSectorId = restaurantSectorId;
	}


	public String getRestaurantSectorName() {
		return restaurantSectorName;
	}


	public void setRestaurantSectorName(String restaurantSectorName) {
		this.restaurantSectorName = restaurantSectorName;
	}


	public String getRestaurantName() {
		return restaurantName;
	}


	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}


	public String getRestaurantTel() {
		return restaurantTel;
	}


	public void setRestaurantTel(String restaurantTel) {
		this.restaurantTel = restaurantTel;
	}


	public int getCityId() {
		return cityId;
	}


	public void setCityId(int cityId) {
		this.cityId = cityId;
	}


	public int getCountryId() {
		return countryId;
	}


	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}


	public int getDongId() {
		return dongId;
	}


	public void setDongId(int dongId) {
		this.dongId = dongId;
	}


	public String getRestaurantAddress() {
		return restaurantAddress;
	}


	public void setRestaurantAddress(String restaurantAddress) {
		this.restaurantAddress = restaurantAddress;
	}


	public int getCertificationId() {
		return certificationId;
	}


	public void setCertificationId(int certificationId) {
		this.certificationId = certificationId;
	}


	public String getCertificationName() {
		return certificationName;
	}


	public void setCertificationName(String certificationName) {
		this.certificationName = certificationName;
	}


	public String getRestaurantState() {
		return restaurantState;
	}


	public void setRestaurantState(String restaurantState) {
		this.restaurantState = restaurantState;
	}
	
	
	
}
