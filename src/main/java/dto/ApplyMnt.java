package dto;

import java.util.Date;

public class ApplyMnt {

	private int applymntNo;
	private int mtboardNo;
	private int memberNo;
	private String stTime;
	private String edTime;
	private String mntDate;
	private String mntContent;
	private int totalPrice;
	private Date mntPaydate;
	
	public ApplyMnt() {}
	

	public ApplyMnt(int applymntNo, int mtboardNo, int memberNo, String stTime, String edTime, String mntDate,
			String mntContent) {
		super();
		this.applymntNo = applymntNo;
		this.mtboardNo = mtboardNo;
		this.memberNo = memberNo;
		this.stTime = stTime;
		this.edTime = edTime;
		this.mntDate = mntDate;
		this.mntContent = mntContent;
	}




	public ApplyMnt(int applymntNo, int mtboardNo, int memberNo, String stTime, String edTime, String mntDate,
			String mntContent, int totalPrice, Date mntPaydate) {
		super();
		this.applymntNo = applymntNo;
		this.mtboardNo = mtboardNo;
		this.memberNo = memberNo;
		this.stTime = stTime;
		this.edTime = edTime;
		this.mntDate = mntDate;
		this.mntContent = mntContent;
		this.totalPrice = totalPrice;
		this.mntPaydate = mntPaydate;
	}

	@Override
	public String toString() {
		return "ApplyMnt [applymntNo=" + applymntNo + ", mtboardNo=" + mtboardNo + ", memberNo=" + memberNo
				+ ", stTime=" + stTime + ", edTime=" + edTime + ", mntDate=" + mntDate + ", mntContent=" + mntContent
				+ ", totalPrice=" + totalPrice + ", mntPaydate=" + mntPaydate + "]";
	}

	public int getApplymntNo() {
		return applymntNo;
	}

	public void setApplymntNo(int applymntNo) {
		this.applymntNo = applymntNo;
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

	public String getStTime() {
		return stTime;
	}

	public void setStTime(String stTime) {
		this.stTime = stTime;
	}

	public String getEdTime() {
		return edTime;
	}

	public void setEdTime(String edTime) {
		this.edTime = edTime;
	}

	public String getMntDate() {
		return mntDate;
	}

	public void setMntDate(String mntDate) {
		this.mntDate = mntDate;
	}

	public String getMntContent() {
		return mntContent;
	}

	public void setMntContent(String mntContent) {
		this.mntContent = mntContent;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getMntPaydate() {
		return mntPaydate;
	}

	public void setMntPaydate(Date mntPaydate) {
		this.mntPaydate = mntPaydate;
	}
	
	
}
