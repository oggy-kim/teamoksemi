package closet.model.vo;

public class Colour implements java.io.Serializable{
	private static final long serialVersionUID = -566131033427569554L;
	
	private String colourCode; // 컬러코드
	private String colourName; // 컬러이름
	
	public Colour() {}

	public Colour(String colourCode, String colourName) {
		super();
		this.colourCode = colourCode;
		this.colourName = colourName;
	}

	public String getColourCode() {
		return colourCode;
	}

	public void setColourCode(String colourCode) {
		this.colourCode = colourCode;
	}

	public String getColourName() {
		return colourName;
	}

	public void setColourName(String colourName) {
		this.colourName = colourName;
	}

	@Override
	public String toString() {
		return "Colour [colourCode=" + colourCode + ", colourName=" + colourName + "]";
	}
	
}
