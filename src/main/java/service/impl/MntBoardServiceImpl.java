package service.impl;

import java.io.File;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.face.MntBoardDao;
import dto.ApplyMnt;
import dto.Commt;
import dto.FileUpload;
import dto.MntBoard;
import dto.MntBoardLike;
import service.face.MntBoardService;
import util.CommtPaging;
import util.PagingVUp;

@Service
public class MntBoardServiceImpl implements MntBoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	  @Autowired MntBoardDao mntBoardDao;
	  @Autowired ServletContext context;

	  // 페이징
	  @Override 
	  public PagingVUp getPaging(Map<String, Object> map, int curPage) {
		  
		  int totalCount = mntBoardDao.CntBoard(map); // 검색 결과에 따라 총 카운트 바뀌도록 수정
		  PagingVUp paging = new PagingVUp(totalCount, curPage);
		  return paging; 
		  
	  }

	 // 글목록
	@Override
	public List<HashMap<String, Object>> list(Map<String, Object> map) {
		return mntBoardDao.MntBoardList(map);
	}

	 // 페이징 글목록
		@Override
		public List<HashMap<String, Object>> list(PagingVUp paging) {
			return mntBoardDao.MntBoardListPaging(paging);
		}
	
	//	게시글 상세보기
	@Override
	public HashMap<String, Object> view(int viewBoard) {
		
		// 조회수 증가
		mntBoardDao.mntBoardHit(viewBoard);
		
		// 상세보기 조회결과 
		return mntBoardDao.selectMntBoard(viewBoard);
	}

	// 글쓰기
	@Override
	public void write(MntBoard mntBoard, MultipartFile file) {
		
		mntBoardDao.insertBoard(mntBoard);
		
		// ----------------------------------------------------
		
				//빈 파일일 경우
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
				fileUpload.setMntBoardNo(mntBoard.getMntboardNo());
				fileUpload.setFileUploadOri(originName);
				fileUpload.setFileUploadStor(storedName);
				
				mntBoardDao.insertFile(fileUpload);
		
				
		
	}

	@Override
	public FileUpload getAttachFile(int mntboardNo) {
		return mntBoardDao.selectMntBoardFileByBoardNo(mntboardNo);
		
	}

	@Override
	public FileUpload getFile(FileUpload fileUpload) {
		return mntBoardDao.selectBoardFileByFileNo(fileUpload);
	}

	@Override
	public HashMap<String, Object> updateBoard(MntBoard mntBoard) {
		return mntBoardDao.mntBoardView(mntBoard);
		
	}

	@Override
	public void update(MntBoard mntBoard, MultipartFile file) {
		
		mntBoardDao.updateMntBoard(mntBoard);
		
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
		fileUpload.setMntBoardNo(mntBoard.getMntboardNo());
		fileUpload.setFileUploadOri(originName);
		fileUpload.setFileUploadStor(storedName);
		
		// 기존 게시글 파일 삭제
		mntBoardDao.deleteFile(mntBoard);
		
		mntBoardDao.insertFile(fileUpload);
	}

	
	@Override
	public void delete(MntBoard mntBoard) {
		
		//첨부파일 삭제
		mntBoardDao.deleteFile(mntBoard);
		// 댓글 삭제
		mntBoardDao.deleteComtByMntBoardNo(mntBoard);
		// 좋아요 삭제
		mntBoardDao.deleteLikeByMntBoardNo(mntBoard);
				
		//게시글 삭제
		mntBoardDao.deleteMntBoard(mntBoard);
				
	}

	

	
	// --------- 댓글 ---------
	


	@Override
	public CommtPaging getCommtPaging(int curPage, int mntboardNo) {

		int totalCount = mntBoardDao.CntCommt(mntboardNo);
		CommtPaging commtPaging = new CommtPaging(totalCount, curPage);
		return commtPaging; 
	}
	

	@Override
	public List<HashMap<String, Object>> commtList(CommtPaging commtPaging, int mntboardNo) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", commtPaging);
		map.put("mntboardNo", mntboardNo);
		
		return mntBoardDao.CommtList(map);
	}



	@Override
	public int getCntCommt(int mntboardNo) {
		int totalCount = mntBoardDao.CntCommt(mntboardNo);
		return totalCount;
	}

	@Override
	public Commt writeCommt(Commt commt) {
		mntBoardDao.insertCommt(commt);
		
		int commtNo = commt.getCommtNo();
		System.out.println("<댓글번호> : " + commtNo);
		Commt commtInsert = mntBoardDao.selectCmtByCommtNo(commtNo);
		return commtInsert;
	
	}

	// 리스트 옆 댓글수
	@Override
	public void mntBoardCmt(int mntboardNo) {
		mntBoardDao.mntBoardCmt(mntboardNo);
	}

	@Override
	public void updateCommt(Commt commt) {
		mntBoardDao.updateMntCommt(commt);
	}

	@Override
	public void deleteCommt(int commtNo) {
		mntBoardDao.deleteMntCommt(commtNo);
	}
	
	
	// 좋아요
	@Override
	public boolean like(MntBoardLike mntboardLike) {
		int likeCnt = mntBoardDao.selectCntLike(mntboardLike);
		
		if(likeCnt > 0) {
				return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean mntboardLike(MntBoardLike mntboardLike) {
		
		if(like(mntboardLike)) {
			mntBoardDao.deleteLike(mntboardLike);
			return false;
		} else {
			mntBoardDao.insertLike(mntboardLike);
		}
		return true;
	}
	
	
	@Override
	public int getTotalCntLike(MntBoardLike mntboardLike) {
		return mntBoardDao.getTotalCntLike(mntboardLike);
	}
	
	
	
	
	// 검색
	@Override
	public List<HashMap<String, Object>> getSearchList(HashMap<String, Object> map) {
		return mntBoardDao.getSearchList(map);
	}

	@Override
	public CommtPaging getSearchPaging(HashMap<String, Object> map) {
		int totalCount = mntBoardDao.cntSearchList(map);
		int curPage = (int) map.get("curPage");
		CommtPaging paging = new CommtPaging(totalCount, curPage);
		return paging;
	}

	@Override
	public String getMemNick(int memberNo) {
		return mntBoardDao.getNickByMemberNo(memberNo);
	}

	

	
	





	
	 
	
	
	
	

}














