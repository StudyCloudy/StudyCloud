package service.face.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import dto.FileUpload;
import dto.SroomQna;
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
	
	/**
	 * 게시글 상세보기
	 * 
	 * @param studyroom - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public StudyRoom view(StudyRoom studyroom);

	/**
	 * 게시글 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param studyroom - 조회할 게시글 번호 객체
	 * @return 첨부 파일 정보
	 */
	public FileUpload getAttachFile(StudyRoom studyroom);
	
	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param studyroom - 게시글 정보
	 * @param file - 첨부파일 정보
	 */
	public void update(StudyRoom studyroom, MultipartFile file);

	/**
	 * 게시글 삭제 + 첨부파일 삭제
	 * 
	 * @param studyroom
	 */
	public void delete(StudyRoom studyroom);

	public List<Map<String, Object>> srListWithFile(StudyRoom studyroom);

	
	//===== QnA =====

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
	public Paging getQnAPaging(int curPage);
	
	/**
	 * 게시글 정보로 QnA를 함께 조회한다
	 * @param paging 
	 * 
	 * @return QnA 리스트
	 */
	public List<HashMap<String, Object>> qnaList(Paging paging);

	/**
	 * 게시글 상세보기
	 * 
	 * @param studyroom - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public SroomQna qnaView(SroomQna qnaView);

	/**
	 * 게시글 정보와 첨부파일을 함께 처리한다
	 * 
	 * @param sroomQna - 게시글 정보 객체
	 */
	public void writeqna(SroomQna sroomQna);

	/**
	 * 게시글 정보로 QnA를 함께 조회한다
	 * 
	 * 
	 * @return QnA 게시글 목록
	 */
	public List<HashMap<String, Object>> previewQna();

	
	/**
	 * 스터디룸 검색
	 * 
	 * @param param
	 * @return
	 */
	public List<HashMap<String, Object>> searchName(HashMap<String, Object> param);



}
