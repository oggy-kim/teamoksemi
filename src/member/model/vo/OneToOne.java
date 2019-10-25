package member.model.vo;

import java.sql.Date;

public class OneToOne implements java.io.Serializable{
	
	private static final long serialVersionUID = -4450805657921547956L;

	private Date enrollDate; // 1:1문의작성일
	private int memberNo; // 회원번호
	private String oneTitle; // 1:1문의제목
	private String answerStatus; // 1:1문의답변여부
	
	public OneToOne() {}

	public OneToOne(Date enrollDate, int memberNo, String oneTitle, String answerStatus) {
		super();
		this.enrollDate = enrollDate;
		this.memberNo = memberNo;
		this.oneTitle = oneTitle;
		this.answerStatus = answerStatus;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getOneTitle() {
		return oneTitle;
	}

	public void setOneTitle(String oneTitle) {
		this.oneTitle = oneTitle;
	}

	public String getAnswerStatus() {
		return answerStatus;
	}

	public void setAnswerStatus(String answerStatus) {
		this.answerStatus = answerStatus;
	}

	@Override
	public String toString() {
		return "OneToOne [enrollDate=" + enrollDate + ", memberNo=" + memberNo + ", oneTitle=" + oneTitle
				+ ", answerStatus=" + answerStatus + "]";
	}
	
}
