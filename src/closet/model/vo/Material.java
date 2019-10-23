package closet.model.vo;

public class Material implements java.io.Serializable{
	private static final long serialVersionUID = 9096375381618536088L;
	
	private String materialCode; // 재질코드
	private String materialName; // 재질이름
	
	public Material() {}

	public Material(String materialCode, String materialName) {
		super();
		this.materialCode = materialCode;
		this.materialName = materialName;
	}

	public String getMaterialCode() {
		return materialCode;
	}

	public void setMaterialCode(String materialCode) {
		this.materialCode = materialCode;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	@Override
	public String toString() {
		return "Material [materialCode=" + materialCode + ", materialName=" + materialName + "]";
	}

	
}
