package board.model.vo;

public class BoardComment implements java.io.Serializable{
	private static final long serialVersionUID = 9178762038941847015L;
	private String commentCode; // 게시판댓글코드
	private String commentContents; // 게시판댓글내용
	private String commentStatus; // 게시판댓글삭제여부
	
	public BoardComment() {}

	public BoardComment(String commentCode, String commentContents, String commentStatus) {
		super();
		this.commentCode = commentCode;
		this.commentContents = commentContents;
		this.commentStatus = commentStatus;
	}

	public String getCommentCode() {
		return commentCode;
	}

	public void setCommentCode(String commentCode) {
		this.commentCode = commentCode;
	}

	public String getCommentContents() {
		return commentContents;
	}

	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}

	public String getCommentStatus() {
		return commentStatus;
	}

	public void setCommentStatus(String commentStatus) {
		this.commentStatus = commentStatus;
	}

	@Override
	public String toString() {
		return "BoardComment [commentCode=" + commentCode + ", commentContents=" + commentContents + ", commentStatus="
				+ commentStatus + "]";
	}
	
	
}
