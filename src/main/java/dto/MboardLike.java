package dto;

public class MboardLike {
	
	private int mlikeNo;
	private int mBoardNo;
	private int memberNo;
	
	public MboardLike() {}
	
	public MboardLike(int mlikNo, int mBoardNo, int memberNo) {
		
		super();
		this.mlikeNo = mlikeNo;
		this.mBoardNo = mBoardNo;
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "MboardLike [mlikeNo=" + mlikeNo + ", mBoardNo=" + mBoardNo + ", memberNo=" + memberNo + "]";
	}

	public int getMlikeNo() {
		return mlikeNo;
	}

	public void setMlikeNo(int mlikeNo) {
		this.mlikeNo = mlikeNo;
	}

	public int getMBoardNo() {
		return mBoardNo;
	}

	public void setMBoardNo(int mBoardNo) {
		this.mBoardNo = mBoardNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	
	

}
