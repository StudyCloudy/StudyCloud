package service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.face.SboardDao;
import dto.ApplyStudy;
import dto.Commt;
import dto.StudyBoard;
import dto.StudyMark;
import service.face.SboardService;
import util.Paging;

@Service
public class SboardServiceImpl implements SboardService{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SboardDao sboardDao;
	
	@Autowired ServletContext context;

	@Override
	public Paging getPaging(int curPage) {
		
		//총 게시글 수 조회
		int totalCount = sboardDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectSboardHash(Paging paging) {
		return sboardDao.selectSboardHash(paging);
	}

	@Override
	public HashMap<String, Object> detail(int studyNo) {
		
		return sboardDao.detailPageBySboardNo(studyNo);
	}

	@Override
	public void enroll(StudyBoard sboard) {
		
		//게시글 처리
		if("".equals( sboard.getStudyTitle())) {
			sboard.setStudyTitle("(제목없음)");
		}
				
		sboardDao.enroll(sboard);
				
	}
	
	@Override
	public HashMap<String, Object> updateDetail(StudyBoard sboard) {
		
		return sboardDao.getDetailByStudyNo(sboard);
	}

	@Override
	public void update(StudyBoard sboard) {
		//게시글 처리
		if("".equals( sboard.getStudyTitle())) {
			sboard.setStudyTitle("(제목없음)");
		}
		
		sboardDao.update(sboard);
		
	}

	@Override
	public void delete(StudyBoard sboard) {
		
		//게시글 삭제
		sboardDao.delete(sboard);
		
	}
	
	//-------------------------------------------------------------------

	@Override
	public ArrayList<HashMap<String, Object>> sboardcmt(int studyNo) {
		
		return sboardDao.getsboardcmtmain(studyNo);
	}

	@Override
	public int getScmtcnt(int studyNo) {
		int cmtcnt = sboardDao.sboardcmtcnt(studyNo);
		return cmtcnt;
	}

	@Override
	public void sboardcmtcnt(int studyNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertcmmt(Commt commt) {
		
		sboardDao.insertcmt(commt);
		
		int commtNo = commt.getCommtNo();
		Commt insertcom = sboardDao.selectCmtByCommtNo(commtNo);
		
	}
	
	@Override
	public void deletecmt(int commtNo) {
		sboardDao.deletecmt(commtNo);
	}

	//----------------------------------------------------------------------
	
	
	//인원수 정렬
	@Override
	public Paging getPagingByPeopleNo(HashMap<String, Object> getPagingMap) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> SearchByPeople(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//태그 검색 
	@Override
	public Paging getSearchPaging(HashMap<String, Object> map) {
		
		int totalCount = sboardDao.cntSearchList(map);
		int curPage = (int)map.get("curPage");
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> getTagSearch(HashMap<String, Object> map) {
		
		return sboardDao.searchByTagList(map);
	}

	
	@Override
	public int insertMark(int studyNo ,int memberNo) {
		
		StudyMark studymark = new StudyMark();
		
		studymark.setMemberNo(memberNo);
		studymark.setStudyNo(studyNo);
		
		int markCnt = sboardDao.markcount(studymark);
		
		if ( markCnt == 0) {
			sboardDao.insertMark(studymark);
			markCnt = 1;
		} else {
			sboardDao.cancelMark(studymark);
			markCnt = 0;
		}
		
		return markCnt;
	}
	
	@Override
	public int getMark(int memberNo, int studyNo) {
		
		StudyMark studymark = new StudyMark();
		
		studymark.setMemberNo(memberNo);
		studymark.setStudyNo(studyNo);
		
		int markcnt = sboardDao.markcount(studymark);
		
		return markcnt;
	}

	@Override
	public void applystudy(ApplyStudy applystudy) {
						
		sboardDao.apply(applystudy);
		
	}

	@Override
	public List<HashMap<String, Object>> searchKeyword(HashMap<String, Object> param) {
		
		return sboardDao.searchByKeyword(param);
		
	}




	
	

	
	
	
	

	

}
