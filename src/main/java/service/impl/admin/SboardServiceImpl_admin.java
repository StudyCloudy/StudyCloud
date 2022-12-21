package service.impl.admin;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.face.admin.SboardDao_admin;
import dto.Member;
import dto.StudyBoard;
import service.face.admin.SboardService_admin;
import util.Paging;
import util.PagingVUp;

@Service
public class SboardServiceImpl_admin implements SboardService_admin {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SboardDao_admin sBoardDao_admin;

	//투데이 어플라이
	@Override
	public int todayApply(StudyBoard studyBoard) {
		return sBoardDao_admin.todayCntStudy(studyBoard);
	}

	@Override
	public PagingVUp getPaging(int curPage) {
		
		//총 게시글 수 조회
		int totalCount = sBoardDao_admin.selectCntAll();
		
		//페이징 계산
		PagingVUp paging = new PagingVUp(totalCount, curPage);
		
		return paging;
	}

	//스터디 등록 조회
	@Override
	public List<StudyBoard> list(PagingVUp paging) {
		return sBoardDao_admin.selectStudyList(paging);
	}

	@Override
	public Member updateMember(Member member) {
		return sBoardDao_admin.updateStudyMember(member);
	}

	
	//메인 페이지
	@Override
	public List<HashMap<String, Object>> stList() {
		return sBoardDao_admin.selectStList();
	}


}
