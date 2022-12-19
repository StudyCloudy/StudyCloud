package service.face;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import dto.ApplyMnt;
import dto.ApplyMt;
import dto.FileUpload;
import dto.MtBoard;
import dto.MtMark;
import dto.MtReview;
import util.CommtPaging;
import util.PagingVUp;

public interface MtBoardService {

	
	public PagingVUp getPaging(Map<String, Object> map, int curPage);

	public List<HashMap<String, Object>> list(Map<String, Object> map);

	public List<HashMap<String, Object>> list(PagingVUp paging);
	
	public HashMap<String, Object> view(int viewBoardNo);

	public void write(MtBoard mtBoard, MultipartFile file);
	
	// 첨부파일
	public FileUpload getAttachFile(int viewBoardNo);
	public FileUpload getFile(FileUpload fileUpload);

	
	public HashMap<String, Object> updateBoard(MtBoard mtBoard);

	public void update(MtBoard mtBoard, MultipartFile file);

	public void delete(MtBoard mtBoard);
	

	
	// 찜하기
	public boolean mark(MtMark mtMark);
	
	public boolean mtboardMark(MtMark mtMark);
	
	public int getTotalCntMark(MtMark mtMark);
	
	
	
	
	// 검색
	public List<HashMap<String, Object>> getSearchList(HashMap<String, Object> map);
	
	public CommtPaging getSearchPaging(HashMap<String, Object> map);

	
	
	// 유저 정보불러오기
	public String getMemId(int memberNo);
	public String getMemEmail(int memberNo);
	public String getMemName(int memberNo);
	public String getMemPhone(int memberNo);
	public String getMemNick(int memberNo);

	// 멘토지원
	public void applyMt(ApplyMt applyMt);

	// 멘토링신청
	public void applyMnt(Map<String,Object> mnt);

	// 리뷰쓰기
	public void writeReview(MtReview review);
	
	// 리뷰 목록 조회
	public List<HashMap<String, Object>> getReviewList(int mtboardNo);

	// 리뷰 권한 체크
	public int isBuyer(Map<String, Object> reviewAuthMap);

	public void updateReview(MtReview review);

	public int iswrite(Map<String, Object> map);

	public void deleteReview(int reviewNo);

	// 리뷰 개수
	public int getCntReview(int mtboardNo);

	public void mtBoardReview(int mtboardNo);

	













	
	
	
	
	
	
	
	

//	public void applyMt(ApplyMt applyMt);
//	
//	// 멘토링신청
//	public void applyMnt(ApplyMnt applyMnt);

	// 후기
	//public CommtPaging getCommtPaging(int curPage, int mtboardNo);

	//public List<HashMap<String, Object>> reviewList(CommtPaging reviewPaging, int mtboardNo);

	//public int getCntReview(int mtboardNo);

	//public void mtBoardRvw(int mtboardNo);



	
}
