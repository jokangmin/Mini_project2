package qna.bean;

import java.util.Date;

public class QnaDTO {
	private int seq;           			// 글 번호
    private String qnaId;      			// 글 작성자
    private String qnaCheck;   			// 비밀글 여부
    private String qnaUserContent; 		// 사용자 문의 글 내용
    private String qnaAdminContent;		// 관리자가 해당 글에 대한 답글 
    private Date logtime;      			// 글 작성 날짜
    
	public QnaDTO() {}

	public QnaDTO(int seq, String qnaId, String qnaCheck, String qnaUserContent, String qnaAdminContent, Date logtime) {
		super();
		this.seq = seq;
		this.qnaId = qnaId;
		this.qnaCheck = qnaCheck;
		this.qnaUserContent = qnaUserContent;
		this.qnaAdminContent = qnaAdminContent;
		this.logtime = logtime;
	}

	public int getSeq() {
		return seq;
	}

	public String getQnaId() {
		return qnaId;
	}

	public String getQnaCheck() {
		return qnaCheck;
	}

	public String getQnaUserContent() {
		return qnaUserContent;
	}

	public String getQnaAdminContent() {
		return qnaAdminContent;
	}

	public Date getLogtime() {
		return logtime;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public void setQnaId(String qnaId) {
		this.qnaId = qnaId;
	}

	public void setQnaCheck(String qnaCheck) {
		this.qnaCheck = qnaCheck;
	}

	public void setQnaUserContent(String qnaUserContent) {
		this.qnaUserContent = qnaUserContent;
	}

	public void setQnaAdminContent(String qnaAdminContent) {
		this.qnaAdminContent = qnaAdminContent;
	}

	public void setLogtime(Date logtime) {
		this.logtime = logtime;
	}
	
	

	
    
}
