package closet.model.vo;

public class Usage implements java.io.Serializable{
	private static final long serialVersionUID = 5505895370764748253L;

	private String usageCode; // 용도
	private String usageName; // 용도이름
	
	public Usage() {}

	public Usage(String usageCode, String usageName) {
		super();
		this.usageCode = usageCode;
		this.usageName = usageName;
	}

	public String getUsageCode() {
		return usageCode;
	}

	public void setUsageCode(String usageCode) {
		this.usageCode = usageCode;
	}

	public String getUsageName() {
		return usageName;
	}

	public void setUsageName(String usageName) {
		this.usageName = usageName;
	}

	@Override
	public String toString() {
		return "Usage [usageCode=" + usageCode + ", usageName=" + usageName + "]";
	}

	
}
