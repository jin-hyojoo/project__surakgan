package service;

import java.util.List;
import java.util.Map;

import dao.MypageDAO;
import dto.Information_CommentDTO;
import dto.OderDTO;

public class MypageServiceImp implements MypageService{
	private MypageDAO dao;
	
	public MypageServiceImp() {
		
	}
	
	public void setDao(MypageDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<Information_CommentDTO> myreviewList(int u_no) {
		return dao.myreviewList(u_no);
	}

	@Override 
	public void reviewDel(int ic_no) {
		dao.reviewDel(ic_no);
	}

	@Override
	public void reviewUpt(Information_CommentDTO dto) {
		dao.reviewUpt(dto);
	}

	@Override
	public List<OderDTO> myorderList(Map<String, Object> map) {
		return dao.myorderList(map);
	}

	@Override
	public List<OderDTO> detailOrder(Map<String, Object> map) {
		return dao.detailOrder(map);
	}
	
}
