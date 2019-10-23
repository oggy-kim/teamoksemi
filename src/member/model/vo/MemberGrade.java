package member.model.vo;

public class MemberGrade implements java.io.Serializable{
	private static final long serialVersionUID = 717139676765580946L;
	private String gradeName; // 회원등급이름

	public MemberGrade(String gradeName) {
		super();
		this.gradeName = gradeName;
	}
	
	public MemberGrade() {}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	@Override
	public String toString() {
		return "MemberGrade [gradeName=" + gradeName + "]";
	}
	
	
}
