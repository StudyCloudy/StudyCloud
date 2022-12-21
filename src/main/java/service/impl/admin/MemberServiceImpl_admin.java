package service.impl.admin;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.face.admin.MemberDao_admin;
import dto.Member;
import service.face.admin.MemberService_admin;
import util.Paging;
import util.PagingVUp;

@Service
public class MemberServiceImpl_admin implements MemberService_admin {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MemberDao_admin memberDao_admin;

	@Override
	public PagingVUp getPaging(int curPage) {
		
		//총 게시글 수 조회;
		int totalCount = memberDao_admin.selectCntAll();
		
		//페이징 계산
		PagingVUp paging = new PagingVUp(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<Member> list(PagingVUp paging) {
		return memberDao_admin.selectList(paging);
	}

	//로그인
	@Override
	public String loginMember(Member member) {
		return memberDao_admin.login(member);
	}
	
	@Override
	public Member memberInfo(Member member) {
		return memberDao_admin.getMemberById(member.getMemberId());
	}

	
	//검색 기능
	@Override
	public List<HashMap<String, Object>> searchMember(HashMap<String,Object> param) {
		return memberDao_admin.searchMember(param);
	}


}
