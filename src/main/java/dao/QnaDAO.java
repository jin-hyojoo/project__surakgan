package dao;

import java.util.List;

import dto.PageDTO;
import dto.QnaDTO;
import dto.SearchDTO;

public interface QnaDAO {
	// 게시글 갯수 카운트
	public int countMethod(SearchDTO sdto);

	// 게시글 리스트 불러오기
	public List<QnaDTO> listMethod(PageDTO pdto, SearchDTO sdto);

	// 조회수 증가
	public void readCountMethod(int num);

	// num에 해당하는 상세페이지에 접속
	public QnaDTO contentMethod(int num);

	// 스탭카운트 재조정
	public void reStepCountMethod(QnaDTO qdto);

	// 게시글 저장
	public void saveMethod(QnaDTO qdto);

	// 게시글 수정
	public void updateMethod(QnaDTO qdto);

	// 게시글 삭제
	public void deleteMethod(int num);

}// end interface
