package board.model.vo;

public class BoardComment implements java.io.Serializable{
	private static final long serialVersionUID = 9178762038941847015L;
	
	private int commentNo; // 댓글번호
	private String memberNick; // 댓글작성자
	private int articleNo; // 글번호
	private String commentContents; // 게시판댓글내용
	private String commentStatus; // 게시판댓글삭제여부
	
	public BoardComment() {}

	public BoardComment(int commentNo, String memberNick, int articleNo, String commentContents, String commentStatus) {
		super();
		this.commentNo = commentNo;
		this.memberNick = memberNick;
		this.articleNo = articleNo;
		this.commentContents = commentContents;
		this.commentStatus = commentStatus;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
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
		return "BoardComment [commentNo=" + commentNo + ", memberNo=" + memberNick + ", articleNo=" + articleNo
				+ ", commentContents=" + commentContents + ", commentStatus=" + commentStatus + "]";
	}
}
