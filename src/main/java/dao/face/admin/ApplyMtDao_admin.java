package dao.face.admin;

import java.util.List;

import dto.ApplyMt;
import dto.Member;
import util.Paging;
import util.PagingVUp;

public interface ApplyMtDao_admin {

	/**
	 * 작성일을 이용해 오늘 작성된 신청서를 조회한다
	 * 
	 * @param applyMt - 신청서 작성일
	 * @return 작성된 신청서 갯수
	 */
	public int todayCntApplyMt(ApplyMt applyMt);

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return - 총 게시글 수
	 */
	public  int selectCntAll();
	
	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<ApplyMt> selectApplyList(PagingVUp paging);

	
	/**
	 * 회원 번호를 이용해 회원 정보를 변경한다
	 * 
	 * @param member - 변경할 회원 정보
	 * @return 변경된 회원 정보
	 */
	public Member updateApplyMember(Member member);
	

	
//	/**
//	 * 게시글 번호를 조회하여 게시글을 조회한다
//	 * 
//	 * @param member - 조회하려는 게시글 번호
//	 * @return 조회된 게시글 정보
//	 */
//	public Member selectApplyMt(Member member);

	


}
