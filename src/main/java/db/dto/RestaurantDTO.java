package db.dto;

public class RestaurantDTO {
	int restaurantId;
	int restaurantSectorId;
	String restaurantSectorName;
	String restaurantName;
	String menuName;
	String menuPrice;
	String restaurantTel;
	int cityId;
	int countryId;
	int dongId;
	double starScore;
	int starCount;
	String restaurantAddress;
	int certificationId;
	String certificationName;
	String restaurantState;
	
	
	public RestaurantDTO() {}

	
	public RestaurantDTO(int restaurantId, int restaurantSectorId, String restaurantSectorName, String restaurantName,
			String menuName, String menuPrice, String restaurantTel, int cityId, int countryId, int dongId,
			double starScore, int starCount, String restaurantAddress, int certificationId, String certificationName,
			String restaurantState) {
		super();
		this.restaurantId = restaurantId;
		this.restaurantSectorId = restaurantSectorId;
		this.restaurantSectorName = restaurantSectorName;
		this.restaurantName = restaurantName;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.restaurantTel = restaurantTel;
		this.cityId = cityId;
		this.countryId = countryId;
		this.dongId = dongId;
		this.starScore = starScore;
		this.starCount = starCount;
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


	public String getMenuName() {
		return menuName;
	}


	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}


	public String getMenuPrice() {
		return menuPrice;
	}


	public void setMenuPrice(String menuPrice) {
		this.menuPrice = menuPrice;
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


	public double getStarScore() {
		return starScore;
	}


	public void setStarScore(double starScore) {
		this.starScore = starScore;
	}


	public int getStarCount() {
		return starCount;
	}


	public void setStarCount(int starCount) {
		this.starCount = starCount;
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
