package dto;

import java.util.Date;

public class StudyBoard {
	
	private int studyNo;
	private int memberNo;
	private String studyTitle;
	private int studyPeople;
	private String studyAddress; 
	private String studyTag; 
	private Date studyDate;
	private String studyTime; 
	private String studyContent;
	private String studyNotify;
	private Date enrollstudyDate;
	
	public StudyBoard() {}
	
	public StudyBoard(int studyNo, int memberNo, String studyTitle, int studyPeople, String studyAddress,
			String studyTag, Date studyDate, String studyTime, String studyContent, String studyNotify, Date enrollstudyDate) {
		super();
		this.studyNo = studyNo;
		this.memberNo = memberNo;
		this.studyTitle = studyTitle;
		this.studyPeople = studyPeople;
		this.studyAddress = studyAddress;
		this.studyTag = studyTag;
		this.studyDate = studyDate;
		this.studyTime = studyTime;
		this.studyContent = studyContent;
		this.studyNotify = studyNotify;
		this.enrollstudyDate = enrollstudyDate;
	}

	@Override
	public String toString() {
		return "StudyBoard [studyNo=" + studyNo + ", memberNo=" + memberNo + ", studyTitle=" + studyTitle
				+ ", studyPeople=" + studyPeople + ", studyAddress=" + studyAddress + ", studyTag=" + studyTag
				+ ", studyDate=" + studyDate + ", studyTime=" + studyTime + ", studyContent=" + studyContent + ", studyNotify=" + studyNotify
				+ ", enrollstudyDate=" + enrollstudyDate + "]";
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

	public String getStudyTitle() {
		return studyTitle;
	}

	public void setStudyTitle(String studyTitle) {
		this.studyTitle = studyTitle;
	}

	public int getStudyPeople() {
		return studyPeople;
	}

	public void setStudyPeople(int studyPeople) {
		this.studyPeople = studyPeople;
	}

	public String getStudyAddress() {
		return studyAddress;
	}

	public void setStudyAddress(String studyAddress) {
		this.studyAddress = studyAddress;
	}

	public String getStudyTag() {
		return studyTag;
	}

	public void setStudyTag(String studyTag) {
		this.studyTag = studyTag;
	}

	public Date getStudyDate() {
		return studyDate;
	}

	public void setStudyDate(Date studyDate) {
		this.studyDate = studyDate;
	}

	public String getStudyTime() {
		return studyTime;
	}

	public void setStudyTime(String studyTime) {
		this.studyTime = studyTime;
	}

	public String getStudyNotify() {
		return studyNotify;
	}
	

	public String getStudyContent() {
		return studyContent;
	}

	public void setStudyContent(String studyContent) {
		this.studyContent = studyContent;
	}

	public void setStudyNotify(String studyNotify) {
		this.studyNotify = studyNotify;
	}

	public Date getEnrollstudyDate() {
		return enrollstudyDate;
	}

	public void setEnrollstudyDate(Date enrollstudyDate) {
		this.enrollstudyDate = enrollstudyDate;
	}
	
	
	
}
