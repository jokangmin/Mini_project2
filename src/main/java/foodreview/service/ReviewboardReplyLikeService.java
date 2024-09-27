package foodreview.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import foodreview.dao.FoodreviewDAO;

public class ReviewboardReplyLikeService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String seq1 = request.getParameter("like_seq");
		String pg = request.getParameter("like_pg");
		String p_seq = request.getParameter("seq");
		
		int seq = 0;
		
		if (pg == null || pg.trim().isEmpty()) {
		    pg = "1"; // 기본값 설정
		}
		int pgInt = Integer.parseInt(pg);
		
		if (seq1 != null && !seq1.trim().isEmpty()) {
	        try {
	        	seq = Integer.parseInt(seq1);
	        } catch (NumberFormatException e) {
	            e.printStackTrace();
	        }
	    }
		
		FoodreviewDAO foodreviewDAO = FoodreviewDAO.getInstance();
		
		foodreviewDAO.reviewReplyLike(seq);
		
		request.setAttribute("pg", pgInt);
		request.setAttribute("seq", p_seq);
		
		return "/reviewboard/reviewboardReplyLike.jsp";
	}

}
