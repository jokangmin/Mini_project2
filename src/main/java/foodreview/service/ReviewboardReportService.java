package foodreview.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import foodreview.dao.FoodreviewDAO;

public class ReviewboardReportService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("review_id");
		
		FoodreviewDAO foodreviewDAO = FoodreviewDAO.getInstance();
		
		foodreviewDAO.reviewReport(id);
		
		return "/reviewboard/reviewboardReport.jsp";
	}

}
