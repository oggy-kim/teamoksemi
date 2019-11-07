package board.model.vo;

import java.util.Date;

public class QnA {
	private int qnaNo; // QNA 글번호
	private int memberNo; // 회원번호
	private String memberNick; // 회원닉네임(추가)
	private Date enrollDate; // 글 등록일
	private String qnaTitle; // QNA 제목
	private String qnaContents; // QNA 내용
	private String answerStatus; // 답변여부(Default 'N')
	private String answerContents; // 답변 내용
	
	public QnA() {}
	
	public QnA(int memberNo, String qnaTitle, String qnaContents) {
		this.memberNo = memberNo;
		this.qnaTitle = qnaTitle;
		this.qnaContents = qnaContents;
	}

	// Adm QNA
	public QnA(int qnaNo, String qnaTitle, String memberNick, Date enrollDate, String answerStatus) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.memberNick = memberNick;
		this.enrollDate = enrollDate;
		this.answerStatus = answerStatus;
	}
	
	// Adm QNA 상세보기  
	public QnA(int qnaNo, String qnaTitle, String memberNick, Date enrollDate, String qnaContents,
			String answerStatus, String answerContents) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.memberNick = memberNick;
		this.enrollDate = enrollDate;
		this.qnaContents = qnaContents;
		this.answerStatus = answerStatus;
		this.answerContents = answerContents;
	}

	public QnA(int qnaNo, int memberNo, Date enrollDate, String qnaTitle, String qnaContents, String answerStatus,
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

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
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

	public String getAnswerStatus() {
		return answerStatus;
	}

	public void setAnswerStatus(String answerStatus) {
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
		return "QnA [qnaNo=" + qnaNo + ", memberNo=" + memberNo + ", memberNick=" + memberNick + ", enrollDate="
				+ enrollDate + ", qnaTitle=" + qnaTitle + ", qnaContents=" + qnaContents + ", answerStatus="
				+ answerStatus + ", answerContents=" + answerContents + "]";
	}
}
