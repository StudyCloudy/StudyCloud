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

import dto.Commt;
import dto.FileUpload;
import dto.Member;
import dto.MntBoard;
import dto.MntBoardLike;
import service.face.MemberService;
import service.face.MntBoardService;
import util.CommtPaging;
import util.PagingVUp;

@Controller
@RequestMapping("/mntboard")
public class MntBoardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MntBoardService mntBoardService;
	@Autowired ServletContext context;
	@Autowired MemberService memberService;
	
	
	@RequestMapping("/list")
	public void mntBoardList(
			@RequestParam(defaultValue = "1") int curPage, HttpSession session
			, Model model ) { 
		
		
		Map<String, Object> map = new HashMap<>();
		PagingVUp paging = mntBoardService.getPaging(map, curPage);
		model.addAttribute("paging", paging);  
		logger.info("paging : {}", paging);
		
		List<HashMap<String,Object>> list = mntBoardService.list(paging); 
		for( HashMap<String, Object> b : list ) logger.debug("{}", b);
		model.addAttribute("mntBoardlist", list);
		
		
	} 
	
	@RequestMapping("/listPaging")	
	public void mntBoardListPaging(@RequestParam Map<String, Object> map, Model model ) { 
		
	
		
		int curPage = Integer.parseInt(map.get("curPage").toString()); 
		PagingVUp paging = mntBoardService.getPaging(map, curPage);
		model.addAttribute("paging", paging);  
		
		map.put("startNo",paging.getStartNo());
		map.put("endNo",paging.getEndNo());
		map.put("paging",paging);
		
		
		logger.info("map - {} ", map);
		
		List<HashMap<String,Object>> list = mntBoardService.list(map);
		model.addAttribute("mntBoardlist", list);
		logger.info("list - {} ", list);
	} 
	
	
	@RequestMapping("/view")
	public void view (HttpServletRequest req, Model model,
			@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(required = true) int mntboardNo) {
		/* logger.info("/mntboard/view - {} ", viewBoard); */
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("loginid");
		
		Member member = memberService.getMemberById(id);
		
		// 글조회
		HashMap<String, Object> mntViewBoard = mntBoardService.view(mntboardNo);
		/* logger.info("조회된 게시글 {}", mntViewBoard); */
		logger.info("mntViewBoard : {}" , mntViewBoard);
		model.addAttribute("mntViewBoard", mntViewBoard);
		
		
		// 첨부파일
		FileUpload fileUpload = mntBoardService.getAttachFile(mntboardNo);
		model.addAttribute("fileUpload", fileUpload);
		logger.info("fileUpload : {}" , fileUpload);
		
	// -------------------------------------------------------------------------------
		

		CommtPaging commtPaging = mntBoardService.getCommtPaging(curPage, mntboardNo);
		model.addAttribute("commtPaging", commtPaging);
		 logger.debug(" commtPaging : {}", commtPaging);
		 
		List<HashMap<String,Object>> commtList = mntBoardService.commtList(commtPaging, mntboardNo);
		for( HashMap<String, Object> c : commtList )	logger.debug(" c : {}", c);
		logger.info("조회된 댓글 {}", commtList);
		model.addAttribute("commtList", commtList);
		
		
		// ----------- 좋아요 -----------
		
		MntBoardLike mntboardLike = new MntBoardLike();
		// 좋아요 모델값 
		model.addAttribute("like", mntBoardService.like(mntboardLike));
		// 좋아요 수 모델값
		model.addAttribute("likeCnt", mntBoardService.getTotalCntLike(mntboardLike));
		
		model.addAttribute("loginNo", id == null? null : member.getMemberNo());
		
	}
	
	
	@GetMapping("/write")
	public void write(HttpSession session) {
		int memberNo = (int)session.getAttribute("member_no");
		String memberNick = mntBoardService.getMemNick(memberNo);
		session.setAttribute("member_nick", memberNick);
		
	}
	
	
	@PostMapping("/write")
	public String writePost(MntBoard mntBoard, MultipartFile file, HttpSession session) {
		logger.debug("{}", mntBoard);
		logger.debug("{}", file);
		
		mntBoard.setMemberNo( (int)session.getAttribute("member_no") );
		logger.debug("{}", mntBoard);
		logger.debug("{}", file);
		
		// 게시글, 첨부파일
		mntBoardService.write(mntBoard, file);
		
		return "redirect:/mntboard/list";
		
	}
	
	@RequestMapping("/download")
	public String download(FileUpload fileUpload, Model model) {
		
		fileUpload = mntBoardService.getFile(fileUpload);
		logger.debug("{}", fileUpload);
		
		model.addAttribute("downFile", fileUpload);
		
		return "down";
		
	}
	
	
	@GetMapping("/update")
	public void update( @RequestParam(required = true) int mntboardNo, Model model) {
		logger.debug("{}", mntboardNo);
		
		HashMap<String, Object> mntViewBoard = mntBoardService.view(mntboardNo);
		logger.debug("업데이트할 게시글 조회 {}", mntViewBoard);
		
		model.addAttribute("updateBoard", mntViewBoard);
	
		FileUpload fileUpload = mntBoardService.getAttachFile(mntboardNo);
		model.addAttribute("fileUpload", fileUpload);
		
	}
	
	
	 @PostMapping("/update") 
	 public String updatePost(MntBoard mntBoard, MultipartFile file, HttpSession session) { 
		 logger.debug("{}", mntBoard);
	  
		 mntBoardService.update(mntBoard, file);
	  
		 return "redirect:/mntboard/view?mntboardNo=" + mntBoard.getMntboardNo();
	  }
	 
	 
	 
	 @RequestMapping("/delete")
	 public String delete(MntBoard mntBoard) {
		 
		 mntBoardService.delete(mntBoard);
		 
		return "redirect:/mntboard/list";
		 
	 }
	 
	 // ---------------- 댓글 -------------------
	 
	 
	 @RequestMapping("/commtPage")
		public void commtListPaging(int curPage, Model model, int mntboardNo ) {
			logger.info("댓글  게시글 {}", mntboardNo);
			logger.info("curpage - {} ", curPage);
			
			CommtPaging commtPaging = mntBoardService.getCommtPaging(curPage, mntboardNo);
			model.addAttribute("commtPaging", commtPaging);
			
			List<HashMap<String,Object>> commtList = mntBoardService.commtList(commtPaging, mntboardNo);
			logger.info("조회된 댓글 {}", commtList);
			model.addAttribute("commtList", commtList);
			
			// 댓글 수
			int CntCommt = mntBoardService.getCntCommt(mntboardNo);
			logger.info("!!!!!!!!!댓글 개수!!!!!!!!! : {}", CntCommt);
			model.addAttribute("CntCommt", CntCommt);
			
			mntBoardService.mntBoardCmt(mntboardNo);
		
			
		}
	 
	 // 댓글 등록
	  @PostMapping("/writeCommt")
	  @ResponseBody
	  public String CommtWrite( @RequestParam Map<String, Object> map, HttpServletRequest req) {
		  
		  try {
			  HttpSession session = req.getSession();
			  String no = session.getAttribute("member_no").toString();
			  int memberNo = Integer.parseInt(no);
			  
			  logger.info("글번호 : {}", map.get("mntboard_no"));
			  logger.info("회원번호 : {} ", memberNo);
			  logger.info("댓글내용 : {}", map);
			  
			  Commt commt = new Commt();
			  commt.setMntBoardNo(Integer.parseInt(map.get("mntboard_no").toString()));
			  commt.setCommtContent(map.get("commt_content").toString());
			  commt.setMemberNo(memberNo);
			  
			  mntBoardService.writeCommt(commt);
			  
			  return "success";
		  } catch (Exception e) {
			  return "failed";
		}
	  }
	 
	  
	  @PostMapping("/updateCommt")
	  @ResponseBody
	  public String updateCommt(@RequestParam Map<String, Object> map,  HttpServletRequest req) {
		  try {
			  HttpSession session = req.getSession();
			  String no = session.getAttribute("member_no").toString();
			  int memberNo = Integer.parseInt(no);
			
			  logger.info("전송 완");
			  logger.info("댓글내용 : {}", map);
			  logger.info("멤버번호 : {}", memberNo);
			  
			  
			  Commt commt = new Commt();
			  commt.setCommtNo(Integer.parseInt(map.get("commt_no").toString()));
			  commt.setCommtContent(map.get("commt_content").toString());
			  commt.setMemberNo(memberNo);
			
	      	  mntBoardService.updateCommt(commt);
				
			 return "success";
		  }catch(Exception e) {
			  return "failed";
		  }
			
	  }
	  
	  
	  @GetMapping("/deleteCommt")
	  @ResponseBody
		public String deleteCommt(@RequestParam int commtNo) {
			try {
				logger.info("댓번호 : {}", commtNo);
				mntBoardService.deleteCommt(commtNo);
				return "success";
			
			}catch(Exception e) {
				return "failed";
			}
		}
	  
	 
	  // ------------------------ 좋아요 ---------------------
	  @RequestMapping("/like")
	  public ModelAndView Like(MntBoardLike mntboardLike, ModelAndView mav, HttpServletRequest req) {
		
		  // 좋아요 하트
		  HttpSession session = req.getSession();
		  mntboardLike.setMemberNo((int)session.getAttribute("member_no"));
		  
		  
		  boolean result = mntBoardService.mntboardLike(mntboardLike);
		  
		  // 좋아요 수 조회
		  int likeCnt = mntBoardService.getTotalCntLike(mntboardLike);
		  
		  mav.addObject("result", result);
		  mav.addObject("likeCnt", likeCnt);
		  
		  mav.setViewName("jsonView");
		  
		  
		  return mav;
		  
	  }
	  
	  
	  // ------------------------ 검색 --------------------------
	  
	    @PostMapping("/search")
		public String mntSearch(Model model, 
				@RequestParam(value="searcharr[]") List<String> searcharr
				, String searchKeyword, @RequestParam(defaultValue="1") int curPage) {
			
	    	logger.info("searcharr : {}", searcharr);
			logger.info("searchKeyword : {}", searchKeyword);
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("list", searcharr); // 체크박스 값 담긴 List
			map.put("keyword", searchKeyword); // 검색 키워드
			map.put("curPage", curPage); // 페이징처리를 위한 현재페이지
	    	
			CommtPaging paging = mntBoardService.getSearchPaging(map);
			
			
	    	List<HashMap<String, Object>> list = mntBoardService.getSearchList(map);
			model.addAttribute("paging", paging);
			
			map.get("searchKeyword");
			logger.info("검색 결과 : {} ", list);
			model.addAttribute("mntSearchList", list);
			model.addAttribute("Keyword", list);
			
			
			
	    	return "/mntboard/searchPaging";
		}
	  
	  
	  
	  
	  
	  
	  
	  
}








