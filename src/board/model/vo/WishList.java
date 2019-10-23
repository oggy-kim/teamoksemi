package board.model.vo;

import java.sql.Date;

public class WishList implements java.io.Serializable{
	private static final long serialVersionUID = 568558075630862870L;
	
	private int memberNo; // 회원번호
	private int articleNo; // 게시판글번호
	private Date wishDate; // 찜한날짜
	private String wishMemo; // 찜메모
	private String wishStatus; // 찜삭제여부
	
	public WishList() {}

	public WishList(int memberNo, int articleNo, Date wishDate, String wishMemo, String wishStatus) {
		super();
		this.memberNo = memberNo;
		this.articleNo = articleNo;
		this.wishDate = wishDate;
		this.wishMemo = wishMemo;
		this.wishStatus = wishStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public Date getWishDate() {
		return wishDate;
	}

	public void setWishDate(Date wishDate) {
		this.wishDate = wishDate;
	}

	public String getWishMemo() {
		return wishMemo;
	}

	public void setWishMemo(String wishMemo) {
		this.wishMemo = wishMemo;
	}

	public String getWishStatus() {
		return wishStatus;
	}

	public void setWishStatus(String wishStatus) {
		this.wishStatus = wishStatus;
	}

	@Override
	public String toString() {
		return "WishList [memberNo=" + memberNo + ", articleNo=" + articleNo + ", wishDate=" + wishDate + ", wishMemo="
				+ wishMemo + ", wishStatus=" + wishStatus + "]";
	}
}
