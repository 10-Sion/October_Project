package VO;

import java.sql.Date;

import javafx.scene.chart.PieChart.Data;

public class qnaVO {
	
	private int Faqid;
	private String Qtitle;
	private String QContent;
	private String Answer;
	private String Qdata;
	private String Poster;
	
	
	public int getFaqid() {
		return Faqid;
	}
	public void setFaqid(int faqid) {
		Faqid = faqid;
	}
	public String getQtitle() {
		return Qtitle;
	}
	public void setQtitle(String qtitle) {
		Qtitle = qtitle;
	}
	public String getQContent() {
		return QContent;
	}
	public void setQContent(String qContent) {
		QContent = qContent;
	}
	public String getAnswer() {
		return Answer;
	}
	public void setAnswer(String answer) {
		Answer = answer;
	}
	
	public String getQdata() {
		return Qdata;
	}
	public void setQdata(String qdata) {
		Qdata = qdata;
	}
	public String getPoster() {
		return Poster;
	}
	public void setPoster(String poster) {
		Poster = poster;
	}

}
