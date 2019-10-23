package closet.model.vo;

public class Colour implements java.io.Serializable{
	private static final long serialVersionUID = -566131033427569554L;
	private String colourName; // 컬러이름
	
	public Colour() {}

	public Colour(String colourName) {
		super();
		this.colourName = colourName;
	}

	public String getColourName() {
		return colourName;
	}

	public void setColourName(String colourName) {
		this.colourName = colourName;
	}

	@Override
	public String toString() {
		return "Colour [colourName=" + colourName + "]";
	}
	
	
}
