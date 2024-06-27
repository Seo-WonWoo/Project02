package db.dto;

public class StarScoreDTO {

	int restaurantId;
	double starScore;
	int starCount;
	
	public StarScoreDTO() {}
	
	public StarScoreDTO(int restaurantId, double starScore, int starCount) {
		super();
		this.restaurantId = restaurantId;
		this.starScore = starScore;
		this.starCount = starCount;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
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
	
	
	
}
