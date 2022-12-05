package service.face;

import dto.Member;

public interface MemberService {
	
	/**
	 * 로그인 인증 처리
	 * 	
	 * @param member - 입력한 ID/PW 정보
	 * @return 로그인 인증 경과
	 */
	public boolean login(Member member);

	/**
	 * 회원의 이름 조회
	 * 
	 * @param member - 닉네임을 조회할 사용자의 정보
	 * @return 사용자의 이름
	 */
	public String getMemberNick(Member member);

	/**
	 * 신규 회원 가입
	 * 
	 * @param member - 신규 회원의 정보
	 * @return 회원가입 결과
	 */
	public boolean join(Member member);

	/**
	 * 아이디 찾기
	 * 
	 * @param memberEmail
	 * @return
	 */
	public String findid(String memberEmail);
	
	
	
	
}
	
	




