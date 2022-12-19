package dto;

import java.util.Date;

public class MtReview {

	private int mtreviewNo;
	private int mtboardNo;
	private int memberNo;
	private String mtreviewContent;
	private Date mtreviewDate;
	private int mtreviewScore;
	
	public MtReview() {}

	public MtReview(int mtreviewNo, int mtboardNo, int memberNo, String mtreviewContent, Date mtreviewDate,
			int mtreviewScore) {
		super();
		this.mtreviewNo = mtreviewNo;
		this.mtboardNo = mtboardNo;
		this.memberNo = memberNo;
		this.mtreviewContent = mtreviewContent;
		this.mtreviewDate = mtreviewDate;
		this.mtreviewScore = mtreviewScore;
	}

	@Override
	public String toString() {
		return "MtReview [mtreviewNo=" + mtreviewNo + ", mtboardNo=" + mtboardNo + ", memberNo=" + memberNo
				+ ", mtreviewContent=" + mtreviewContent + ", mtreviewDate=" + mtreviewDate + ", mtreviewScore="
				+ mtreviewScore + "]";
	}

	public int getMtreviewNo() {
		return mtreviewNo;
	}

	public void setMtreviewNo(int mtreviewNo) {
		this.mtreviewNo = mtreviewNo;
	}

	public int getMtboardNo() {
		return mtboardNo;
	}

	public void setMtboardNo(int mtboardNo) {
		this.mtboardNo = mtboardNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMtreviewContent() {
		return mtreviewContent;
	}

	public void setMtreviewContent(String mtreviewContent) {
		this.mtreviewContent = mtreviewContent;
	}

	public Date getMtreviewDate() {
		return mtreviewDate;
	}

	public void setMtreviewDate(Date mtreviewDate) {
		this.mtreviewDate = mtreviewDate;
	}

	public int getMtreviewScore() {
		return mtreviewScore;
	}

	public void setMtreviewScore(int mtreviewScore) {
		this.mtreviewScore = mtreviewScore;
	}

}
