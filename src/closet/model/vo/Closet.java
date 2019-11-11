package closet.model.vo;

import java.util.Date;

public class Closet implements java.io.Serializable{
	private static final long serialVersionUID = -7305682391284883000L;
	private int clothNo; // 옷코드
	private int memberNo; // 회원번호
	private String typeCode; // 타입코드
	private int typeOption; // 타입옵션(1:상의 / 2:하의 / 3:악세사리)
	private String styleCode; // 스타일코드 
	private String colourCode; // 컬러코드
	private String fitCode; // 핏코드
	private String seasonCode; // 계절코드
	private String clothName; // 옷이름
	private Date clothBuyDate; // 옷 구매일자
	private String clothMemo; // 옷장메모
	private String clothStatus; // 옷삭제여부
	private String likeStatus; // 좋아하는옷 여부
	private Date changeDate; // 최종수정일
	
	public Closet() {}

	public Closet(int clothNo, int memberNo, String typeCode, int typeOption, String styleCode, String colourCode,
			String fitCode, String seasonCode, String clothName, Date clothBuyDate, String clothMemo,
			String clothStatus, String likeStatus, Date changeDate) {
		super();
		this.clothNo = clothNo;
		this.memberNo = memberNo;
		this.typeCode = typeCode;
		this.typeOption = typeOption;
		this.styleCode = styleCode;
		this.colourCode = colourCode;
		this.fitCode = fitCode;
		this.seasonCode = seasonCode;
		this.clothName = clothName;
		this.clothBuyDate = clothBuyDate;
		this.clothMemo = clothMemo;
		this.clothStatus = clothStatus;
		this.likeStatus = likeStatus;
		this.changeDate = changeDate;
	}
	// 내 옷장에 옷추가용 Constructor
	public Closet(int memberNo, String typeCode, String styleCode, String colourCode, String fitCode,
			String seasonCode, String clothName, Date clothBuyDate, String clothMemo, String likeStatus) {
		super();
		this.memberNo = memberNo;
		this.typeCode = typeCode;
		this.styleCode = styleCode;
		this.colourCode = colourCode;
		this.fitCode = fitCode;
		this.seasonCode = seasonCode;
		this.clothName = clothName;
		this.clothBuyDate = clothBuyDate;
		this.clothMemo = clothMemo;
		this.likeStatus = likeStatus;
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

	public String getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public int getTypeOption() {
		return typeOption;
	}

	public void setTypeOption(int typeOption) {
		this.typeOption = typeOption;
	}

	public String getStyleCode() {
		return styleCode;
	}

	public void setStyleCode(String styleCode) {
		this.styleCode = styleCode;
	}

	public String getColourCode() {
		return colourCode;
	}

	public void setColourCode(String colourCode) {
		this.colourCode = colourCode;
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

	public String getClothStatus() {
		return clothStatus;
	}

	public void setClothStatus(String clothStatus) {
		this.clothStatus = clothStatus;
	}

	public String getLikeStatus() {
		return likeStatus;
	}

	public void setLikeStatus(String likeStatus) {
		this.likeStatus = likeStatus;
	}

	public Date getChangeDate() {
		return changeDate;
	}

	public void setChangeDate(Date changeDate) {
		this.changeDate = changeDate;
	}

	@Override
	public String toString() {
		return "Closet [clothNo=" + clothNo + ", memberNo=" + memberNo + ", typeCode=" + typeCode + ", typeOption="
				+ typeOption + ", styleCode=" + styleCode + ", colourCode=" + colourCode + ", fitCode=" + fitCode
				+ ", seasonCode=" + seasonCode + ", clothName=" + clothName + ", clothBuyDate=" + clothBuyDate
				+ ", clothMemo=" + clothMemo + ", clothStatus=" + clothStatus + ", likeStatus=" + likeStatus
				+ ", changeDate=" + changeDate + "]";
	}

	
}
