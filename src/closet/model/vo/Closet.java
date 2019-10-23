package closet.model.vo;

import java.sql.Date;

public class Closet implements java.io.Serializable{
	private static final long serialVersionUID = -7305682391284883000L;
	private int clothNo; // 옷코드
	private int memberNo; // 회원번호
	private String fitCode; // 핏코드
	private String seasonCode; // 계절코드
	private String colourCode; // 컬러코드
	private String materialCode; // 재질코드
	private String usageCode; // 용도
	private String clothName; // 옷이름
	private Date clothBuyDate; // 옷 구매일자
	private String clothMemo; // 옷장메모
	private String status; // 옷삭제여부
	
	public Closet() {}

	public Closet(int clothNo, int memberNo, String fitCode, String seasonCode, String colourCode, String materialCode,
			String usageCode, String clothName, Date clothBuyDate, String clothMemo, String status) {
		super();
		this.clothNo = clothNo;
		this.memberNo = memberNo;
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

	public int getClothNo() {
		return clothNo;
	}

	public void setClothNo(int clothNo) {
		this.clothNo = clothNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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

	public Date getClothBuyDate() {
		return clothBuyDate;
	}

	public void setClothBuyDate(Date clothBuyDate) {
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

	@Override
	public String toString() {
		return "Closet [clothNo=" + clothNo + ", memberNo=" + memberNo + ", fitCode=" + fitCode + ", seasonCode="
				+ seasonCode + ", colourCode=" + colourCode + ", materialCode=" + materialCode + ", usageCode="
				+ usageCode + ", clothName=" + clothName + ", clothBuyDate=" + clothBuyDate + ", clothMemo=" + clothMemo
				+ ", status=" + status + "]";
	}

	
	
}
