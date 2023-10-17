package Service;

import java.util.List;

import DAO.AnnounceDAO;
import VO.AnnounceVO;

public class AnnounceService {
	
	private AnnounceDAO announceDao = new  AnnounceDAO();
	
//	public void setAnnounceDAO(AnnounceDAO announceDao) {
//		this.announceDao = announceDao;
//		}
//	
	 public List getAnnounceList(String keyField,String keyWord) {
		 List list = announceDao.getAnnounceList(keyField, keyWord);
		 return list;
	    }
	  
	  public void InsertNotice(AnnounceVO vo) {
		  announceDao.InsertNotice(vo); 
	   }
}
