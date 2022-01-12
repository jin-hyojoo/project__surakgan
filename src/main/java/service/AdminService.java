package service;

import java.util.List;
import java.util.Map;

import dto.InformationDTO;
import dto.Information_ImageDTO;
import dto.NoticeDTO;
import dto.OderDTO;
import dto.PageDTO;
import dto.QnaDTO;
import dto.UsersDTO;

public interface AdminService {
	//리스트출력
	public int totalUserList(Map<String, Object> map);
	public int totalProductList(Map<String, Object> map);
	public int totalQnaList(Map<String, Object> map);
	public int totalNoticeList(Map<String, Object> map);
	
	public List<UsersDTO> userList(PageDTO pdto);
	public List<InformationDTO> productList(PageDTO pdto);
	public List<QnaDTO> qnaList(PageDTO pdto);
	public List<NoticeDTO> noticeList(PageDTO pdto);
	//유저등급수정
	public void updateGrade(int no, int grade);
	//상품등록
	public int insertInfo(InformationDTO dto);
	public void insertInfoImg(List<Information_ImageDTO> list);
	//상품삭제
	public void uptInfoState(Map<String, Object> map);
	
	//주문내역
	public List<String> lunchboxList(int on_no);
	public void lunchboxUpt(int on_no);
	public OderDTO depositChk(int o_no);
	
}
