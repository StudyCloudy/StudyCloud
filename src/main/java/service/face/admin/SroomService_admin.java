package service.face.admin;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import dto.StudyRoom;
import util.Paging;

public interface SroomService_admin {

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
	public Paging getPaging(int curPage);

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<StudyRoom> list(Paging paging);
	
	/**
	 * 게시글 정보와 첨부파일을 함께 처리한다
	 * 
	 * @param studyroom - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void write(StudyRoom studyroom, MultipartFile file);




}
