package dao.face.admin;

import java.util.HashMap;
import java.util.List;

import dto.Member;
import util.Paging;
import util.PagingVUp;

public interface MemberDao_admin {

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
	public List<Member> selectList(PagingVUp paging);

	
	//로그인
	/**
	 * 회원탈퇴 여부를 포함한 로그인 쿼리
	 * 
	 * @param member
	 */
	public String login(Member member);
	
	public Member getMemberById(String memberId);
	

	//회원 관리 검색
	/**
	 * 검색
	 * 
	 * @param param
	 * @return
	 */
	public List<HashMap<String, Object>> searchMember(HashMap<String,Object> param);



}
