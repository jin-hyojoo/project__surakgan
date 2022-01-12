package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.InformationDTO;
import dto.Information_ImageDTO;
import dto.NoticeDTO;
import dto.OderDTO;
import dto.PageDTO;
import dto.QnaDTO;
import dto.UsersDTO;

public class AdminDaoImp implements AdminDAO{
	SqlSessionTemplate sqlsession;
	
	public AdminDaoImp() {
		
	}
	
	public void setSqlsession(SqlSessionTemplate sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Override
	public int totalUserList(Map<String, Object> map) {
		return sqlsession.selectOne("admin.totUserList", map);
	}
	
	@Override
	public int totalProductList(Map<String, Object> map) {
		return sqlsession.selectOne("admin.totProductList", map);
	}
	
	@Override
	public int totalQnaList(Map<String, Object> map) {
		return sqlsession.selectOne("admin.totQnaList", map);
	}

	@Override
	public int totalNoticeList(Map<String, Object> map) {
		return sqlsession.selectOne("admin.totNoticeList", map);
	}

	@Override
	public List<UsersDTO> userList(PageDTO pdto) {
		return sqlsession.selectList("admin.userList", pdto);
	}
	
	@Override
	public List<InformationDTO> productList(PageDTO pdto) {
		return sqlsession.selectList("admin.productList", pdto);
	}
	
	@Override
	public List<QnaDTO> qnaList(PageDTO pdto) {
		return sqlsession.selectList("admin.qnaList", pdto);
	}

	@Override
	public List<NoticeDTO> noticeList(PageDTO pdto) {
		return sqlsession.selectList("admin.noticeList", pdto);
	}

	@Override
	public void updateGrade(int no, int grade) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("grade", grade);
		sqlsession.update("admin.uptGrade", map);
	}

	@Override
	public int insertInfo(InformationDTO dto) {
		sqlsession.insert("admin.insertInfo", dto);
		return sqlsession.selectOne("admin.maxI_no");
	}

	@Override
	public void insertInfoImg(List<Information_ImageDTO> list) {
		sqlsession.insert("admin.insertInfoImg", list);
	}

	@Override
	public void uptInfoState(Map<String, Object> map) { 
		sqlsession.update("admin.uptInfoState", map);
	}

	@Override
	public List<String> lunchboxList(int on_no) {
		return sqlsession.selectList("admin.lunchboxOrderList", on_no);
	}

	@Override
	public void lunchboxUpt(int on_no) {
		sqlsession.update("admin.lunchboxStateUpt", on_no);
	}

	@Override
	public OderDTO depositChk(int o_no) {
		sqlsession.update("admin.depositChk", o_no);
		return sqlsession.selectOne("admin.depositVal", o_no);
	}
	

}
