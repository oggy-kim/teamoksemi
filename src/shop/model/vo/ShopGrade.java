package shop.model.vo;

public class ShopGrade implements java.io.Serializable{
	private static final long serialVersionUID = -6293248779236497884L;
	
	private String shopGradeCode; // 쇼핑몰등급코드
	private String shopGradeName; // 쇼핑몰등급이름
	
	public ShopGrade() {}

	public ShopGrade(String shopGradeCode, String shopGradeName) {
		super();
		this.shopGradeCode = shopGradeCode;
		this.shopGradeName = shopGradeName;
	}

	public String getShopGradeCode() {
		return shopGradeCode;
	}

	public void setShopGradeCode(String shopGradeCode) {
		this.shopGradeCode = shopGradeCode;
	}

	public String getShopGradeName() {
		return shopGradeName;
	}

	public void setShopGradeName(String shopGradeName) {
		this.shopGradeName = shopGradeName;
	}

	@Override
	public String toString() {
		return "ShopGrade [shopGradeCode=" + shopGradeCode + ", shopGradeName=" + shopGradeName + "]";
	}
}
