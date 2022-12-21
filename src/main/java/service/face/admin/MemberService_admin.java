package service.face.admin;

import java.util.HashMap;
import java.util.List;

import dto.Member;
import util.Paging;
import util.PagingVUp;

public interface MemberService_admin {

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
	public List<Member> list(PagingVUp paging);

	//로그인
	
	public String loginMember(Member member);
	
	public Member memberInfo(Member member);

//	/**
//	 * 전달된 id를 이용하여 사용자 정보 조회하기
//	 * 
//	 * @param adminLogin - 조회할 사용자의 id
//	 * @return 조회된 사용자 정보
//	 */
//	public Member info(String loginid);

	// 검색기능
	/**
	 * 
	 * 
	 * @param param
	 * @return
	 */
	public List<HashMap<String, Object>> searchMember(HashMap<String,Object> param);

	
	




}
