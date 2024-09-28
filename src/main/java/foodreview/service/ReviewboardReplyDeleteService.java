package foodreview.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import foodreview.dao.FoodreviewDAO;

public class ReviewboardReplyDeleteService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		FoodreviewDAO foodreviewDAO = FoodreviewDAO.getInstance();
		
		String seq1 = request.getParameter("seq");
		String seq2 = request.getParameter("parent_seq");
		
		int seq = 0;
		int parent_seq = 0;
	    if (seq1 != null && !seq1.trim().isEmpty()) {
	        try {
	        	seq = Integer.parseInt(seq1);
	        } catch (NumberFormatException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    if (seq2 != null && !seq2.trim().isEmpty()) {
	        try {
	        	parent_seq = Integer.parseInt(seq2);
	        } catch (NumberFormatException e) {
	            e.printStackTrace();
	        }
	    }
	    foodreviewDAO.replycountDown(parent_seq);
	    foodreviewDAO.ReplyreplyParentDelete_reply(seq);
	    foodreviewDAO.reviewReplyDelete(seq);
		
		return "none";
	}

}
