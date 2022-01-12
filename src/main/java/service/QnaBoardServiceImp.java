package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import dao.QnaDAO;
import dto.PageDTO;
import dto.QnaDTO;
import dto.SearchDTO;

public class QnaBoardServiceImp implements QnaBoardService {
	private QnaDAO qdao;

	public QnaBoardServiceImp() { }
	
	public void setQdao(QnaDAO qdao) {
		this.qdao = qdao;
	}

	@Override
	public int countProcessMethod(SearchDTO sdto) {
		return qdao.countMethod(sdto);
	}

	@Override
	public List<QnaDTO> listProcessMethod(PageDTO pdto, SearchDTO sdto) {
		return qdao.listMethod(pdto, sdto);
	}

	@Override
	public void saveProcessMethod(QnaDTO qdto) {
		qdao.saveMethod(qdto);
	}

	@Override
	public QnaDTO contentProcessMethod(int num) {
		qdao.readCountMethod(num);
		return qdao.contentMethod(num);
	}

	@Override
	public void reStepProcessMethod(QnaDTO qdto) {
	     qdao.reStepCountMethod(qdto);
	     qdto.setQ_step(qdto.getQ_step()+1);
	     qdto.setQ_level(qdto.getQ_level()+1);
	     qdao.saveMethod(qdto);
	}

	@Override
	public QnaDTO updateSelectProcessMethod(int num) {
		//content랑 동일기능. 따라서 updateNum대신 content(num)으로 사용해도 됨
		return qdao.contentMethod(num);
	}

	@Override
	public void updateProcessMethod(QnaDTO qdto, HttpServletRequest request) {
		qdao.updateMethod(qdto);
	}

	//게시글 삭제
	@Override
	public void deleteProcessMethod(int num, HttpServletRequest request) {
		  qdao.deleteMethod(num);
	}

}//end class
