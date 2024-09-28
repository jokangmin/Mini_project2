package foodreview.replyreplybean;

import java.sql.Date;

public class ReviewboardReplyreplyDTO {
	private int seq;
	private String replyreplyid;
	private String replyreplycontent;
	private int ref;
	private int refref;
	private int step;
	private Date logtime;
	
	public int getRefref() {
		return refref;
	}

	public void setRefref(int refref) {
		this.refref = refref;
	}

	public ReviewboardReplyreplyDTO() {}
	
	public ReviewboardReplyreplyDTO(int seq, String replyreplyid, String replyreplycontent, int ref, int step,
			Date logtime) {
		super();
		this.seq = seq;
		this.replyreplyid = replyreplyid;
		this.replyreplycontent = replyreplycontent;
		this.ref = ref;
		this.step = step;
		this.logtime = logtime;
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getReplyreplyid() {
		return replyreplyid;
	}
	public void setReplyreplyid(String replyreplyid) {
		this.replyreplyid = replyreplyid;
	}
	public String getReplyreplycontent() {
		return replyreplycontent;
	}
	public void setReplyreplycontent(String replyreplycontent) {
		this.replyreplycontent = replyreplycontent;
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
	public Date getLogtime() {
		return logtime;
	}
	public void setLogtime(Date logtime) {
		this.logtime = logtime;
	}

	@Override
	public String toString() {
		return "ReviewboardReplyreplyDTO [seq=" + seq + ", replyreplyid=" + replyreplyid + ", replyreplycontent="
				+ replyreplycontent + ", ref=" + ref + ", step=" + step + ", logtime=" + logtime + "]";
	}
	
	
}
