package closet.model.vo;

public class Fit implements java.io.Serializable{
	private static final long serialVersionUID = 7477550547654222474L;
	
	private String fitCode; // 핏코드
	private String fitName; // 핏이름
	
	public Fit () {}

	public Fit(String fitCode, String fitName) {
		super();
		this.fitCode = fitCode;
		this.fitName = fitName;
	}

	public String getFitCode() {
		return fitCode;
	}

	public void setFitCode(String fitCode) {
		this.fitCode = fitCode;
	}

	public String getFitName() {
		return fitName;
	}

	public void setFitName(String fitName) {
		this.fitName = fitName;
	}

	@Override
	public String toString() {
		return "Fit [fitCode=" + fitCode + ", fitName=" + fitName + "]";
	}

	

}
