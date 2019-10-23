package shop.model.vo;

public class ShopGrade implements java.io.Serializable{
	private static final long serialVersionUID = -6293248779236497884L;
	private String shopGradeName; // 쇼핑몰등급이름
	
	public ShopGrade() {}

	public ShopGrade(String shopGradeName) {
		super();
		this.shopGradeName = shopGradeName;
	}

	public String getShopGradeName() {
		return shopGradeName;
	}

	public void setShopGradeName(String shopGradeName) {
		this.shopGradeName = shopGradeName;
	}

	@Override
	public String toString() {
		return "ShopGrade [shopGradeName=" + shopGradeName + "]";
	}
	
	
}
