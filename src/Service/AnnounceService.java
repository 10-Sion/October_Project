package Service;

import java.util.List;

import DAO.AnnounceDAO;
import DAO.AttendeeDAO;
import VO.AnnounceVO;
import VO.AttendeeVO;

public class AnnounceService {
	
	private AnnounceDAO announceDao = new  AnnounceDAO();
	private AttendeeDAO atndDao = new AttendeeDAO();
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

	public AttendeeVO getAttendee(String loginEmail) {
		return atndDao.getAttendee(loginEmail);
	}

	public String getExpoName(int expoID) {
		return atndDao.getExpoName(expoID);
	}

	public int UpdateAttend(AttendeeVO vo) {
		
		return atndDao.UpdateAttend(vo);
	}

	public int DelAttend(int atndID) {
		return atndDao.DelAttend(atndID);
	}

	public boolean CheckPass(String passwd, String loginEmail) {
		return atndDao.CheckPass(passwd, loginEmail);
	}
}
