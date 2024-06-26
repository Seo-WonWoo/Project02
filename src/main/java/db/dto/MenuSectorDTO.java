package db.dto;

public class MenuSectorDTO {
	
	int menuSectorId;
	String menuSectorName;
	String menuSectorPrice;
	
	public MenuSectorDTO() {}
	
	public MenuSectorDTO(int menuSectorId, String menuSectorName, String menuSectorPrice) {
		super();
		this.menuSectorId = menuSectorId;
		this.menuSectorName = menuSectorName;
		this.menuSectorPrice = menuSectorPrice;
	}

	public int getMenuSectorId() {
		return menuSectorId;
	}

	public void setMenuSectorId(int menuSectorId) {
		this.menuSectorId = menuSectorId;
	}

	public String getMenuSectorName() {
		return menuSectorName;
	}

	public void setMenuSectorName(String menuSectorName) {
		this.menuSectorName = menuSectorName;
	}

	public String getMenuSectorPrice() {
		return menuSectorPrice;
	}

	public void setMenuSectorPrice(String menuSectorPrice) {
		this.menuSectorPrice = menuSectorPrice;
	}	
	
		
}
