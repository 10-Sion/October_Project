package VO;

import java.sql.Date;

public class AnnounceVO {
	
	 	private int AnnID; // 공지 글 번호
	    private String AnnTitle; //공지 제목
	    private String AnnContent; //공지 내용
	    private Date PostDate; //작성일
	    private String Poster; //작성자	
		public int getAnnID() {
			return AnnID;
		}
		public void setAnnID(int annID) {
			AnnID = annID;
		}
		public String getAnnTitle() {
			return AnnTitle;
		}
		public void setAnnTitle(String annTitle) {
			AnnTitle = annTitle;
		}
		public String getAnnContent() {
			return AnnContent;
		}
		public void setAnnContent(String annContent) {
			AnnContent = annContent;
		}
		public Date getPostDate() {
			return PostDate;
		}
		public void setPostDate(Date postDate) {
			PostDate = postDate;
		}
		public String getPoster() {
			return Poster;
		}
		public void setPoster(String poster) {
			Poster = poster;
		}
	    
	    
}
