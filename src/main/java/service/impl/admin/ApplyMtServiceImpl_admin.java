package service.impl.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.face.admin.ApplyMtDao_admin;
import dto.ApplyMt;
import dto.Member;
import service.face.admin.ApplyMtService_admin;
import util.Paging;
import util.PagingVUp;

@Service
public class ApplyMtServiceImpl_admin implements ApplyMtService_admin {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired ApplyMtDao_admin applyMtDao_admin;
	
	//투데이 어플라이
	@Override
	public int todayApply(ApplyMt applyMt) {
		return applyMtDao_admin.todayCntApplyMt(applyMt);
	}

	@Override
	public PagingVUp getPaging(int curPage) {
		
		//총 게시글 수 조회
		int totalCount = applyMtDao_admin.selectCntAll();
		
		//페이징 계산
		PagingVUp paging = new PagingVUp(totalCount, curPage);
		
		return paging;
	}

	//멘토 등록 조회
	@Override
	public List<ApplyMt> list(PagingVUp paging) {
		return applyMtDao_admin.selectApplyList(paging);
	}

	//회원 등급 변경
	@Override
	public Member updateMember(Member member) {
		return applyMtDao_admin.updateApplyMember(member);
	}


	//	@Override
//	public Member view(Member member) {
//		
//		//상세보기 조회 결과 리턴
//		return applyMtDao_admin.selectApplyMt(member);
//	}



}
