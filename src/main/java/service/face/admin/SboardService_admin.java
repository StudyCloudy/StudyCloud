package service.face.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.Member;
import dto.StudyBoard;
import util.Paging;
import util.PagingVUp;

public interface SboardService_admin {

	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 파라미터 curPage (현재 페이지)
	 * DB에서 조회한 totalCount(총 게시글 수)
	 * 두 가지 데이터ㅡㄹ 활용하여 페이징 객체를 생성하여 반환한다
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
	public List<StudyBoard> list(PagingVUp paging);

	/**
	 * 선택한 회원의 정보 업데이트
	 * 
	 * @param member - 회원 정보
	 * @return 등급 변경할 회원
	 */
	public Member updateMember(Member member);

	/**
	 * 스터디 신청 목록
	 * 
	 * @param studyBoard
	 * @return 
	 */
	public int todayApply(StudyBoard studyBoard);

	
	//메인 페이지
	
	/**
	 * 게시글 번호를 이용해 회원정보를 함께 조회한다
	 * 
	 * @param sboard - 게시글 번호
	 * @return 게시글 + 작성자
	 */
	public List<HashMap<String, Object>> stList();

}
