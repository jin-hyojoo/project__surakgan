package service;

import java.util.List;
import java.util.Map;

import dao.AdminDAO;
import dto.InformationDTO;
import dto.Information_ImageDTO;
import dto.NoticeDTO;
import dto.OderDTO;
import dto.PageDTO;
import dto.QnaDTO;
import dto.UsersDTO;

public class AdminServiceImp implements AdminService {
	private AdminDAO dao;
	
	public AdminServiceImp() {
		
	}
	
	public void setDao(AdminDAO dao) {
		this.dao = dao;
	}

	@Override
	public int totalUserList(Map<String, Object> map) {
		return dao.totalUserList(map);
	}
	
	@Override
	public int totalProductList(Map<String, Object> map) {
		return dao.totalProductList(map);
	}
	
	@Override
	public int totalQnaList(Map<String, Object> map) {
		return dao.totalQnaList(map);
	}

	@Override
	public int totalNoticeList(Map<String, Object> map) {
		return dao.totalNoticeList(map);
	}

	@Override
	public List<UsersDTO> userList(PageDTO pdto) {
		return dao.userList(pdto);
	}

	@Override
	public List<InformationDTO> productList(PageDTO pdto) {
		return dao.productList(pdto);
	}

	@Override
	public List<QnaDTO> qnaList(PageDTO pdto) {
		return dao.qnaList(pdto);
	}

	@Override
	public List<NoticeDTO> noticeList(PageDTO pdto) {
		return dao.noticeList(pdto);
	}

	@Override
	public void updateGrade(int no, int grade) {
		dao.updateGrade(no, grade);
	}

	@Override
	public int insertInfo(InformationDTO dto) {
		return dao.insertInfo(dto);
	}

	@Override
	public void insertInfoImg(List<Information_ImageDTO> list) {
		dao.insertInfoImg(list);
	}

	@Override
	public void uptInfoState(Map<String, Object> map) {
		dao.uptInfoState(map);
	}

	@Override
	public List<String> lunchboxList(int on_no) {
		return dao.lunchboxList(on_no);
	}

	@Override
	public void lunchboxUpt(int on_no) {
		dao.lunchboxUpt(on_no);
	}

	@Override
	public OderDTO depositChk(int o_no) {
		return dao.depositChk(o_no);
	}
	
	

}
