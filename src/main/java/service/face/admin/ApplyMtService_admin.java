package service.face.admin;

import java.util.List;

import dto.ApplyMt;
import dto.Member;
import util.Paging;
import util.PagingVUp;

public interface ApplyMtService_admin {

	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 파라미터 curPage (현재 페이지)
	 * DB에서 조회한 totalCount(총 게시글 수)
	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하여 반환한다
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return 계산이 완료된 Paging 객체
	 */
	public PagingVUp getPaging(int curPage);
	
	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<ApplyMt> list(PagingVUp paging);
	

	/**
	 * 선택된 회원의 정보 업데이트
	 * 
	 * @param member - 회원 정보
	 */
	public Member updateMember(Member member);
	
	/**
	 * 멘토 신청 목록
	 * 
	 * @param applyMt
	 * @return
	 */
	public int todayApply(ApplyMt applyMt);

	
	
	
	
//	/**
//	 * 게시글 상세보기
//	 * 
//	 * @param member - 상세 조회할 게시글 번호 객체
//	 * @return 조회된 상세 게시글 객체
//	 */
//	public Member view(Member member);


}
