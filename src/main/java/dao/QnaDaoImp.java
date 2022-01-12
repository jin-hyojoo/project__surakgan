package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.PageDTO;
import dto.QnaDTO;
import dto.SearchDTO;

public class QnaDaoImp implements QnaDAO{
	private SqlSessionTemplate sqlSession;
	
	public QnaDaoImp() {

	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int countMethod(SearchDTO sdto) {
		return sqlSession.selectOne("board.count",sdto);
	}

	@Override
	public List<QnaDTO> listMethod(PageDTO pdto, SearchDTO sdto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pdto", pdto);
		map.put("sdto", sdto);
		
		return sqlSession.selectList("board.list",map);
	}

	@Override
	public void readCountMethod(int num) {
		sqlSession.update("board.readCount",num);		
	}

	@Override
	public QnaDTO contentMethod(int num) {
		return sqlSession.selectOne("board.content",num);
	}

	@Override
	public void reStepCountMethod(QnaDTO qdto) {
		sqlSession.update("board.reStepCount",qdto);
	}

	@Override
	public void saveMethod(QnaDTO qdto) {
		sqlSession.insert("board.save", qdto);
	}

	@Override
	public void updateMethod(QnaDTO qdto) {
		sqlSession.update("board.update", qdto);
		
	}

	@Override
	public void deleteMethod(int num) {
		sqlSession.delete("board.delete", num);
	}

}//end class
