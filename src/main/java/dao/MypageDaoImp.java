package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.Information_CommentDTO;
import dto.OderDTO;

public class MypageDaoImp implements MypageDAO{
	private SqlSessionTemplate sqlSession;
	
	public MypageDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Information_CommentDTO> myreviewList(int u_no) {
		return sqlSession.selectList("king.myreview_list", u_no);
	}

	@Override
	public void reviewDel(int ic_no) {
		sqlSession.delete("king.reviewDel", ic_no);
	}

	@Override
	public void reviewUpt(Information_CommentDTO dto) {
		sqlSession.update("king.reviewUpt", dto);
	}

	@Override
	public List<OderDTO> myorderList(Map<String, Object> map) {
		int u_no = (int) map.get("u_no");
	    map.put("u_grade", sqlSession.selectOne("king.selectU_grade", u_no));
	    return sqlSession.selectList("king.myorder_list", map);
	}

	@Override
	public List<OderDTO> detailOrder(Map<String, Object> map) {
		return sqlSession.selectList("king.detailOrder", map);
	}

}
