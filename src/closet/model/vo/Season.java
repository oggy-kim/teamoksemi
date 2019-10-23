package closet.model.vo;

public class Season implements java.io.Serializable{
	private static final long serialVersionUID = -3808847419582317804L;
	
	private String seasonCode; // 계절코드
	private String seasonName; // 계절이름
	
	
	public Season() {}


	public Season(String seasonCode, String seasonName) {
		super();
		this.seasonCode = seasonCode;
		this.seasonName = seasonName;
	}


	public String getSeasonCode() {
		return seasonCode;
	}


	public void setSeasonCode(String seasonCode) {
		this.seasonCode = seasonCode;
	}


	public String getSeasonName() {
		return seasonName;
	}


	public void setSeasonName(String seasonName) {
		this.seasonName = seasonName;
	}


	@Override
	public String toString() {
		return "Season [seasonCode=" + seasonCode + ", seasonName=" + seasonName + "]";
	}

	
	
}
