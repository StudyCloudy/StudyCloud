package service.face.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.Reservation;
import util.Paging;
import util.PagingVUp;

public interface ReserveService_admin {
	
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
	 * 게시글 상세보기
	 * 
	 * @param reservation - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public List<HashMap<String, Object>> viewReserve(Reservation res);

	/**
	 * 키워드로 검색
	 * 
	 * @param param
	 * @return
	 */
	public List<HashMap<String, Object>> searchName(HashMap<String,Object> param);



}
