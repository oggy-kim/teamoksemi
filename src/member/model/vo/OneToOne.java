package member.model.vo;

import java.sql.Date;

public class OneToOne implements java.io.Serializable{
	private static final long serialVersionUID = -4450805657921547956L;
	private Date enrollDate; // 1:1문의작성일
	private String oneTitle; // 1:1문의제목
	private String answerStatus; // 1:1문의답변여부
	
	public OneToOne() {}

	public OneToOne(Date enrollDate, String oneTitle, String answerStatus) {
		super();
		this.enrollDate = enrollDate;
		this.oneTitle = oneTitle;
		this.answerStatus = answerStatus;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
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
		return "OneToOne [enrollDate=" + enrollDate + ", oneTitle=" + oneTitle + ", answerStatus=" + answerStatus + "]";
	}
	
	
}
