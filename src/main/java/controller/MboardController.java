package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.FileUpload;
import dto.Mboard;
import dto.MboardLike;
import dto.Member;
import service.face.MboardService;
import service.face.SboardService;
import util.Paging;

@Controller
public class MboardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MboardService mboardService;
	
	@RequestMapping("/mboard/main")
	private void mboardmain(
			
			@RequestParam(defaultValue = "0") int curPage
			,Model model 
			
			) {
		
		Paging paging = mboardService.getPaging(curPage);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);
		
		List<HashMap<String, Object>> mlist = mboardService.selectMboardHash(paging);
		
		for( HashMap<String, Object> b : mlist ) 
			logger.debug("{}", b);
		
		model.addAttribute("mlist", mlist);
		
	}
	
	@RequestMapping("/mboard/detail")
	public void mboarddetail(
			
			Mboard mboard
			,Model model
//			,ModelAndView mav
			
			) {
		
		logger.debug("{}", mboard);
		
		//게시글 조회
		HashMap<String, Object > Mboarddetail= mboardService.detail(mboard);
		logger.debug("조회된 게시글 {}", Mboarddetail);
	
		//모델값 전달
		model.addAttribute("detailMboard", Mboarddetail);
		
		//첨부파일 모델값 전달
		FileUpload fileUpload = mboardService.getAttachFile(mboard);
//		List<HashMap<String, Object>> fileUpload = mboardService.getAttachFile(mboardNo);
		model.addAttribute("fileUpload", fileUpload);
		
		
		return;
		
	}
	
	@GetMapping("/mboard/write")
	public void write(HttpSession session) {
		
		int memberNo = (int)session.getAttribute("member_no");
	}
	
	@PostMapping("/mboard/write")
	public String writeProcess(
			
			Mboard mboard,
			MultipartFile file,
			HttpSession session
			
			) {
		
		logger.debug("{}", mboard);
		logger.debug("{}", file);

		mboard.setMemberNo((int) session.getAttribute("member_no"));
		logger.debug("{}", mboard);
		
		//게시글 첨부파일 처리
		mboardService.write(mboard, file);
		
		//번개게시판 메인으로 리다이렉트
		return "redirect:/mboard/main";
		
	}
	
	
	@GetMapping("/mboard/update")
	public void update(
			
			Mboard mboard
			,Model model
			
			) {
		
		logger.info("{}" , mboard);
		//게시글 조회
		HashMap<String, Object> mboardDetail = mboardService.detail(mboard);
		logger.debug("조회된 게시글 : {}" , mboardDetail);
		
		model.addAttribute("updateMboard", mboardDetail);
		
		//첨부파일 모델값 전달
		FileUpload fileupload = mboardService.getAttachFile(mboard);
		model.addAttribute("fileUpload", fileupload);
		
		
		
	}
	
	@PostMapping("/mboard/update")
	public String updateProcess(
			
			Mboard mboard
			,MultipartFile file
			,HttpSession session
			
			) {
		logger.debug("{}", mboard);
		
		mboardService.update(mboard, file);
		
		return "redirect:/mboard/detail?mBoardNo=" + mboard.getMBoardNo();
		
		
	}
	@RequestMapping("/mboard/download")
	public String download(
			
			FileUpload fileUpload
			, Model model
			
			) {
		logger.info("{}", fileUpload);
		
		//첨부파일 정보 객체
		fileUpload = mboardService.getFile(fileUpload);
		logger.info("fileUpload : {}", fileUpload);
		
		//모델값 전달
		model.addAttribute("downFile", fileUpload);
		
		return "down";
		
	}
	
	@RequestMapping("/mboard/delete")
	public String delete(
			
			Mboard mboard
			
			) {
		logger.debug("{}", mboard);
		
		mboardService.delete(mboard);
		
		return "redirect:/mboard/main";
		
	}
	
	//------------------------------------------------------------------------
	
	@RequestMapping("/mboard/mboardLike")
	public @ResponseBody int res (
			
			int mBoardNo
			,HttpSession session 
			
			) {
		//작성자 정보
		int memberNo = (int) session.getAttribute("member_no");
		
		int res = mboardService.insertLike(mBoardNo, memberNo);
		logger.info("{}", res);
		
		return res;
	}
	
	//-------------------------------------------------------------------------
	
	@GetMapping("/mboard/search")
	public String mboardSearch(
			
			@RequestParam HashMap<String, Object> param
			, Model model
			
			) {
		
		List<HashMap<String,Object>> searchResult = mboardService.searchKeyword(param);
		logger.debug("{}", searchResult);
		model.addAttribute("searchResult", searchResult);
		
		return "/mboard/mboardSearch";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
