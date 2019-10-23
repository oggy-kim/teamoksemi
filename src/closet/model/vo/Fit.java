package closet.model.vo;

public class Fit implements java.io.Serializable{
	private static final long serialVersionUID = 7477550547654222474L;
	private String fitName; // 핏이름
	
	public Fit () {}

	public Fit(String fitName) {
		super();
		this.fitName = fitName;
	}

	public String getFitName() {
		return fitName;
	}

	public void setFitName(String fitName) {
		this.fitName = fitName;
	}

	@Override
	public String toString() {
		return "Fit [fitName=" + fitName + "]";
	}
	
	

}
