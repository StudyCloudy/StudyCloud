package dao.face;

import java.util.HashMap;
import java.util.List;

import dto.FileUpload;
import dto.Mboard;
import dto.MboardLike;
import util.Paging;

public interface MboardDao {
	
	/**
	 * 전체 게시글 수 조회
	 * @return 총 게시글 수
	 */
	public int selectCntAll();
	
//	/**
//	 * 페이징 적용하여 게시글 목록 조회
//	 * @param paging
//	 * @return
//	 */
//	List<Mboard> selectList(Paging paging);

	public List<HashMap<String, Object>> selectMboardHash(Paging paging);

	/**
	 * 조회수 +1 증가
	 * @param mboardNo
	 */
	public void updateHit(Mboard mboard);

	/**
	 * 게시판 번호로 상세페이지 조회
	 * @param mboardNo
	 * @return
	 */
	public HashMap<String, Object> detailPageByMboardNo(Mboard mboard);

	/**
	 * 게시글 삽입
	 * @param mboard
	 */
	public void insert(Mboard mboard);

	/**
	 * 파일 삽입
	 * @param fileUpload
	 */
	public void insertFile(FileUpload fileUpload);

	/**
	 * 첨부파일
	 * @param mboardNo - 게시글 번호로 조회
	 * @return
	 */
	public FileUpload selectMboardFileByMboardNo(Mboard mboard);

	/**
	 * 
	 * @param fileUpload
	 * @return
	 */
	public FileUpload selectMboardFileByFileUploadNo(FileUpload fileUpload);

	/**
	 * 게시글 수정
	 * @param mboard
	 */
	public void update(Mboard mboard);

	/**
	 * 기존 게시글 첨부 파일 삭제
	 * @param mboard
	 */
	public void deleteFile(Mboard mboard);
	
	/**
	 * 게시글 삭제
	 * @param mboard
	 */
	public void deleteByMboardNo(Mboard mboard);
	
	public FileUpload detailFile(Mboard mboard);

	/**
	 * 기존 게시글 삭제
	 * @param mboard
	 */
	public void delete(Mboard mboard);

	
	public int likecount(MboardLike mboardLike);

	public void insertLike(MboardLike mboardLike);

	public void cancelLike(MboardLike mboardLike);


	/**
	 * 번개게시글 검색
	 * @param param
	 * @return
	 */
	public List<HashMap<String, Object>> searchByKeyword(HashMap<String, Object> param);

	

	
}
