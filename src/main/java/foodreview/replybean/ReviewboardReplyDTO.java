package foodreview.replybean;

import java.sql.Date;

public class ReviewboardReplyDTO {
	private int seq;
	private String replyid;
	private String replycontent;
	private int ref;
	private int step;
	private int likes;
	private Date logtime;
	
	public ReviewboardReplyDTO() {}
	
	public ReviewboardReplyDTO(String replyid, String replycontent, int ref) {
		this.replyid = replyid;
		this.replycontent = replycontent;
		this.ref = ref;
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getReplyid() {
		return replyid;
	}
	public void setReplyid(String replyid) {
		this.replyid = replyid;
	}
	public String getReplycontent() {
		return replycontent;
	}
	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
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
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public Date getLogtime() {
		return logtime;
	}
	public void setLogtime(Date logtime) {
		this.logtime = logtime;
	}
	
	
}
