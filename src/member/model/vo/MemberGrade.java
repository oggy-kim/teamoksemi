package member.model.vo;

public class MemberGrade implements java.io.Serializable{
	private static final long serialVersionUID = 717139676765580946L;
	private String gradeCode; // 회원등급코드
	private String gradeName; // 회원등급이름
	
	public MemberGrade() {}
	
	public MemberGrade(String gradeCode, String gradeName) {
		super();
		this.gradeCode = gradeCode;
		this.gradeName = gradeName;
	}
	
	public String getGradeCode() {
		return gradeCode;
	}
	public void setGradeCode(String gradeCode) {
		this.gradeCode = gradeCode;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
}
