package foodreview.bean;

import java.sql.Date;

public class FoodreviewDTO {
	private int seq;
	private String reviewid;
	private String reviewname;
	private String subject;
	private String content;
	private int ref;
	private int step;
	private int grade;
	private int likes;
	private int hit;
	private String image1;
	private int replycount;
	private Date logtime;
	
	public FoodreviewDTO() {}
	
	

	public FoodreviewDTO(int seq, String reviewid, String reviewname, String subject, String content, int ref, int step,
			int grade, int likes, int hit, String image1, int replycount, Date logtime) {
		this.seq = seq;
		this.reviewid = reviewid;
		this.reviewname = reviewname;
		this.subject = subject;
		this.content = content;
		this.ref = ref;
		this.step = step;
		this.grade = grade;
		this.likes = likes;
		this.hit = hit;
		this.image1 = image1;
		this.replycount = replycount;
		this.logtime = logtime;
	}
	


	@Override
	public String toString() {
		return "FoodreviewDTO [seq=" + seq + ", reviewid=" + reviewid + ", reviewname=" + reviewname + ", subject="
				+ subject + ", content=" + content + ", ref=" + ref + ", step=" + step + ", grade=" + grade + ", likes="
				+ likes + ", hit=" + hit + ", image1=" + image1 + ", replycount=" + replycount + ", logtime=" + logtime
				+ "]";
	}


	public int getReplycount() {
		return replycount;
	}


	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}


	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getReviewid() {
		return reviewid;
	}
	public void setReviewid(String reviewid) {
		this.reviewid = reviewid;
	}
	public String getReviewname() {
		return reviewname;
	}
	public void setReviewname(String reviewname) {
		this.reviewname = reviewname;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public Date getLogtime() {
		return logtime;
	}
	public void setLogtime(Date logtime) {
		this.logtime = logtime;
	}
	
	
}
