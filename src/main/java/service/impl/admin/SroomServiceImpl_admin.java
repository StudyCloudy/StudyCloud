package service.impl.admin;

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

import dao.face.admin.SroomDao_admin;
import dto.FileUpload;
import dto.SroomQna;
import dto.StudyRoom;
import service.face.admin.SroomService_admin;
import util.Paging;

@Service
public class SroomServiceImpl_admin implements SroomService_admin {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SroomDao_admin sRoomDao_admin;
	
	@Autowired ServletContext context; //파일 업로드

	@Override
	public Paging getPaging(int curPage) {
		
		//총 게시글 수 조회;
		int totalCount = sRoomDao_admin.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<StudyRoom> list(Paging paging) {
		return sRoomDao_admin.selectList(paging);
	}

	//스터디룸 검색
	@Override
	public List<HashMap<String, Object>> searchName(HashMap<String, Object> param) {
		return sRoomDao_admin.searchName(param);
	}
	
	@Override
	public StudyRoom view(StudyRoom studyroom) {
		
		//상세보기 조회 결과 리턴
		return sRoomDao_admin.selectStudyroom(studyroom);
	}
	
	@Override
	public void write(StudyRoom studyroom, MultipartFile file) {
		
		//게시글 처리
		if( "".equals(studyroom.getsRoomName() ) ) {
			studyroom.setsRoomName("(제목없음)");
		}

		sRoomDao_admin.insertsRoom(studyroom);

		//--------------
		
		//첨부파일 처리

		//빈 파일 경우
		if( file.getSize() <= 0 ) {
			
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		
		//폴더 없을 경우 생성
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
	
		//--------------------------------------------------------------------------
		
		//첨부파일 정보 DB 기록
		FileUpload sRoomFile = new FileUpload();
		sRoomFile.setSroomNo( studyroom.getsRoomNo() );
		sRoomFile.setFileUploadOri(originName);
		sRoomFile.setFileUploadStor(storedName);
		
		sRoomDao_admin.insertFile(sRoomFile);
		
	}

	@Override
	public FileUpload getAttachFile(StudyRoom studyroom) {
		return sRoomDao_admin.selectFileBySroomNo(studyroom);
	}

	@Override
	public void update(StudyRoom studyroom, MultipartFile file) {
		
		//게시글 처리
		
		//제목이 비어있을 경우
		if( "".equals( studyroom.getsRoomName() ) ) {
			studyroom.setsRoomName("(제목없음)");
		}
		
		sRoomDao_admin.updateStudyroom(studyroom);
		
		//--------------------------------------------
		
		//첨부파일 처리
		
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
		FileUpload sRoomFile = new FileUpload();
		sRoomFile.setSroomNo( studyroom.getsRoomNo() );
		sRoomFile.setFileUploadOri(originName);
		sRoomFile.setFileUploadStor(storedName);
		
		//기존에 게시글에 연결된 첨부파일을 삭제한다
		sRoomDao_admin.deleteFile(studyroom);
		
		sRoomDao_admin.insertFile(sRoomFile);		
		
	}

	@Override
	public void delete(StudyRoom studyroom) {
		
		//QnA 삭제
		sRoomDao_admin.deleteQna(studyroom);
		
		//예약 정보 삭제
		sRoomDao_admin.deleteReserve(studyroom);
		
		//리뷰 삭제
		sRoomDao_admin.deleteReview(studyroom);
		
		//첨부파일 삭제
		sRoomDao_admin.deleteFile(studyroom);
		
		//게시글 삭제
		sRoomDao_admin.delete(studyroom);
		
	}

	
	//QnA 리스트
	@Override
	public Paging getQnAPaging(int curPage) {
		
		//총 게시글 수 조회;
		int totalCount = sRoomDao_admin.selectCntQna();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<HashMap<String, Object>> qnaList(Paging paging) {
		
		return sRoomDao_admin.qnaList(paging);
	}
	
	@Override
	public SroomQna qnaView(SroomQna qnaView) { //QnA 상세보기
		return sRoomDao_admin.selectQnaView(qnaView);
	}

	@Override
	public void writeqna(SroomQna sroomQna) { //답변 작성
		sRoomDao_admin.writeQna(sroomQna);
	}

	@Override
	public List<HashMap<String, Object>> previewQna() { //메인페이지 QnA 미리보기
		return sRoomDao_admin.previewQna();
	}

	//메인페이지
	@Override
	public List<Map<String, Object>> srListWithFile(StudyRoom studyroom) {
		
		return sRoomDao_admin.selectMap();
	}







}
