package db.dto;

public class RestaurantDTO {
	int restaurantId;
	int restaurantSectorId;
	String restaurantName;
	String restaurantTel;
	String restaurantCity;
	String restaurantCountry;
	String restaurantDong;
	String restaurantAddress;
	int certificationId;
	String restaurantState;
	
	public RestaurantDTO() {}
	
	public RestaurantDTO(int restaurantId, int restaurantSectorId, String restaurantName, String restaurantTel,
			String restaurantCity, String restaurantCountry, String restaurantDong, String restaurantAddress,
			int certificationId, String restaurantState) {
		super();
		this.restaurantId = restaurantId;
		this.restaurantSectorId = restaurantSectorId;
		this.restaurantName = restaurantName;
		this.restaurantTel = restaurantTel;
		this.restaurantCity = restaurantCity;
		this.restaurantCountry = restaurantCountry;
		this.restaurantDong = restaurantDong;
		this.restaurantAddress = restaurantAddress;
		this.certificationId = certificationId;
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

	public String getRestaurantCity() {
		return restaurantCity;
	}

	public void setRestaurantCity(String restaurantCity) {
		this.restaurantCity = restaurantCity;
	}

	public String getRestaurantCountry() {
		return restaurantCountry;
	}

	public void setRestaurantCountry(String restaurantCountry) {
		this.restaurantCountry = restaurantCountry;
	}

	public String getRestaurantDong() {
		return restaurantDong;
	}

	public void setRestaurantDong(String restaurantDong) {
		this.restaurantDong = restaurantDong;
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

	public String getRestaurantState() {
		return restaurantState;
	}

	public void setRestaurantState(String restaurantState) {
		this.restaurantState = restaurantState;
	}

	
}
