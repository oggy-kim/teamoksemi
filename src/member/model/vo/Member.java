package member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
   private static final long serialVersionUID = 501763206231505614L;
   private int memberNo; // 회원번호
   private String gradeCode; // 회원등급코드
   private String memberId; // 회원아이디
   private String memberPwd; // 회원비밀번호
   private String memberNick; // 회원닉네임
   private String gender; // 성별
   private String profile; // 프로필사진   
   private String likeStyle; // 선호스타일
   private int birthYear; // 연령
   private Date entryDate; // 가입날짜
   private String memberStatus; // 탈퇴여부
   
   public Member() {}
   
   
   
   
   
   public Member(String memberId, String memberPwd) {
	super();
	this.memberId = memberId;
	this.memberPwd = memberPwd;
}





// Adm Member페이지 내 회원정보목록
   public Member(int memberNo, String gradeCode, String memberId, String memberNick, Date entryDate) {
	super();
	this.memberNo = memberNo;
	this.gradeCode = gradeCode;
	this.memberId = memberId;
	this.memberNick = memberNick;
	this.entryDate = entryDate;
}
	public Member(String memberId, int birthYear, String likeStyle) {
		super();
		this.memberId = memberId;
		this.likeStyle = likeStyle;
		this.birthYear = birthYear;
	}
	
	public Member(String memberId, String memberPwd, String memberNick, String gender) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberNick = memberNick;
		this.gender = gender;
	}

public Member(int memberNo, String gradeCode, String memberId, String memberPwd, String memberNick, String gender,
         String profile, String likeStyle, int birthYear, Date entryDate, String memberStatus) {
      super();
      this.memberNo = memberNo;
      this.gradeCode = gradeCode;
      this.memberId = memberId;
      this.memberPwd = memberPwd;
      this.memberNick = memberNick;
      this.gender = gender;
      this.profile = profile;
      this.likeStyle = likeStyle;
      this.birthYear = birthYear;
      this.entryDate = entryDate;
      this.memberStatus = memberStatus;
   }

   public int getMemberNo() {
      return memberNo;
   }

   public void setMemberNo(int memberNo) {
      this.memberNo = memberNo;
   }

   public String getGradeCode() {
      return gradeCode;
   }

   public void setGradeCode(String gradeCode) {
      this.gradeCode = gradeCode;
   }

   public String getMemberId() {
      return memberId;
   }

   public void setMemberId(String memberId) {
      this.memberId = memberId;
   }

   public String getMemberPwd() {
      return memberPwd;
   }

   public void setMemberPwd(String memberPwd) {
      this.memberPwd = memberPwd;
   }

   public String getMemberNick() {
      return memberNick;
   }

   public void setMemberNick(String memberNick) {
      this.memberNick = memberNick;
   }

   public String getGender() {
      return gender;
   }

   public void setGender(String gender) {
      this.gender = gender;
   }

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

   public int getBirthYear() {
      return birthYear;
   }

   public void setBirthYear(int birthYear) {
      this.birthYear = birthYear;
   }

   public Date getEntryDate() {
      return entryDate;
   }

   public void setEntryDate(Date entryDate) {
      this.entryDate = entryDate;
   }

   public String getMemberStatus() {
      return memberStatus;
   }

   public void setMemberStatus(String memberStatus) {
      this.memberStatus = memberStatus;
   }

   public static long getSerialversionuid() {
      return serialVersionUID;
   }

   @Override
   public String toString() {
      return "Member [memberNo=" + memberNo + ", gradeCode=" + gradeCode + ", memberId=" + memberId + ", memberPwd="
            + memberPwd + ", memberNick=" + memberNick + ", gender=" + gender + ", profile=" + profile
            + ", likeStyle=" + likeStyle + ", birthYear=" + birthYear + ", entryDate=" + entryDate + ", memberStatus="
            + memberStatus + "]";
   }
}