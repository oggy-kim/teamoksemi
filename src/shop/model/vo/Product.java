package shop.model.vo;

public class Product implements java.io.Serializable{
	private static final long serialVersionUID = 7469050060309182541L;
	private String productCode; // 상품코드
	private String productName; // 상품이름
	private String productBrand; // 상품브랜드
	private String shopCode; // 쇼핑몰코드
	
	public Product(String productCode, String productName, String productBrand, String shopCode) {
		super();
		this.productCode = productCode;
		this.productName = productName;
		this.productBrand = productBrand;
		this.shopCode = shopCode;
	}

	public Product() {}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductBrand() {
		return productBrand;
	}

	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}

	public String getShopCode() {
		return shopCode;
	}

	public void setShopCode(String shopCode) {
		this.shopCode = shopCode;
	}

	@Override
	public String toString() {
		return "Product [productCode=" + productCode + ", productName=" + productName + ", productBrand=" + productBrand
				+ ", shopCode=" + shopCode + "]";
	}
}
