package service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import controller.MypageController;
import dao.face.MemberDao;
import dao.face.MypageDao;
import dto.FileUpload;
import dto.Member;
import dto.Reservation;
import service.face.MypageService;


	//회원정보 수정
	
	@Service
	public class MypageServiceImpl implements MypageService{
		
		@Autowired ServletContext context;
		@Autowired MypageDao mypageDao;
		@Autowired MemberDao memberDao;
	
		public void userUpdate(Member member) {
			
			mypageDao.userUpdate(member);
			
		}
		
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//프로필사진
	
	@Override
	public void insertProfile(Member member, MultipartFile file) {

	//첨부파일 처리
		
	//빈 파일일 경우
	if( file.getSize() <= 0 ) {
		return;
	}
	
	
	try {
		//파일이 저장될 경로
		String storedPath = context.getRealPath("resources");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
			
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		System.out.println("originName {}"+ originName);
		String storedName = "";
		//String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		// 랜덤문자열이 붙는 위치 오류로 위치 다시 설정
		
		// 파일명에서 가장 마지막에 오는 '.'의 index 확인
        int index = originName.lastIndexOf(".");
 
        // 확장자 추출
        if (index > 0) {
 
            // 파일이름에서 '.' 이후의 문자열이 확장자가 된다.
            String extension = originName.substring(index + 1);
            // 파일이름에서 '.' 이전의 문자열은 원본 파일명
            String name = originName.substring(0, index);
 
            // 새로운 파일명 지정 	
            // 원본파일명+.+랜덤문자열+확장자
            storedName = name.concat(UUID.randomUUID().toString().split("-")[4]).concat(".").concat(extension);
        }
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		file.transferTo(dest);
		
		//첨부파일 정보 DB 기록
		FileUpload fileuUload = new FileUpload();
		//fileuUload.setFileUploadNo( member.getMemberNo() );
		fileuUload.setMemberNo(member.getMemberNo());
		fileuUload.setFileUploadOri(originName);
		fileuUload.setFileUploadStor(storedName);
		
		FileUpload picture =  mypageDao.selectProfile(member.getMemberNo());
		
		// 이미 프로필 사진이 있다면 업데이트
		if(picture != null) {
			mypageDao.updateProfile(fileuUload);
		}else {
			mypageDao.insertProfile(fileuUload);
		}
		
	} catch (IllegalStateException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}
	
	//--------------------------------------------
	
	
	}


	//회원탈퇴
	@Override
	public void withdrawal(Member member) {
		mypageDao.withdrawal(member);

	}
	

	//회원탈퇴 시 비밀번호 체크
	@Override
	public int passCheck(Member member) {
		int result = mypageDao.checkPw(member);

		return result;
	}


	//프로필사진 조회
	@Override
	public FileUpload selectProfile(int memberNo) {
		return mypageDao.selectProfile(memberNo);
	}


	//프로필사진 변경
	@Override
	public void updateProfile(FileUpload file) {
		mypageDao.updateProfile(file);
		
	}


	//예약내역 조회
	@Override
	public List<HashMap<String, Object>> reservationlist(String id) {
		return mypageDao.reservationlist(id);
	}

	
	//쪽지함 조회
	@Override
	public List<HashMap<String, Object>> messagelist(String id) {
		return mypageDao.messagelist(id);
	}


	
	
	
	//----- 마이스터디 -----
	
	//나의 멘토
	@Override
	public List<HashMap<String, Object>> mymento(String id) {
		return mypageDao.mystudy(id);
	}
	
	//나의 스터디
	@Override
	public List<HashMap<String, Object>> mystudy(String id) {
		return mypageDao.mystudy(id);
	}

	
	//--- 좋아요리스트 ---

	//번개게시판 좋아요
	@Override
	public List<HashMap<String, Object>> mboard(String id) {

		return mypageDao.likelist(id);
	}


	//멘티게시판 좋아요
	@Override
	public List<HashMap<String, Object>> mntboard(String id) {

		return mypageDao.likelist(id);
	}


	//------- 위시리스트 -------
	
	//찜한 스터디
	@Override
	public List<HashMap<String, Object>> studyWish(int memberNo) {
		return mypageDao.studyWish(memberNo);
	}


	//찜한 멘토
	@Override
	public List<HashMap<String, Object>> mentoWish(int memberNo) {
		return mypageDao.mentorWish(memberNo);

	}


	//찜한 스터디룸
	@Override
	public List<HashMap<String, Object>> studyroomWish(int memberNo) {
		return mypageDao.studyroomWish(memberNo);

	}


	@Override
	public List<HashMap<String, Object>> studywish(String id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<HashMap<String, Object>> mentowish(String id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<HashMap<String, Object>> sroomwish(String id) {
		// TODO Auto-generated method stub
		return null;
	}




}
