package dao.face;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dto.ApplyStudy;
import dto.Commt;
import dto.StudyBoard;
import dto.StudyMark;
import util.Paging;

public interface SboardDao {

	public int selectCntAll();

	public ArrayList<HashMap<String, Object>> selectSboardHash(Paging paging);

	public HashMap<String, Object> detailPageBySboardNo(int studyNo);

	//스터디 개설
	public void enroll(StudyBoard sboard);
	
	public HashMap<String, Object> getDetailByStudyNo(StudyBoard sboard);
	
	public void update(StudyBoard sboard);

	public void delete(StudyBoard sboard);

	public ArrayList<HashMap<String, Object>> getsboardcmtmain(int studyNo);

	public int sboardcmtcnt(int studyNo);

	public void insertcmt(Commt commt);

	public Commt selectCmtByCommtNo(int commtNo);

	public void deletecmt(int commtNo);

	//인원수 정렬
	public List<StudyBoard> selectSearchList(StudyBoard sboard);
	
	//태그 검색
	public int cntSearchList(HashMap<String, Object> map);

	public ArrayList<HashMap<String, Object>> searchByTagList(HashMap<String, Object> map);
	
//	public int cntTagSearch(HashMap<String, Object> map);
	
	public int markcount(StudyMark studymark);

	public void insertMark(StudyMark studymark);

	public void cancelMark(StudyMark studymark);

	//스터디 신청
	public void apply(ApplyStudy applystudy);






}
