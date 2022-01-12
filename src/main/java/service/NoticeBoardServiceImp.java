package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.NoticeDAO;
import dto.PageDTO;
import dto.NoticeDTO;
import dto.SearchDTO;

public class NoticeBoardServiceImp implements NoticeBoardService {
	private NoticeDAO ndao;

	public NoticeBoardServiceImp() { }
	
	public void setNdao(NoticeDAO ndao) {
		this.ndao = ndao;
	}

	@Override
	public int countProcessMethod(SearchDTO sdto) {
		return ndao.countMethod(sdto);
	}

	@Override
	public List<NoticeDTO> listProcessMethod(PageDTO pdto, SearchDTO sdto) {
		return ndao.listMethod(pdto, sdto);
	}

	@Override
	public void saveProcessMethod(NoticeDTO ndto) {
		ndao.saveMethod(ndto);
	}

	@Override
	public NoticeDTO contentProcessMethod(int num) {
		ndao.readCountMethod(num);
		return ndao.contentMethod(num);
	}

	@Override
	public void reStepProcessMethod(NoticeDTO ndto) {
		 ndao.reStepCountMethod(ndto);
	     ndto.setN_step(ndto.getN_step()+1);
	     ndto.setN_level(ndto.getN_level()+1);
	     ndao.saveMethod(ndto);
	}

	@Override
	public NoticeDTO updateSelectProcessMethod(int num) {
		return ndao.contentMethod(num);
	}

	@Override
	public void updateProcessMethod(NoticeDTO ndto, HttpServletRequest request) {
		ndao.updateMethod(ndto);
	}

	@Override
	public void deleteProcessMethod(int num, HttpServletRequest request) {
		ndao.deleteMethod(num);
	}

}//end class
