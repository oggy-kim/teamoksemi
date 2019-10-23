package closet.model.vo;

public class Closet implements java.io.Serializable{
	private static final long serialVersionUID = -7305682391284883000L;
	private String clothCode; // 옷코드
	private String fitCode; // 핏코드
	private String seasonCode; // 계절코드
	private String colourCode; // 컬러코드
	private String materialCode; // 재질코드
	private String usageCode; // 용도
	private String clothName; // 옷이름
	private String clothBuyDate; // 옷 구매일자
	private String clothMemo; // 옷장메모
	private String status; // 옷삭제여부
	
	public Closet() {}

	public Closet(String clothCode, String fitCode, String seasonCode, String colourCode, String materialCode,
			String usageCode, String clothName, String clothBuyDate, String clothMemo, String status) {
		super();
		this.clothCode = clothCode;
		this.fitCode = fitCode;
		this.seasonCode = seasonCode;
		this.colourCode = colourCode;
		this.materialCode = materialCode;
		this.usageCode = usageCode;
		this.clothName = clothName;
		this.clothBuyDate = clothBuyDate;
		this.clothMemo = clothMemo;
		this.status = status;
	}

	public String getClothCode() {
		return clothCode;
	}

	public void setClothCode(String clothCode) {
		this.clothCode = clothCode;
	}

	public String getFitCode() {
		return fitCode;
	}

	public void setFitCode(String fitCode) {
		this.fitCode = fitCode;
	}

	public String getSeasonCode() {
		return seasonCode;
	}

	public void setSeasonCode(String seasonCode) {
		this.seasonCode = seasonCode;
	}

	public String getColourCode() {
		return colourCode;
	}

	public void setColourCode(String colourCode) {
		this.colourCode = colourCode;
	}

	public String getMaterialCode() {
		return materialCode;
	}

	public void setMaterialCode(String materialCode) {
		this.materialCode = materialCode;
	}

	public String getUsageCode() {
		return usageCode;
	}

	public void setUsageCode(String usageCode) {
		this.usageCode = usageCode;
	}

	public String getClothName() {
		return clothName;
	}

	public void setClothName(String clothName) {
		this.clothName = clothName;
	}

	public String getClothBuyDate() {
		return clothBuyDate;
	}

	public void setClothBuyDate(String clothBuyDate) {
		this.clothBuyDate = clothBuyDate;
	}

	public String getClothMemo() {
		return clothMemo;
	}

	public void setClothMemo(String clothMemo) {
		this.clothMemo = clothMemo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Closet [clothCode=" + clothCode + ", fitCode=" + fitCode + ", seasonCode=" + seasonCode
				+ ", colourCode=" + colourCode + ", materialCode=" + materialCode + ", usageCode=" + usageCode
				+ ", clothName=" + clothName + ", clothBuyDate=" + clothBuyDate + ", clothMemo=" + clothMemo
				+ ", status=" + status + "]";
	}

	
	
	
}
