package foodreview.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import foodreview.dao.FoodreviewDAO;

public class ReviewboardDeleteService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		FoodreviewDAO foodreviewDAO = FoodreviewDAO.getInstance();
		
		String seq1 = request.getParameter("seq");
		//String id = request.getParameter("id");
		//String pwd = request.getParameter("pwd");
		
		int seq = 0;
	    if (seq1 != null && !seq1.trim().isEmpty()) {
	        try {
	        	seq = Integer.parseInt(seq1);
	        } catch (NumberFormatException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    foodreviewDAO.ReplyreplyParentDelete(seq);
	    foodreviewDAO.ReplyParentDelete(seq);
	    foodreviewDAO.reviewDelete(seq);
	    
		return "none";
	}

}
