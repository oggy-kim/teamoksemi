package closet.model.vo;

public class Usage implements java.io.Serializable{
	private static final long serialVersionUID = 5505895370764748253L;
	private String usageName; // 용도이름
	
	public Usage() {}

	public Usage(String usageName) {
		super();
		this.usageName = usageName;
	}

	public String getUsageName() {
		return usageName;
	}

	public void setUsageName(String usageName) {
		this.usageName = usageName;
	}

	@Override
	public String toString() {
		return "Usage [usageName=" + usageName + "]";
	}
	
	
}
