package shop.model.vo;

public class Product implements java.io.Serializable{
	private static final long serialVersionUID = 7469050060309182541L;
	private String productCode; // 상품코드
	private String productName; // 상품이름
	private String productBrand; // 상품브랜드
	public Product(String productCode, String productName, String productBrand) {
		super();
		this.productCode = productCode;
		this.productName = productName;
		this.productBrand = productBrand;
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

	@Override
	public String toString() {
		return "Product [productCode=" + productCode + ", productName=" + productName + ", productBrand=" + productBrand
				+ "]";
	}
	
	
}
