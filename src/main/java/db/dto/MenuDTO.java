package db.dto;

public class MenuDTO {
    int restaurantId;
    int menuNumber;
    String menuName;
    String menuPrice;
    int menuSectorId;
    String menuState;

    public MenuDTO() {}

    public MenuDTO(int restaurantId, int menuNumber, String menuName, String menuPrice, int menuSectorId, String menuState) {
        this.restaurantId = restaurantId;
        this.menuNumber = menuNumber;
        this.menuName = menuName;
        this.menuPrice = menuPrice;
        this.menuSectorId = menuSectorId;
        this.menuState = menuState;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public int getMenuNumber() {
        return menuNumber;
    }

    public void setMenuNumber(int menuNumber) {
        this.menuNumber = menuNumber;
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

    public int getMenuSectorId() {
        return menuSectorId;
    }

    public void setMenuSectorId(int menuSectorId) {
        this.menuSectorId = menuSectorId;
    }

    public String getMenuState() {
        return menuState;
    }

    public void setMenuState(String menuState) {
        this.menuState = menuState;
    }
}
