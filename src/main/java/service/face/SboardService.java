package service.face;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import dto.ApplyStudy;
import dto.Commt;
import dto.StudyBoard;
import util.Paging;

public interface SboardService {

	public Paging getPaging(int curPage);

	public ArrayList<HashMap<String, Object>> selectSboardHash(Paging paging);

	public HashMap<String, Object> detail(int studyNo);

	//스터디 개설
	public void enroll(StudyBoard sboard);
	
	public HashMap<String, Object> updateDetail(StudyBoard sboard);

	public void update(StudyBoard sboard);

	public void delete(StudyBoard sboard);

	public ArrayList<HashMap<String, Object>> sboardcmt(int studyNo);

	public int getScmtcnt(int studyNo);

	public void sboardcmtcnt(int studyNo);
	
	public void insertcmmt(Commt commt);

	public void deletecmt(int commtNo);

	//인원수 정렬 기능
	public Paging getPagingByPeopleNo(HashMap<String, Object> getPagingMap);
	
	public ArrayList<HashMap<String, Object>> SearchByPeople(HashMap<String, Object> map);
	
	
	//검색기능
	public Paging getSearchPaging(HashMap<String, Object> map);
	
	public ArrayList<HashMap<String, Object>> getTagSearch(HashMap<String, Object> map);
	

	//좋아요 기능
	public int insertMark(int studyNo, int memberNo);

	public int getMark(int memberNo, int studyNo);

	
	//스터디 신청
	public void applystudy(ApplyStudy applystudy);












}
