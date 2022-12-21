package dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


import dto.FileUpload;
import dto.Member;
import dto.Reservation;

public interface MypageDao {
	


	/**
	 * 회원정보 수정
	 * 
	 * 
	 * @param member
	 */
	public void userUpdate(Member member);
	
	
	/**
	 * 프로필사진 변경
	 * 
	 * @param member
	 * @param imageList
	 * @param webPath
	 * @param folderPath
	 * @return
	 * @throws Exception
	 */
	public void insertProfile(FileUpload fileupload);


	public Object selectFileByMemberNo(Member member);


	/**
	 * 회원탈퇴
	 * 
	 * @param member
	 * @param session
	 */
	public void withdrawal(Member member);


	/**
	 * 비밀번호 확인
	 * 
	 * @param member
	 * @return
	 */
	public int checkPw(Member member);


	
	/**
	 * 프로필사진 보여주기
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
	 * 예약 목록 조회
	 * 
	 * @return
	 */
	public List<HashMap<String, Object>> reservationlist(String id);
	
	/**
	 * 쪽지함 조회
	 * 
	 * @param id
	 * @return
	 */
	public List<HashMap<String, Object>> messagelist(String id);
	
	
	/**
	 * 위시리스트 조회
	 * 
	 * @param id
	 * @return
	 */
	public List<HashMap<String, Object>> wishlist(String id);
	
	
	/**
	 * 마이스터디 조회
	 * 
	 * @param id
	 * @return
	 */
	public List<HashMap<String, Object>> mystudy(String id);
	
	
	/**
	 * 좋아요리스트 조회
	 * 
	 * @param id
	 * @return
	 */
	public List<HashMap<String, Object>> likelist(String id);


	
	
	
	
	


	
	


	



	

}
