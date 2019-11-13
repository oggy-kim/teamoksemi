package board.model.vo;

import java.util.Date;

public class Board implements java.io.Serializable{
	private static final long serialVersionUID = -1784038607090445364L;
	
	private int articleNo; // 게시판글번호
	private int memberNo; // 회원번호
	private String memberNick; // 회원닉네임 (추가 19.10.31.)
	// private int articleWishes; // 찜 횟수(추가 19.11.06 - 준섭) // 삭제해야징
	private String profile; // 프로필사진(추가 19.11.06 - 준섭)
	private String likeStyle; // 선호스타일(추가 19.11.06 - 준섭)
	private int articleViews; // 게시판조회수
	private int articleLikes; // 게시판찜수
	private String articleContents; // 게시판글 내용
	private Date articleDate; // 게시판글 등록날짜
	private String status; // 게시판글 삭제여부
	
	public Board() {}

	// ADM BOARD
	public Board(int articleNo, String memberNick, String articleContents, Date articleDate, int articleLikes, int articleViews
			 ) {
		super();
		this.articleNo = articleNo;
		this.articleContents = articleContents;
		this.memberNick = memberNick;
		this.articleDate = articleDate;
		this.articleLikes = articleLikes;
		this.articleViews = articleViews;
	}
	
	// ADM BOARD 상세보기
	public Board(int articleNo, String memberNick, String likeStyle, int articleViews, int articleLikes,
			 Date articleDate, String status, String articleContents) {
		super();
		this.articleNo = articleNo;
		this.memberNick = memberNick;
		this.likeStyle = likeStyle;
		this.articleViews = articleViews;
		this.articleLikes = articleLikes;
		this.articleDate = articleDate;
		this.status = status;
		this.articleContents = articleContents;
	}

	public Board(int articleNo, int memberNo, int articleViews, int articleLikes, String articleContents,
	         Date articleDate, String status) {
	      super();
	      this.articleNo = articleNo;
	      this.memberNo = memberNo;
	      this.articleViews = articleViews;
	      this.articleLikes = articleLikes;
	      this.articleContents = articleContents;
	      this.articleDate = articleDate;
	      this.status = status;
	   }
	
	public Board(int articleNo, String memberNick, int articleViews, int articleLikes,
			String articleContents, Date articleDate, String status) {
		super();
		this.articleNo = articleNo;
		this.memberNick = memberNick;
		this.articleViews = articleViews;
		this.articleLikes = articleLikes;
		this.articleContents = articleContents;
		this.articleDate = articleDate;
		this.status = status;
	}
	
	public Board(int memberNo, int articleNO, int articleViews, int articleLikes, 
	         String articleContents, String memberNick, String profile, String likeStyle) {
	      super();
	      this.memberNo = memberNo;
	      this.articleNo = articleNO;
	      this.articleViews = articleViews;
	      this.articleLikes = articleLikes;
	      this.articleContents = articleContents;
	      this.memberNick = memberNick;
	      this.profile = profile;
	      this.likeStyle = likeStyle;
	   }

	public Board(int memberNo, String articleContents) {
		super();
		this.memberNo = memberNo;
		this.articleContents = articleContents;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
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

	/*public int getArticleWishes() {
		return articleWishes;
	}*/

	/*public void setArticleWishes(int articleWishes) {
		this.articleWishes = articleWishes;
	}*/

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getLikeStyle() {
		return likeStyle;
	}

	public void setLikeStyle(String likeStyle) {
		this.likeStyle = likeStyle;
	}

	public int getArticleViews() {
		return articleViews;
	}

	public void setArticleViews(int articleViews) {
		this.articleViews = articleViews;
	}

	public int getArticleLikes() {
		return articleLikes;
	}

	public void setArticleLikes(int articleLikes) {
		this.articleLikes = articleLikes;
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
		return "Board [articleNo=" + articleNo + ", memberNo=" + memberNo + ", memberNick=" + memberNick
				+ /*", articleWishes=" + articleWishes+ */ ", profile=" + profile + ", likeStyle=" + likeStyle
				+ ", articleViews=" + articleViews + ", articleLikes=" + articleLikes + ", articleContents="
				+ articleContents + ", articleDate=" + articleDate + ", status=" + status + "]";
	}

	


}
