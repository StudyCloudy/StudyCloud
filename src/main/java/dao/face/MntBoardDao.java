package dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.ApplyMnt;
import dto.Commt;
import dto.FileUpload;
import dto.MntBoard;
import dto.MntBoardLike;
import util.CommtPaging;
import util.Paging;
import util.PagingVUp;

public interface MntBoardDao {

	/**
	 *  게시글 수 전체 조회
	 * 
	 * @return 총 게시글 수
	 */
	public int CntBoard(Map<String, Object> map);

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging
	 * @return
	 */
	public List<HashMap<String, Object>> MntBoardList(Map<String, Object> map);
	
	public List<HashMap<String, Object>> MntBoardListPaging(PagingVUp paging);


	/**
	 * 조회수 증가
	 * @param viewBoard
	 */
	public void mntBoardHit(int viewBoard);

	
	/**
	 * 글번호를 이용해서 게시글 조회
	 * 
	 * @param viewBoard - 조회 할 글번호
	 * @return 조회된 글정보
	 */
	public HashMap<String, Object> selectMntBoard(int mntboardNo);

	
	/**
	 * 게시글 정보 삽입
	 * 
	 * @param mntBoard - 삽입할 게시글 정보
	 */
	public void insertBoard(MntBoard mntBoard);

	
	
	/**
	 * 첨부파일 정보 삽입
	 * 
	 * @param mntBoardFile
	 */
	public void insertFile(FileUpload fileUpload);

	
	/**
	 * 게시글 번호 이용해서 첨부파일 정보 조회
	 * 
	 * @param int mntboardNo 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public FileUpload selectMntBoardFileByBoardNo(int mntboardNo);

	
	/**
	 * 파일 번호를 이용 -> 첨부파일 정보 조회
	 * 
	 * @param fileUpload 조회 할 첨부파일
	 * @return 조회된 첨부파일 
	 */
	public FileUpload selectBoardFileByFileNo(FileUpload fileUpload);


	public HashMap<String, Object> mntBoardView(MntBoard mntBoard);

	/**
	 * 
	 * @param mntBoard 수정 할 게시글 정보
	 */
	public void updateMntBoard(MntBoard mntBoard);

	/**
	 * 
	 * @param mntBoard 첨부파일 삭제 게시글 번호
	 */
	public void deleteFile(MntBoard mntBoard);

	
	/**
	 * 게시글 삭제
	 * @param mntBoard
	 */
	public void deleteLikeByMntBoardNo(MntBoard mntBoard);
	public void deleteComtByMntBoardNo(MntBoard mntBoard);
	public void deleteMntBoard(MntBoard mntBoard);

	
	// 댓글
	
	public int CntCommt(int mntboardNo);
	
	public List<HashMap<String, Object>> CommtList(HashMap<String, Object> map);
	
	// 리스트옆 댓글수
	public void mntBoardCmt(int mntboardNo);
	
	public void insertCommt(Commt commt);
	
	public Commt selectCmtByCommtNo(int commtNo);
	
	public void updateMntCommt(Commt commt);
	
	public void deleteMntCommt(int commtNo);


	
	// 좋아요
	public int selectCntLike(MntBoardLike mntboardLike);
	
	public void deleteLike(MntBoardLike mntboardLike);
	
	public void insertLike(MntBoardLike mntboardLike);
	
	public int getTotalCntLike(MntBoardLike mntboardLike);

	// 좋아요 수
	public void mntBoardLike(MntBoard viewBoard);

	
	// 검색
	public List<HashMap<String, Object>> getSearchList(HashMap<String, Object> map);

	public int cntSearchList(HashMap<String, Object> map);

	
	// 글쓰기 멤버 닉네임 불러오기
	public String getNickByMemberNo(int memberNo);



	




	
	




	
	
	
	
	
	
}











