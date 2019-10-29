package board.model.vo;

import java.util.Date;

public class QnA {
	private int qnaNo; // QNA 글번호
	private int memberNo; // 회원번호
	private Date enrollDate; // 글 등록일
	private String qnaTitle; // QNA 제목
	private String qnaContents; // QNA 내용
	private char answerStatus; // 답변여부(Default 'N')
	private String answerContents; // 답변 내용
	
	public QnA() {}
	
	public QnA(int qnaNo, int memberNo, Date enrollDate, String qnaTitle, String qnaContents, char answerStatus,
			String answerContents) {
		super();
		this.qnaNo = qnaNo;
		this.memberNo = memberNo;
		this.enrollDate = enrollDate;
		this.qnaTitle = qnaTitle;
		this.qnaContents = qnaContents;
		this.answerStatus = answerStatus;
		this.answerContents = answerContents;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContents() {
		return qnaContents;
	}

	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}

	public char getAnswerStatus() {
		return answerStatus;
	}

	public void setAnswerStatus(char answerStatus) {
		this.answerStatus = answerStatus;
	}

	public String getAnswerContents() {
		return answerContents;
	}

	public void setAnswerContents(String answerContents) {
		this.answerContents = answerContents;
	}

	@Override
	public String toString() {
		return "QnA [qnaNo=" + qnaNo + ", memberNo=" + memberNo + ", enrollDate=" + enrollDate + ", qnaTitle="
				+ qnaTitle + ", qnaContents=" + qnaContents + ", answerStatus=" + answerStatus + ", answerContents="
				+ answerContents + "]";
	}
}
