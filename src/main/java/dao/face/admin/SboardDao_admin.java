package dao.face.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.Member;
import dto.StudyBoard;
import util.Paging;
import util.PagingVUp;

public interface SboardDao_admin {

	/**
	 * 작성일을 이용해 오늘 작성된 신청서를 조회한다
	 * 
	 * @param studyBoard - 신청서 작성일
	 * @return 작성된 신청서 갯수
	 */
	public int todayCntStudy(StudyBoard studyBoard);

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return - 총 게시글 수
	 */
	public int selectCntAll();

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<StudyBoard> selectStudyList(PagingVUp paging);
	
	/**
	 * 회원 번호를 이용해 회원 정보를 변경한다
	 * 
	 * @param member - 변경할 회원 정보
	 * @return 변경된 회원 정보
	 */
	public Member updateStudyMember(Member member);

	//메인페이지
	
	/**
	 * 게시글 번호를 이용해 회원정보를 함께 조회한다
	 * 
	 * @param sboard - 게시글 번호
	 * @return 게시글 + 작성자
	 */
	public List<HashMap<String, Object>> selectStList();


}
