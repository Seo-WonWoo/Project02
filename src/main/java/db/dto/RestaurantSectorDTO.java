package db.dto;

public class RestaurantSectorDTO { 
	
	int restaurantSectorId;
	String restaurantSectorName;
	
	public RestaurantSectorDTO(){}
	
	public RestaurantSectorDTO(int restaurantSectorId, String restaurantSectorName) {
		super();
		this.restaurantSectorId = restaurantSectorId;
		this.restaurantSectorName = restaurantSectorName;
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
	
}
