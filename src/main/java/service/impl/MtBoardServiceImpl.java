package service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.face.MtBoardDao;
import dto.ApplyMnt;
import dto.ApplyMt;
import dto.FileUpload;
import dto.MtBoard;
import dto.MtMark;
import dto.MtReview;
import service.face.MtBoardService;
import util.CommtPaging;
import util.PagingVUp;

@Service
public class MtBoardServiceImpl implements MtBoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MtBoardDao mtBoardDao;
	@Autowired ServletContext context;
	
	// 페이징
	@Override
	public PagingVUp getPaging(Map<String, Object> map, int curPage) {
		
		  int totalCount = mtBoardDao.CntMtBaord(map);
		  PagingVUp paging = new PagingVUp(totalCount, curPage);
		  return paging; 
	}

	// 글목록
	@Override
	public List<HashMap<String, Object>> list(Map<String, Object> map) {
		return mtBoardDao.MtBoardList(map);
	}

	// 페이징 글목록
	@Override
	public List<HashMap<String, Object>> list(PagingVUp paging) {
		return mtBoardDao.MtBoardListPaging(paging);
	}
	
	// 상세보기
	@Override
	public HashMap<String, Object> view(int viewBoard) {
		
		// 조회수 증가
		mtBoardDao.mtBoardHit(viewBoard);
		
		// 상세보기 조회결과 
		return mtBoardDao.selectMtBoard(viewBoard);
	}

	// 글쓰기
	@Override
	public void write(MtBoard mtBoard, MultipartFile file) {
		
		mtBoardDao.insertBoard(mtBoard);
		
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		
		System.out.println("storedPath {} " +storedPath);
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, originName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//--------------------------------------------
		
		//첨부파일 정보 DB 기록
		FileUpload fileUpload = new FileUpload();
		fileUpload.setMtBoardNo(mtBoard.getMtboardNo());
		fileUpload.setFileUploadOri(originName);
		fileUpload.setFileUploadStor(storedName);
		
		mtBoardDao.insertFile(fileUpload);
		
	}
	
	
	 @Override public FileUpload getAttachFile(int mtboardNo) { 
		 return mtBoardDao.selectMtBoardFileByBoardNo(mtboardNo); 
	 }

	@Override
	public FileUpload getFile(FileUpload fileUpload) {
		return mtBoardDao.selectBoardFileByFileNo(fileUpload);
	}

	@Override
	public HashMap<String, Object> updateBoard(MtBoard mtBoard) {
		return mtBoardDao.mtBoardView(mtBoard);
	}

	@Override
	public void update(MtBoard mtBoard, MultipartFile file) {
		
		mtBoardDao.updateMtBoard(mtBoard);
		
		// 첨부파일
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//--------------------------------------------
		
		//첨부파일 정보 DB 기록
		FileUpload fileUpload = new FileUpload();
		fileUpload.setMtBoardNo(mtBoard.getMtboardNo());
		fileUpload.setFileUploadOri(originName);
		fileUpload.setFileUploadStor(storedName);
		
		// 기존 게시글 파일 삭제
		mtBoardDao.deleteFile(mtBoard);
		
		mtBoardDao.insertFile(fileUpload);		
	}

	@Override
	public void delete(MtBoard mtBoard) {
		mtBoardDao.deleteComtByMtBoardNo(mtBoard);
		mtBoardDao.deleteApplyByMtBoardNo(mtBoard);
		mtBoardDao.deleteMarkByMtBoardNo(mtBoard);
		mtBoardDao.deleteFile(mtBoard);
		mtBoardDao.deleteMtBoard(mtBoard);
	}

	
	// 찜하기
	@Override
	public boolean mark(MtMark mtMark) {
		int markCnt = mtBoardDao.selectCntMark(mtMark);
		
		if(markCnt > 0) {
				return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean mtboardMark(MtMark mtMark) {
		if(mark(mtMark)) {
			mtBoardDao.deleteMark(mtMark);
			return false;
	} else {
		mtBoardDao.inserMark(mtMark);
	}
		return true;
	}

	@Override
	public int getTotalCntMark(MtMark mtMark) {
		return mtBoardDao.getTotalCntMark(mtMark);
	}



	// 검색
	@Override
	public List<HashMap<String, Object>> getSearchList(HashMap<String, Object> map) {
		return mtBoardDao.getSearchList(map);
	}
	
	@Override
	public CommtPaging getSearchPaging(HashMap<String, Object> map) {
		int totalCount = mtBoardDao.cntSearchList(map);
		int curPage = (int) map.get("curPage");
		CommtPaging paging = new CommtPaging(totalCount, curPage);
		return paging;
	}

	
	
	// 유저 정보
	@Override
	public String getMemId(int memberNo) {
		return mtBoardDao.getIdByMemberNo(memberNo);
	}

	@Override
	public String getMemEmail(int memberNo) {
		return mtBoardDao.getEmailByMemberNo(memberNo);
	}

	@Override
	public String getMemName(int memberNo) {
		return mtBoardDao.getNameByMemberNo(memberNo);
	}

	@Override
	public String getMemPhone(int memberNo) {
		return mtBoardDao.getPhoneByMemberNo(memberNo);
	}

	@Override
	public String getMemNick(int memberNo) {
		return mtBoardDao.getNickByMemberNo(memberNo);
	}
	
	
	// 멘토지원
	@Override
	public void applyMt(ApplyMt applyMt) {
		mtBoardDao.applyMt(applyMt);
	}

	// 멘토링신청 - 결제
	@Override
	public void applyMnt(Map<String, Object> mnt) {
		 mtBoardDao.applyMnt(mnt);
	}

	@Override
	public void writeReview(MtReview review) {
		mtBoardDao.writeReview(review);
	}
	
	@Override
	public List<HashMap<String, Object>> getReviewList(int mtboardNo) {
		return mtBoardDao.getReviewList(mtboardNo);
	}

	@Override
	public int isBuyer(Map<String, Object> reviewAuthMap) {
		return mtBoardDao.isBuyer(reviewAuthMap);
	}

	@Override
	public void updateReview(MtReview review) {
		mtBoardDao.updateReview(review);
	}

	@Override
	public int iswrite(Map<String, Object> map) {
		return mtBoardDao.isWrite(map);
	}

	@Override
	public void deleteReview(int reviewNo) {
		mtBoardDao.deleteReview(reviewNo);
	}


	@Override
	public int getCntReview(int mtboardNo) {
		int totalCount = mtBoardDao.CntReview(mtboardNo);
		return totalCount;
	}

	@Override
	public void mtBoardReview(int mtboardNo) {
		mtBoardDao.mtBoardReview(mtboardNo);
	}
	
}



