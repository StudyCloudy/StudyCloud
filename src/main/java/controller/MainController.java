package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dto.FileUpload;
import dto.Member;
import dto.MtBoard;
import dto.StudyBoard;
import dto.StudyRoom;
import service.face.admin.SboardService_admin;
import service.face.admin.SroomService_admin;
import service.face.main.MtBoardService_main;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired MtBoardService_main mtBoardService_main;
	@Autowired SroomService_admin sRoomService_admin;
	@Autowired SboardService_admin sBoardService_admin;
	
	@RequestMapping("/mainpage")
	public void main(MtBoard mtBoard, StudyRoom studyroom, StudyBoard sboard, Member member
						, HttpSession session, FileUpload fileupload, MultipartFile file, Model model) {
		
		logger.info("/main [GET]");
		
		//로그인 세션
//		int memberNo = (int) session.getAttribute("member_no");
		session.setAttribute("member", member.getMemberNo());
		
		//인기멘토링
		List<Map<String, Object>> mtList = mtBoardService_main.mtListWithFile(mtBoard);
		
		logger.debug("mtList {} :", mtList);
		
		model.addAttribute("mtList", mtList);
		
		
		//마감임박 스터디
		List<HashMap<String, Object>> stList = sBoardService_admin.stList();
		
		logger.debug("stList {} : ", stList);
		
		model.addAttribute("stList", stList);
		

		//인기 스터디룸
		List<Map<String, Object>> srList = sRoomService_admin.srListWithFile(studyroom);
		
		logger.debug("srList : {}", srList);
		
		model.addAttribute("srList",srList);
		
		
		//멘토링 리뷰
		List<HashMap<String, Object>> mtReviewList = mtBoardService_main.mtReivewList(mtBoard);
		
		logger.debug("mtReviewList : {}", mtReviewList);
		
		model.addAttribute("mtReviewList", mtReviewList);
		
	}
	
}
