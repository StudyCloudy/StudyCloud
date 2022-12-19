package service.face;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import dto.ApplyMnt;
import dto.Commt;
import dto.FileUpload;
import dto.MntBoard;
import dto.MntBoardLike;
import util.CommtPaging;
import util.PagingVUp;

public interface MntBoardService {

	// ------ 게시판 -------
	
	// 페이징
	public PagingVUp getPaging(Map<String, Object> map, int curPage);

	// 글목록
	public List<HashMap<String, Object>> list(Map<String, Object> map);
	
	
	public List<HashMap<String, Object>> list(PagingVUp paging);
	
	
	// 게시글 조회
	public HashMap<String, Object> view(int viewBoardNo);

	// 게시글 쓰기
	public void write(MntBoard mntBoard, MultipartFile file);

	// 첨부파일
	public FileUpload getAttachFile(int viewBoardNo);
	public FileUpload getFile(FileUpload fileUpload);

	// 글 수정 값
	public HashMap<String, Object> updateBoard(MntBoard mntBoard);

	// 글 수정
	public void update(MntBoard mntBoard, MultipartFile file);

	// 글 삭제
	public void delete(MntBoard mntBoard);

	
	// --------------- 댓글 ---------------
	
	// 댓글 개수
	public int getCntCommt(int mntboardNo);
	
	// 댓글 목록
	public List<HashMap<String, Object>> commtList(CommtPaging commtPaging, int mntboardNo);

	// 글목록 옆 댓글 개수 
	public void mntBoardCmt(int mntboardNo);
	
	// 댓글 페이징
	public CommtPaging getCommtPaging(int curPage, int mntboardNo);
	
	// 댓글 쓰기
	public Commt writeCommt(Commt commt);

	// 댓글 수정
	public void updateCommt(Commt commt);
	
	// 댓글 삭제
	public void deleteCommt(int commtNo);



	
	
	// ---------- 좋아요 -----------
	
	public boolean mntboardLike(MntBoardLike mntboardLike);

	public boolean like(MntBoardLike mntboardLike);
	
	// 좋아요 누적 수 
	public int getTotalCntLike(MntBoardLike mntboardLike);

	
	
	// ---------- 검색 -----------
	public List<HashMap<String, Object>> getSearchList(HashMap<String, Object> map);
	
	public CommtPaging getSearchPaging(HashMap<String, Object> map);

	
	// 멤버 닉네임 가져오기
	public String getMemNick(int memberNo);
	
	

	

	

	
	
	
	
	
	
}



















