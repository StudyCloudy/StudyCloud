package dto;

import java.util.Date;

public class ApplyStudy {
	
	private int applystudyNo;
	private String memberName;
	private int memberNo;
	private int memberAge;
	private String memberJob;
	private String memberAddress;
	private String memberIntro;
	private Date applystudyDate;
	private int studyNo;
	
	public ApplyStudy() {}

	public ApplyStudy(int applystudyNo, String memberName, int memberNo, int memberAge, String memberJob,
			String memberAddress, String memberIntro, Date applystudyDate, int studyNo) {
		super();
		this.applystudyNo = applystudyNo;
		this.memberName = memberName;
		this.memberNo = memberNo;
		this.memberAge = memberAge;
		this.memberJob = memberJob;
		this.memberAddress = memberAddress;
		this.memberIntro = memberIntro;
		this.applystudyDate = applystudyDate;
		this.studyNo = studyNo;
	}

	@Override
	public String toString() {
		return "ApplyStudy [applystudyNo=" + applystudyNo + ", memberName=" + memberName + ", memberNo=" + memberNo
				+ ", memberAge=" + memberAge + ", memberJob=" + memberJob + ", memberAddress=" + memberAddress
				+ ", memberIntro=" + memberIntro + ", applystudyDate=" + applystudyDate + ", studyNo=" + studyNo + "]";
	}

	public int getApplystudyNo() {
		return applystudyNo;
	}

	public void setApplystudyNo(int applystudyNo) {
		this.applystudyNo = applystudyNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getMemberAge() {
		return memberAge;
	}

	public void setMemberAge(int memberAge) {
		this.memberAge = memberAge;
	}

	public String getMemberJob() {
		return memberJob;
	}

	public void setMemberJob(String memberJob) {
		this.memberJob = memberJob;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberIntro() {
		return memberIntro;
	}

	public void setMemberIntro(String memberIntro) {
		this.memberIntro = memberIntro;
	}

	public Date getApplystudyDate() {
		return applystudyDate;
	}

	public void setApplystudyDate(Date applystudyDate) {
		this.applystudyDate = applystudyDate;
	}

	public int getStudyNo() {
		return studyNo;
	}

	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}
	
	
	
	
	

}
