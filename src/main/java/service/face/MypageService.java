package service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import dto.FileUpload;
import dto.Member;
import dto.Reservation;

public interface MypageService {
	
	/**
	 * 회원정보 수정
	 * 
	 * @param member
	 */
	public void userUpdate(Member member);

	
	/**
	 * 프로필사진
	 * 
	 * @param member
	 * @param file
	 */
	public void insertProfile(Member member, MultipartFile file);

	
	/**
	 * 회원탈퇴
	 * 
	 * @param member
	 * @param session
	 */
	public void withdrawal(Member member);


	/**
	 * 비밀번호확인
	 * 
	 * @param member
	 * @return
	 */
	public int passCheck(Member member);
	
	
	/**
	 * 프로필사진 출력
	 * 
	 * @param memberNo
	 * @return
	 */
	public FileUpload selectProfile(int memberNo);
	
	
	/**
	 * 프로필사진 변경
	 * 
	 * @param file
	 */
	public void updateProfile(FileUpload file);

	
	/**
	 * 예약목록
	 * 
	 * @param id
	 * @return
	 */
	public List<HashMap<String, Object>> reservationlist(String id);
	
	
	/**
	 * 쪽지함
	 * 
	 * @param id
	 * @return
	 */
	public List<HashMap<String, Object>> messagelist(String id);


	//--- 위시리스트 ---
	
	/**
	 * 찜한 스터디
	 * 
	 * @param id
	 * @return
	 */
	public List<HashMap<String, Object>> studywish(String id);


	/**
	 * 찜한 멘토
	 * 
	 * @param id
	 * @return
	 */
	public List<HashMap<String, Object>> mentowish(String id);


	/**
	 * 찜한 스터디룸
	 * 
	 * @param id
	 * @return
	 */
	public List<HashMap<String, Object>> sroomwish(String id);

	
	
	//---- 마이스터디 ----
	
	/**
	 * 나의 멘토
	 * 
	 * @param id
	 * @return
	 */
	public List<HashMap<String, Object>> mymento(String id);
	
	/**
	 * 나의 스터디
	 * 
	 * @param id
	 * @return
	 */
	public List<HashMap<String, Object>> mystudy(String id);
	
	
	
	//--- 좋아요리스트 ---
	
	/**
	 * 번개개시판 좋아요 리스트 
	 * 
	 * @param id
	 * @return
	 */
	public List<HashMap<String, Object>> mboard(String id);

	
	/**
	 * 멘티게시판 좋아요 리스트
	 * 
	 * @param id
	 * @return
	 */
	public List<HashMap<String, Object>> mntboard(String id);

	

	
	
}
