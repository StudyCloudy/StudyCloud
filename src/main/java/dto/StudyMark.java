package dto;

public class StudyMark {
	
	private int smarkNo;
	private int studyNo;
	private int memberNo;
	
	public StudyMark () {}
	
	public StudyMark(int smarkNo, int studyNo, int memberNo) {
		super();
		this.smarkNo = smarkNo;
		this.studyNo = studyNo;
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "StudyMark [smarkNo=" + smarkNo + ", studyNo=" + studyNo + ", memberNo=" + memberNo + "]";
	}
	public int getSmarkNo() {
		return smarkNo;
	}
	public void setSmarkNo(int smarkNo) {
		this.smarkNo = smarkNo;
	}
	public int getStudyNo() {
		return studyNo;
	}
	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	

}
