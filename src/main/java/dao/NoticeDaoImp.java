package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.NoticeDTO;
import dto.PageDTO;
import dto.SearchDTO;

public class NoticeDaoImp implements NoticeDAO{
	private SqlSessionTemplate sqlSession;
	
	public NoticeDaoImp() { }
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int countMethod(SearchDTO sdto) {
		return sqlSession.selectOne("Nboard.count",sdto);
	}

	@Override
	public List<NoticeDTO> listMethod(PageDTO pdto, SearchDTO sdto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pdto", pdto);
		map.put("sdto", sdto);
		return sqlSession.selectList("Nboard.list",map);
	}

	@Override
	public void readCountMethod(int num) {
		sqlSession.update("Nboard.readCount",num);	
	}

	@Override
	public NoticeDTO contentMethod(int num) {
		return sqlSession.selectOne("Nboard.content",num);
	}

	@Override
	public void reStepCountMethod(NoticeDTO ndto) {
		sqlSession.update("Nboard.reStepCount",ndto);
	}

	@Override
	public void saveMethod(NoticeDTO ndto) {
		sqlSession.insert("Nboard.save", ndto);
	}

	@Override
	public void updateMethod(NoticeDTO ndto) {
		System.out.println(ndto.getN_no());
		sqlSession.update("Nboard.update", ndto);
		
	}

	@Override
	public void deleteMethod(int num) {
		sqlSession.delete("Nboard.delete", num);
	}
	
}//end class
