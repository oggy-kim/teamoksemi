package board.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable{
	private static final long serialVersionUID = -1784038607090445364L;
	private String articleCode; // 게시판글코드
	private int articleViews; // 게시판조회수
	private String articleContents; // 게시판글 내용
	private Date articleDate; // 게시판글 등록날짜
	private String status; // 게시판글 삭제여부
	
	public Board() {}

	public Board(String articleCode, int articleViews, String articleContents, Date articleDate, String status) {
		super();
		this.articleCode = articleCode;
		this.articleViews = articleViews;
		this.articleContents = articleContents;
		this.articleDate = articleDate;
		this.status = status;
	}

	public String getArticleCode() {
		return articleCode;
	}

	public void setArticleCode(String articleCode) {
		this.articleCode = articleCode;
	}

	public int getArticleViews() {
		return articleViews;
	}

	public void setArticleViews(int articleViews) {
		this.articleViews = articleViews;
	}

	public String getArticleContents() {
		return articleContents;
	}

	public void setArticleContents(String articleContents) {
		this.articleContents = articleContents;
	}

	public Date getArticleDate() {
		return articleDate;
	}

	public void setArticleDate(Date articleDate) {
		this.articleDate = articleDate;
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
		return "Board [articleCode=" + articleCode + ", articleViews=" + articleViews + ", articleContents="
				+ articleContents + ", articleDate=" + articleDate + ", status=" + status + "]";
	}

	
	
	
}
