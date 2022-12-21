package controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.face.MemberDao;
import dao.face.MypageDao;
import dto.FileUpload;
import dto.Member;
import service.face.MemberService;
import service.face.MypageService;

@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired MypageService mypageService;
	@Autowired MemberService memberService;
	@Autowired MypageDao mypageDao;
	@Autowired MemberDao memberDao;
	
	@GetMapping("/mypage")
	public String mypage() {
		
		logger.info("/mypage [GET]성공");
		
		return "mypage/mypageMain";
	
	}
		
   
    // 회원 정보 수정 페이지
	
	@GetMapping("/mypage/edit")
	public String userUpdate(HttpSession session,  HttpServletRequest req, Model model) {
			logger.info("/edit [GET]성공");
			
			if(session.getAttribute("member_no") != null) {
				int member_no = (int)session.getAttribute("member_no");
//				System.out.println("??????????" );
				System.out.println("member_no {}"+ member_no);
				Member member = new Member();
				member.setMemberNo(member_no);
				
				member = memberService.memberInfoByNo(member);

				System.out.println("member "+ member);
				model.addAttribute("member", member);
				model.addAttribute("picture", mypageService.selectProfile(member_no) );
				
			}
			
			return "mypage/edit";
		
	}
    
	// 회원 정보 수정
	
	@PostMapping("/mypage/edit")
	public String userUpdate(Member member, HttpSession session, Model model, HttpServletRequest req, MultipartFile file) {

		if(session.getAttribute("member_no") != null && session.getAttribute("loginid") != null) {
			int member_no = (int) session.getAttribute("member_no");
			String id = session.getAttribute("loginid").toString(); 
			member.setMemberNo(member_no);
			logger.info("member : {}", member);
			
			if(member.getMemberPw() == null || member.getMemberPw() == "" || member.getMemberPw().isEmpty()) {
				Member dbMember = memberService.getMemberById(id);
				logger.info("dbMember : {}", dbMember);
				member.setMemberPw(dbMember.getMemberPw());
			}
		
			mypageService.userUpdate(member);

			//모델값 전달
			model.addAttribute("member", member);
			
			//첨부파일(프로필사진) 모델값 전달
			FileUpload fileUpload = memberService.getProfileMemberNo(member);
			model.addAttribute("fileUpload", fileUpload);
			
			//첨부파일 처리
			if(file != null && file.getSize() > 0) {
				mypageService.insertProfile(member, file);
			}
			
			return "redirect:/mypage/edit";
		}else {
			return "redirect:/login";
		}
		
	}

	
	// 비로그인 유저 접근 막기
	//회원탈퇴
	@RequestMapping(value="/withdrawal")
	public String withdrawal() {
		
	//	logger.info("/withdrawal [GET]성공");
		
	//	mypageService.withdrawal(member,session);

		return "mypage/withdrawal";
	}
	
	//비밀번호 확인
	@RequestMapping(value="/withdrawal", method=RequestMethod.POST) 
		@ResponseBody
		public String passCheck(@RequestParam Map<String, Object> map, HttpServletRequest req) {
		try {
			String pw = map.get("memberPw").toString();
			
			HttpSession session = req.getSession();
			
			Enumeration<String> attributes = session.getAttributeNames();
			while (attributes.hasMoreElements()) {
			    String attribute = (String) attributes.nextElement();
			    System.err.println(attribute+" : "+session.getAttribute(attribute));
			}
			
			int no = ((Integer) session.getAttribute("member_no")).intValue();
			Member member = new Member();
			member.setMemberNo(no);
			member.setMemberPw(pw);
			
			int result = mypageService.passCheck(member);
			
			if(result > 0) {
				mypageService.withdrawal(member);
			}else {
				return "disaccord";
			}
			
			return "success";
		
		}catch(Exception e) {
			e.printStackTrace();
			return "failed";
		}

	}

	
	
	// 쪽지함
	
	@RequestMapping("/message")
	public String message(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("loginid");
		List<HashMap<String, Object>> Message = mypageService.messagelist(id);
		model.addAttribute("list", Message);
		logger.info("message list {} :", Message);
		
		return "mypage/message";
	}
	

	//위시리스트
	
	@RequestMapping("/wishlist")
	public String wishlist(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("loginid");
		String id = (String) session.getAttribute("member_no");
		
		//찜한 스터디
		List<HashMap<String, Object>> studywish = mypageService.studywish(id);
		model.addAttribute("study", studywish);
		logger.info("study list {} :", studywish);
		
		//찜한 멘토
		List<HashMap<String, Object>> mentowish = mypageService.mentowish(id);
		model.addAttribute("mento", mentowish);
		logger.info("mento list {} :", mentowish);
		
		//찜한 스터디공간
		List<HashMap<String, Object>> sroomwish = mypageService.sroomwish(id);
		model.addAttribute("sroom", sroomwish);
		logger.info("sroom list {} :", sroomwish);
		
		
		return "mypage/wishlist";
	}
	
	
	//마이스터디
	
	@RequestMapping("/mystudy")
	public String mystudy(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("loginid");
		
		//나의 멘토
		List<HashMap<String, Object>> mymento = mypageService.mymento(id);
		model.addAttribute("mymento", mymento);
		logger.info("mymento list {} :", mymento);
		
		//나의 스터디
		List<HashMap<String, Object>> mystudy = mypageService.mystudy(id);
		model.addAttribute("mystudy", mystudy);
		logger.info("mystudy list {} :", mystudy);
		
		
		return "mypage/mystudy";
	
	}
	
	// 예약 목록

	@RequestMapping("/reservationlist")
	public String reservationlist(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("loginid");
		List<HashMap<String, Object>> Reservation = mypageService.reservationlist(id);
		model.addAttribute("list", Reservation);
		logger.info("reserve list {} :", Reservation);
		
		return "mypage/reservationlist";
	}

	
	//좋아요 목록
	
	@RequestMapping("/likelist")
	public String likelist(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("loginid");
		
		//번개게시판 좋아요
		List<HashMap<String, Object>> mboard = mypageService.mboard(id);
		model.addAttribute("mboard", mboard);
		logger.info("mboard list {} :", mboard);
		
		//멘티찾기게시판 좋아요
		List<HashMap<String, Object>> mntboard = mypageService.mntboard(id);
		model.addAttribute("mntboard", mntboard);
		logger.info("mntboard list {} :", mntboard);
		
		
		return "mypage/likelist";
	
	}
	

	
	@GetMapping("/mtbooklist")
	public String mtbooklist() {
		
		logger.info("/mtbooklist [GET]성공");
		
		return "mypage/mtbooklist";
	
	}

}
