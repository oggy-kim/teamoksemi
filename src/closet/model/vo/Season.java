package closet.model.vo;

public class Season implements java.io.Serializable{
	private static final long serialVersionUID = -3808847419582317804L;
	private String seasonName; // 계절이름
	
	public Season() {}

	public Season(String seasonName) {
		super();
		this.seasonName = seasonName;
	}

	public String getSeasonName() {
		return seasonName;
	}

	public void setSeasonName(String seasonName) {
		this.seasonName = seasonName;
	}

	@Override
	public String toString() {
		return "Season [seasonName=" + seasonName + "]";
	}
	
	
}
