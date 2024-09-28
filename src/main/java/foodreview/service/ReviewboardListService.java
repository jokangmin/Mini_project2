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
	    String searchTerm = request.getParameter("searchTerm");
	    String searchType = request.getParameter("searchType"); // 검색 타입 추가
	    String order = request.getParameter("sortType");

	    // 기본값 설정
	    if (order == null || order.trim().isEmpty()) {
	        order = "seq"; // 기본 정렬 순서
	    }

	    if (pg == null || pg.trim().isEmpty()) {
	        pg = "1"; // 기본값 설정
	    }

	    int pgInt;
	    try {
	        pgInt = Integer.parseInt(pg);
	    } catch (NumberFormatException e) {
	        pgInt = 1; // 기본값 설정
	    }

	    int totalA;
	    List<FoodreviewDTO> list;

	    // 검색어가 있을 경우
	    if (searchTerm != null && !searchTerm.trim().isEmpty()) {
	        // 검색 타입에 따라 검색 처리
	        if ("title".equals(searchType)) {
	            totalA = foodreviewDAO.getTotalByTitle(searchTerm); // 제목으로 검색
	            int endNum = pgInt * 9;
	            int startNum = endNum - 9;
	            list = foodreviewDAO.searchFoodReviewsByTitle(searchTerm, startNum, endNum, order);
	        } else if ("content".equals(searchType)) {
	            totalA = foodreviewDAO.getTotalByContent(searchTerm); // 내용으로 검색
	            int endNum = pgInt * 9;
	            int startNum = endNum - 9;
	            list = foodreviewDAO.searchFoodReviewsByContent(searchTerm, startNum, endNum, order);
	        } else if ("both".equals(searchType)) {
	            totalA = foodreviewDAO.getTotalBySearchTerm(searchTerm); // 제목 + 내용으로 검색
	            int endNum = pgInt * 9;
	            int startNum = endNum - 9;
	            list = foodreviewDAO.searchFoodReviews(searchTerm, startNum, endNum, order);
	        } else {
	            totalA = foodreviewDAO.getTotal();
	            list = foodreviewDAO.select((pgInt - 1) * 9, 9, order); // 기본 검색
	        }
	    } else {
	        totalA = foodreviewDAO.getTotal();
	        int endNum = pgInt * 9;
	        int startNum = endNum - 9;
	        list = foodreviewDAO.select(startNum, endNum, order);
	    }

	    FoodreviewPaging foodreviewPaging = new FoodreviewPaging();
	    foodreviewPaging.setPageSize(9);
	    foodreviewPaging.setPageBlock(3);
	    foodreviewPaging.setTotalA(totalA);
	    foodreviewPaging.setCurrentPage(pgInt);

	    // 추가
	    foodreviewPaging.setSearchTerm(searchTerm); // searchTerm 설정
	    foodreviewPaging.setSearchType(searchType);
	    foodreviewPaging.setSortType(order);

	    foodreviewPaging.makeFoodReviewPagingHTML();

	    request.setAttribute("pg", pgInt);
	    request.setAttribute("list", list);
	    request.setAttribute("totalA", totalA);
	    request.setAttribute("foodreviewPaging", foodreviewPaging);
	    request.setAttribute("searchTerm", searchTerm); 
	    request.setAttribute("searchType", searchType); // 검색 타입 추가
	    request.setAttribute("order", order);

	    return "/travel/travel2.jsp";
	}

}
