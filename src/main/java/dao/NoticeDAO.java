package dao;

import java.util.List;

import dto.NoticeDTO;
import dto.PageDTO;
import dto.SearchDTO;

public interface NoticeDAO {
	// 게시글 갯수 카운트
	public int countMethod(SearchDTO sdto);

	// 게시글 리스트 불러오기
	public List<NoticeDTO> listMethod(PageDTO pdto, SearchDTO sdto);

	// 조회수 증가
	public void readCountMethod(int num);

	// num에 해당하는 상세페이지에 접속
	public NoticeDTO contentMethod(int num);

	// 스탭카운트 재조정
	public void reStepCountMethod(NoticeDTO ndto);

	// 게시글 저장
	public void saveMethod(NoticeDTO ndto);

	// 게시글 수정
	public void updateMethod(NoticeDTO ndto);

	// 게시글 삭제
	public void deleteMethod(int num);
}//end interface
