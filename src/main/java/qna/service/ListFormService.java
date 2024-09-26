package qna.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import qna.bean.QnaDTO;
import qna.bean.QnaPaging;
import qna.dao.QnaDAO;

public class ListFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession(); 
		int pg = Integer.parseInt(request.getParameter("pg"));
		String userID = (String) session.getAttribute("id");
		
		
		
		System.out.println("pg = " + pg);
		// 1페이지당 5개씩
		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		// DB 처리
		QnaDAO qnaDAO = QnaDAO.getInstance();
		List<QnaDTO> list = qnaDAO.list(startNum, endNum);
		
		// 페이징 처리
		int totalA = qnaDAO.getTotalA();
		int noCheck = qnaDAO.noCheck();
		QnaPaging qnaPaging = new QnaPaging();
		qnaPaging.setCurrentPage(pg);
		qnaPaging.setPageBlock(2);
		qnaPaging.setPageSize(5);
		qnaPaging.setTotalA(totalA);
		qnaPaging.makePaginHTML();
		
	    request.setAttribute("list", list);
	    request.setAttribute("totalA", totalA);
	    request.setAttribute("noCheck", noCheck);
	    request.setAttribute("pg", pg);
	    request.setAttribute("userID", userID);
	    request.setAttribute("qnaPaging", qnaPaging);
		
		return "/qna/qnaListForm.jsp";
	}

}
