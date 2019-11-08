package board.model.vo;

import java.sql.Date;

public class Attachment implements java.io.Serializable{
	private int fileNo; // 파일번호
	private int articleNo; // 게시판글번호
	private String originName; // 기존파일이름
	private String changeName; // 바뀐이름
	private String filePath;
	private Date uploadDate; // 등록날짜
	private String imgStatus; // 삭제여부
	
	public Attachment() {}

	public Attachment(int fileNo, int articleNo, String originName, String changeName, String filePath, Date uploadDate,
			String imgStatus) {
		super();
		this.fileNo = fileNo;
		this.articleNo = articleNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.imgStatus = imgStatus;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getImgStatus() {
		return imgStatus;
	}

	public void setImgStatus(String imgStatus) {
		this.imgStatus = imgStatus;
	}

	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", articleNo=" + articleNo + ", originName=" + originName
				+ ", changeName=" + changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate
				+ ", imgStatus=" + imgStatus + "]";
	}
	
	


}
