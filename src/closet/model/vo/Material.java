package closet.model.vo;

public class Material implements java.io.Serializable{
	private static final long serialVersionUID = 9096375381618536088L;
	private String materialName; // 재질이름
	
	public Material() {}

	public Material(String materialName) {
		super();
		this.materialName = materialName;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	@Override
	public String toString() {
		return "Material [materialName=" + materialName + "]";
	}
	
	
}
