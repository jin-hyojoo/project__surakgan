package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.PageDTO;
import dto.QnaDTO;
import dto.SearchDTO;

public interface QnaBoardService {
	public int countProcessMethod(SearchDTO sdto); 
	public List<QnaDTO> listProcessMethod(PageDTO pdto, SearchDTO sdto);
	public void saveProcessMethod(QnaDTO qdto);
	public QnaDTO contentProcessMethod(int num);
	public void reStepProcessMethod(QnaDTO qdto);
	public QnaDTO updateSelectProcessMethod(int num);
	public void updateProcessMethod(QnaDTO qdto,HttpServletRequest request);
	public void deleteProcessMethod(int num,HttpServletRequest request);
}//end interface
