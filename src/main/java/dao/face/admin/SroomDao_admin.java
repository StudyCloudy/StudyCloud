package dao.face.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.FileUpload;
import dto.SroomQna;
import dto.StudyRoom;
import util.Paging;

public interface SroomDao_admin {
	
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
	public List<StudyRoom> selectList(Paging paging);
	
	/**
	 * 스터디룸 검색
	 * 
	 * @param param - 검색할 키워드
	 * @return - 게시글 목록
	 */
	public List<HashMap<String, Object>> searchName(HashMap<String, Object> param);

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param studyroom - 삽입할 스터디룸 정보
	 */
	public void insertsRoom(StudyRoom studyroom);
	
	/**
	 * 스터디룸 첨부파일 정보를 삽입한다
	 * 
	 * @param fileUpload
	 */
	public void insertFile(FileUpload fileUpload);

	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param studyroom - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public StudyRoom selectStudyroom(StudyRoom studyroom);

	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param studyroom - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public FileUpload selectFileBySroomNo(StudyRoom studyroom);

	/**
	 * 게시글 정보를 수정한다
	 * 
	 * @param studyroom - 수정할 게시글 정보
	 */
	public void updateStudyroom(StudyRoom studyroom);

	/**
	 * 게시글을 참조하고 있는 모든 첨부파일 삭제
	 * 
	 * @param studyroom - 첨부파일을 삭제할 게시글 번호
	 */
	public void deleteFile(StudyRoom studyroom);

	/**
	 * 게시글을 참조하고 있는 F key 삭제 (예약정보)
	 * 
	 * @param studyroom - 삭제할 글 번호
	 */
	public void deleteReserve(StudyRoom studyroom);
	
	/**
	 * 게시글을 참조하고 있는 F key 삭제 (스터디룸 리뷰)
	 * 
	 * @param studyroom
	 */
	public void deleteReview(StudyRoom studyroom);

	/**
	 * 게시글을 참조하고 있는 F key 삭제 (QnA 문의글)
	 * 
	 * @param studyroom
	 */
	public void deleteQna(StudyRoom studyroom);
	/**
	 * 게시글 삭제
	 * 
	 * @param studyroom - 삭제할 게시글 번호
	 */
	public void delete(StudyRoom studyroom);
	
	//메인

	/**
	 * 스터디룸 게시글 목록 조회
	 * 
	 * @param studyroom 
	 * @return 
	 */
	public List<StudyRoom> srlist(StudyRoom studyroom);

	/**
	 * 게시글 번호를 이용하여 첨부파일을 함께 조회한다
	 * 
	 * @return 조회된 게시글 + 첨부파일
	 */
	public List<Map<String, Object>> selectMap();

	/**
	 * 게시글 번호를 이용해 QnA를 함께 조회한다
	 * 
	 * @param studyroom - 게시글 번호
	 * @return QnA 리스트
	 */
	public List<HashMap<String, Object>> qnaList(Paging paging);

	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param qna - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public SroomQna selectQnaView(SroomQna qnaView);

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param sroomQna - 삽입할 스터디룸 정보
	 */
	public void writeQna(SroomQna sroomQna);

	/**
	 * 게시글 번호를 이용해 QnA 목록을 조회한다
	 * 
	 * @return QnA 목록
	 */
	public List<HashMap<String, Object>> previewQna();

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return - 총 게시글 수
	 */
	public int selectCntQna();






	

}
