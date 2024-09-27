package foodreview.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import foodreview.dao.FoodreviewDAO;
import foodreview.replybean.ReviewboardReplyDTO;

public class ReviewboardReplyService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		
		String replyid = (String)session.getAttribute("id");
		String replycontent = request.getParameter("replyContent");
		String ref = request.getParameter("ref");
		String pg = request.getParameter("pg");
		
		if (pg == null || pg.trim().isEmpty()) {
		    pg = "1"; // 기본값 설정
		}
		int pgInt = Integer.parseInt(pg);
		
		int get_ref = Integer.parseInt(ref);
		
		ReviewboardReplyDTO reviewboardReplyDTO = new ReviewboardReplyDTO();
		reviewboardReplyDTO.setReplyid(replyid);
		reviewboardReplyDTO.setReplycontent(replycontent);
		reviewboardReplyDTO.setRef(get_ref);
		
		FoodreviewDAO foodreviewDAO = FoodreviewDAO.getInstance();
		
		foodreviewDAO.replyInsert(reviewboardReplyDTO);
		
		request.setAttribute("ref", get_ref);
		request.setAttribute("pg", pgInt);
		
		return "/reviewboard/replyInsert.jsp";
	}

}
