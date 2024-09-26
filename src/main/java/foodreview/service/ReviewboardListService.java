package foodreview.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import foodreview.bean.FoodreviewDTO;
import foodreview.bean.FoodreviewPaging;
import foodreview.dao.FoodreviewDAO;

public class ReviewboardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		FoodreviewDAO foodreviewDAO = FoodreviewDAO.getInstance();
		
		String pg = request.getParameter("pg");
		
		if (pg == null || pg.trim().isEmpty()) {
		    pg = "1"; // 기본값 설정
		}
		int pgInt = Integer.parseInt(pg);
		
		int totalA = foodreviewDAO.getTotal();
		
		
		FoodreviewPaging foodreviewPaging = new FoodreviewPaging();
		
		foodreviewPaging.setPageSize(9);
		foodreviewPaging.setPageBlock(3);
		foodreviewPaging.setTotalA(totalA);
		foodreviewPaging.setCurrentPage(Integer.parseInt(pg));
		
		foodreviewPaging.makeFoodReviewPagingHTML();
		
		int endNum = Integer.parseInt(pg) * 9; 
		int startNum = endNum - 8;
		
		List<FoodreviewDTO> List = foodreviewDAO.select(startNum, endNum);
		
		request.setAttribute("pg", pgInt);
		request.setAttribute("List", List);
		request.setAttribute("totalA", totalA);
		request.setAttribute("foodreviewPaging", foodreviewPaging);
		
		return "/travel/travel2.jsp";
	}

}
