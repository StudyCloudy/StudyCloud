package dto;

import java.util.Date;

public class ApplyStudy {
	
	private int applystudyNo;
	private String memberName;
	private int memberNo;
	private int memberAge;
	private String memberAddress;
	private String memberIntro;
	private Date applystudyDate;
	
	public ApplyStudy() {}
	
	public ApplyStudy(int applystudyNo, String memberName, int memberNo, int memberAge, String memberAddress, 
						String memberIntro, Date applystudyDate) {
		super();
		this.applystudyNo = applystudyNo;
		this.memberName = memberName;
		this.memberAge = memberAge;
		this.memberAddress = memberAddress;
		this.memberIntro = memberIntro;
		this.applystudyDate = applystudyDate;
	}

	@Override
	public String toString() {
		return "ApplyStudy [applystudyNo=" + applystudyNo + ", memberName=" + memberName + ", memberNo=" + memberNo
				+ ", memberAge=" + memberAge + ", memberAddress=" + memberAddress + ", memberIntro=" + memberIntro
				+ ", applystudyDate=" + applystudyDate + "]";
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
	
	
	
	
	
	

}
