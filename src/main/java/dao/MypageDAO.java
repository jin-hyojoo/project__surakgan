package dao;

import java.util.List;
import java.util.Map;

import dto.Information_CommentDTO;
import dto.OderDTO;

public interface MypageDAO {
	//후기
	public List<Information_CommentDTO> myreviewList(int u_no);
	public void reviewDel(int ic_no);
	public void reviewUpt(Information_CommentDTO dto);
	
	//주문내역
	public List<OderDTO> myorderList(Map<String, Object> map);
	public List<OderDTO> detailOrder(Map<String, Object> map);
}
