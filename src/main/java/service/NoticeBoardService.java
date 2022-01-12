package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.PageDTO;
import dto.NoticeDTO;
import dto.SearchDTO;

public interface NoticeBoardService {
	public int countProcessMethod(SearchDTO sdto); 
	public List<NoticeDTO> listProcessMethod(PageDTO pdto, SearchDTO sdto);
	public void saveProcessMethod(NoticeDTO ndto);
	public NoticeDTO contentProcessMethod(int num);
	public void reStepProcessMethod(NoticeDTO ndto);
	public NoticeDTO updateSelectProcessMethod(int num);
	public void updateProcessMethod(NoticeDTO ndto,HttpServletRequest request);
	public void deleteProcessMethod(int num,HttpServletRequest request);
}//end interface
