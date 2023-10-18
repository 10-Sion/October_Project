package DAO;

import java.util.List;

import VO.AnnounceVO;

public interface AnnounceInterface {
	
	//공지사항 리스트를 가져오는 메소드
	public List getAnnounceList(String keyField,String keyWord);
	
	//공지사항 입력 메소드
	public void InsertNotice(AnnounceVO vo);

}
