package qna.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import qna.bean.QnaDTO;
import qna.dao.QnaDAO;

public class ReplyWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int seq = Integer.parseInt(request.getParameter("seq"));
		String qnaAdminContent = request.getParameter("replyContent");
		System.out.println("seq : "+ seq);
		System.out.println("qnaAdminContent : "+ qnaAdminContent);
		
		QnaDTO qnaDTO = new QnaDTO();
		qnaDTO.setSeq(seq);
		qnaDTO.setQnaAdminContent(qnaAdminContent);
		
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.update(qnaDTO);
		
		return "none";
	}

}
