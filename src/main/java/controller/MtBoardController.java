package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.ApplyMnt;
import dto.ApplyMt;
import dto.FileUpload;
import dto.Member;
import dto.MtBoard;
import dto.MtMark;
import dto.MtReview;
import service.face.MemberService;
import service.face.MtBoardService;
import util.CommtPaging;
import util.PagingVUp;

@Controller
@RequestMapping("/mtboard")
public class MtBoardController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired MtBoardService mtBoardService;
	@Autowired ServletContext context;
	@Autowired MemberService memberService;

	@RequestMapping("/list")
	public void mtBoardList(@RequestParam(defaultValue = "1") int curPage, Model model, HttpServletRequest req) {


		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("loginid");

		Member member = memberService.getMemberById(id);
		model.addAttribute("authority", id == null ? 0 : member.getAuthority());
		
		
		Map<String, Object> map = new HashMap<>();

		PagingVUp paging = mtBoardService.getPaging(map, curPage);
		model.addAttribute("paging", paging);
		logger.debug("paging : {} ", paging);

		List<HashMap<String, Object>> list = mtBoardService.list(paging);
		for (HashMap<String, Object> b : list)
			logger.debug("{}", b);
		model.addAttribute("mtBoardlist", list);
	}

	@RequestMapping("/listPaging")
	public void mtBoardListPaging(@RequestParam Map<String, Object> map, Model model, HttpServletRequest req ) {
		
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("loginid");

		Member member = memberService.getMemberById(id);
		model.addAttribute("authority", id == null ? 0 : member.getAuthority());
		
		int curPage = Integer.parseInt(map.get("curPage").toString());
		PagingVUp paging = mtBoardService.getPaging(map, curPage);
		model.addAttribute("paging", paging);

		map.put("startNo", paging.getStartNo());
		map.put("endNo", paging.getEndNo());
		map.put("paging", paging);

		logger.info("map - {} ", map);

		List<HashMap<String, Object>> list = mtBoardService.list(map);
		model.addAttribute("mtBoardlist", list);
		logger.info("list - {} ", list);

	}

	@RequestMapping("/detail")
	public void view(@RequestParam(defaultValue = "1") int curPage, Model model, HttpServletRequest req,
			@RequestParam(required = true) int mtboardNo) {

		logger.info("mtboardNo : {}", mtboardNo);
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("loginid");

		Member member = memberService.getMemberById(id);
		
		// 글조회
		HashMap<String, Object> mtViewBoard = mtBoardService.view(mtboardNo);
		/* logger.info("조회된 게시글 {}", mtViewBoard); */

		model.addAttribute("mtViewBoard", mtViewBoard);

		// 첨부파일
		FileUpload fileUpload = mtBoardService.getAttachFile(mtboardNo);
		model.addAttribute("fileUpload", fileUpload);
		logger.info("fileUpload : {}", fileUpload);


		// ----------- 찜하기 -----------

		MtMark mtMark = new MtMark();
		// 찜하기 모델값
		model.addAttribute("mark", mtBoardService.mark(mtMark));
		// 찜하기 수 모델값
		model.addAttribute("likeMark", mtBoardService.getTotalCntMark(mtMark));
		

		// 리뷰
		// 리뷰 작성 권한체크 
		boolean isBuyer = false;
		if(id != null) {
			Map<String, Object> reviewAuthMap = new HashMap<String, Object>();
			reviewAuthMap.put("mtboardNo", mtboardNo);
			reviewAuthMap.put("memberNo", member.getMemberNo());
				
			int result = mtBoardService.isBuyer(reviewAuthMap);
					
			logger.info("result :", result);
			isBuyer = mtBoardService.isBuyer(reviewAuthMap) > 0;
		
		}
		
		
		model.addAttribute("isBuyer", isBuyer );
		model.addAttribute("loginNo", id == null? null : member.getMemberNo());
		// 리뷰 리스트 
		List<HashMap<String, Object>> reviewList = mtBoardService.getReviewList(mtboardNo);
		model.addAttribute("reviewList", reviewList);
		logger.info("reviewList {}", reviewList);
		
		int CntReview = mtBoardService.getCntReview(mtboardNo);
		logger.info("!!!!!!!!!리뷰 개수!!!!!!!!! : {}", CntReview);
		model.addAttribute("CntReview", CntReview);
		mtBoardService.mtBoardReview(mtboardNo);
		
	
	}

	
	
	@GetMapping("/write")
	public void write(HttpSession session) {
		
		int memberNo = (int) session.getAttribute("member_no");
		String memberNick = mtBoardService.getMemNick(memberNo);
		String loginid = mtBoardService.getMemId(memberNo);
		session.setAttribute("member_nick", memberNick);
		session.setAttribute("login_id", loginid);
	}

	@PostMapping("/write")
	public String writePost(MtBoard mtBoard, MultipartFile file, HttpSession session, Model model) {
		logger.debug("{}", mtBoard);
		logger.debug("{}", file);

		mtBoard.setMemberNo((int) session.getAttribute("member_no"));
		System.out.println("로그인 : " + session.getAttribute("member_no"));
		logger.debug("{}", mtBoard);
		logger.debug("파일 : {}", file);
		
		
		// 게시글, 첨부파일
		mtBoardService.write(mtBoard, file);

		return "redirect:/mtboard/list";

	}

	@RequestMapping("/download")
	public String download(FileUpload fileUpload, Model model) {

		fileUpload = mtBoardService.getFile(fileUpload);
		logger.debug("{}", fileUpload);

		model.addAttribute("downFile", fileUpload);

		return "down";

	}

	@GetMapping("/update")
	public void update(@RequestParam(required = true) int mtboardNo, Model model) {
		logger.debug("{}", mtboardNo);

		HashMap<String, Object> mtViewBoard = mtBoardService.view(mtboardNo);
		logger.debug("업데이트할 게시글 조회 {}", mtViewBoard);

		model.addAttribute("updateBoard", mtViewBoard);

		FileUpload fileUpload = mtBoardService.getAttachFile(mtboardNo);
		model.addAttribute("fileUpload", fileUpload);

	}

	@PostMapping("/update")
	public String updatePost(MtBoard mtBoard, MultipartFile file) {
		logger.debug("{}", mtBoard);

		mtBoardService.update(mtBoard, file);

		return "redirect:/mtboard/detail?mtboardNo=" + mtBoard.getMtboardNo();
	}

	@RequestMapping("/delete")
	public String delete(MtBoard mtBoard) {

		mtBoardService.delete(mtBoard);

		return "redirect:/mtboard/list";

	}

	// ------------------------ 찜하기 ---------------------
	@RequestMapping("/mark")
	public ModelAndView Mark(MtMark mtMark, ModelAndView mav, HttpServletRequest req) {

		
		// 찜하기 하트
		HttpSession session = req.getSession();
		mtMark.setMemberNo((int) session.getAttribute("member_no"));

		boolean result = mtBoardService.mtboardMark(mtMark);

		// 찜하기 수 조회
		int markCnt = mtBoardService.getTotalCntMark(mtMark);

		mav.addObject("result", result);
		mav.addObject("markCnt", markCnt);

		mav.setViewName("jsonView");

		return mav;

	}

	// ------------------------ 검색 --------------------------

	@PostMapping("/search")
	public String mtSearch(Model model, @RequestParam(value = "searcharr[]") List<String> searcharr,
			String searchKeyword, @RequestParam(defaultValue = "1") int curPage) {

		logger.info("searcharr : {}", searcharr);
		logger.info("searchKeyword : {}", searchKeyword);

		HashMap<String, Object> map = new HashMap<>();
		map.put("list", searcharr); // 체크박스 값 담긴 List
		map.put("keyword", searchKeyword); // 검색 키워드
		map.put("curPage", curPage); // 페이징처리를 위한 현재페이지

		CommtPaging paging = mtBoardService.getSearchPaging(map);

		List<HashMap<String, Object>> list = mtBoardService.getSearchList(map);
		model.addAttribute("paging", paging);

		map.get("searchKeyword");
		logger.info("검색 결과 : {} ", list);
		model.addAttribute("mtSearchList", list);
		model.addAttribute("Keyword", list);

		return "/mtboard/searchPaging";
	}

	// ---------------------- 멘토지원---------------------------

	@RequestMapping("/mentoApply")
	public void mentoApply() {}

	
	
	@GetMapping("/applyMt")
	public void applyMt(HttpServletRequest req, Model model) {
		
		HttpSession session = req.getSession();
		int memberNo = (int) session.getAttribute("member_no");

		String loginid = mtBoardService.getMemId(memberNo);
		String memberEmail = mtBoardService.getMemEmail(memberNo);
		String memberName = mtBoardService.getMemName(memberNo);
		String memberPhone = mtBoardService.getMemPhone(memberNo);

		model.addAttribute("login_id", loginid);
		model.addAttribute("member_email", memberEmail);
		model.addAttribute("member_name", memberName);
		model.addAttribute("member_phone", memberPhone);

	}

	@PostMapping("/applyMt")
	@ResponseBody
	public String applyMtPost(ApplyMt applyMt, HttpServletRequest req, HttpSession session) {
	      logger.debug("{}", applyMt);

	   
	      int member_no = (int) session.getAttribute("member_no");
	      applyMt.setMemberNo(member_no);
	         
	      mtBoardService.applyMt(applyMt);
	         
	      return "success";

	   }

	// ------------------------- 멘토링 신청 ----------------------------

	@RequestMapping("/applyMnt")
	public void applyMntPage(HttpServletRequest req, Model model
							, @RequestParam(required = true) int mtboardNo) {

		// 세션에서 아이디 가져오기
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("loginid");

		Member member = memberService.getMemberById(id);

		model.addAttribute("email", member.getMemberEmail());
		model.addAttribute("phone", member.getMemberPhone());
		model.addAttribute("name", member.getMemberName());
		model.addAttribute("mtboardNo", mtboardNo);

	}

	@PostMapping("/applyMnt")
	public String applyMnt(HttpServletRequest req, ApplyMnt applymnt,  Model model) {

		try {
			// 세션에서 아이디 가져오기
			HttpSession session = req.getSession();
			String id = (String) session.getAttribute("loginid");

			Member member = memberService.getMemberById(id);
			
			model.addAttribute("email", member.getMemberEmail());
			model.addAttribute("phone", member.getMemberPhone());
			model.addAttribute("name", member.getMemberName());

			applymnt.setMemberNo(member.getMemberNo());
			HashMap<String, Object> viewMap = mtBoardService.view(applymnt.getMtboardNo());		
			HashMap<String, Object> infoMap = new HashMap<>();
			
			int st = getHour(applymnt.getStTime());
			int ed = getHour(applymnt.getEdTime());
			int time = 0;
			
			if(st > 1 && ed > 1) {
				time = ed-st;
			}
			
			int price = Integer.parseInt(viewMap.get("MT_PRICE").toString());
			int fee = price*time;
			
			infoMap.put("time", time);
			infoMap.put("mentorId", viewMap.get("MEMBER_ID"));
			infoMap.put("price", price);
			infoMap.put("fee", fee);
			
			model.addAttribute("applymnt", applymnt);
			model.addAttribute("info", infoMap);
			
			return "/mtboard/pay_info";
		} catch (Exception e) {
			e.printStackTrace();
			return "/mtboard/applyMnt";
		}

	}

	@RequestMapping("/payMnt")
	@ResponseBody
	public String pay(HttpServletRequest req, @RequestParam Map<String, Object> pay) {
		try {
			
			// 세션에서 아이디 가져오기
			HttpSession session = req.getSession();
			String id = (String) session.getAttribute("loginid");

			Member member = memberService.getMemberById(id);
			logger.info("member : {}", member);
			logger.info("map : {}", pay);
			pay.put("memberNo", member.getMemberNo());
			
			mtBoardService.applyMnt(pay);
			
			
			return "success";
		}catch(Exception e) {
			e.printStackTrace();
			return "failed";
		}
		
	}

	
	
	private int getHour(String time) {
		if(time.contains(":")) {
			String hour = time.split(":")[0];
			return Integer.parseInt(hour);
		}else {
			return 0;
		}
		
	}
	
	
	// ------------- 리뷰 ------------------
	
	
	
	@PostMapping("/writeReview")
	public String MtReviewPost( Model model, String reviewContents
							, int reviewStar, int mtboardNo
							, HttpSession session ) {
		
		String id = (String) session.getAttribute("loginid");

		Member member = memberService.getMemberById(id);
		
		logger.info("reviewContents {}", reviewContents);
		logger.info("reviewStar {}", reviewStar);
		logger.info("mtboardNo {}", mtboardNo);
		
		MtReview review = new MtReview();
		review.setMemberNo(member.getMemberNo());
		review.setMtboardNo(mtboardNo);
		review.setMtreviewContent(reviewContents);
		review.setMtreviewScore(reviewStar);
		
		mtBoardService.writeReview(review);
		
		
		
		return "redirect:/mtboard/detail?mtboardNo="+mtboardNo;
	}
	
	
	
	
		@PostMapping("/updateReview")
		public String MtReviewUpdate( Model model, String reviewContents
								, int reviewStar, int mtboardNo, int no
								, HttpSession session ) {
			
			String id = (String) session.getAttribute("loginid");

			Member member = memberService.getMemberById(id);
			
			logger.info("reviewContents {}", reviewContents);
			logger.info("reviewStar {}", reviewStar);
			logger.info("mtboardNo {}", mtboardNo);
			logger.info("no {}", mtboardNo);
			
			 MtReview review = new MtReview(); review.setMemberNo(member.getMemberNo());
			 review.setMtboardNo(mtboardNo); review.setMtreviewContent(reviewContents);
			 review.setMtreviewScore(reviewStar);
			 review.setMtreviewNo(no);
			 
			mtBoardService.updateReview(review);
			
			return "redirect:/mtboard/detail?mtboardNo="+mtboardNo;
		}
			
		
		@RequestMapping("/deleteReview")
		public String deleteReview(@RequestParam(required = true) int reviewNo, @RequestParam(required = true) int mtboardNo, HttpServletRequest req) {

			// 세션에서 아이디 가져오기
			HttpSession session = req.getSession();
			String id = (String) session.getAttribute("loginid");

			Member member = memberService.getMemberById(id);
			
			
			Map<String, Object> map = new HashMap<>();
			map.put("memberNo", member.getMemberNo());
			map.put("reviewNo", reviewNo);
			
			int result = mtBoardService.iswrite(map);
			
			if(result>0) {
				mtBoardService.deleteReview(reviewNo);
			}
			
			return "redirect:/mtboard/detail?mtboardNo="+mtboardNo;


		}
	
	
}







