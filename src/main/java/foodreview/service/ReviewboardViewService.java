package foodreview.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import foodreview.bean.FoodreviewDTO;
import foodreview.dao.FoodreviewDAO;
import foodreview.replybean.ReviewboardReplyDTO;
import foodreview.replyreplybean.ReviewboardReplyreplyDTO;

public class ReviewboardViewService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String seq = request.getParameter("seq");
		String pg = request.getParameter("pg");
		
		if (pg == null || pg.trim().isEmpty()) {
		    pg = "1"; // 기본값 설정
		}
		int pgInt = Integer.parseInt(pg);
		
		FoodreviewDAO foodreviewDAO = FoodreviewDAO.getInstance();
		
		int seq1 = Integer.parseInt(seq.trim());
		
		FoodreviewDTO foodreviewDTO = null;
		
		foodreviewDAO.ContentHit(seq1);
		
		foodreviewDTO = foodreviewDAO.contentSelect(seq1);
		
		List<ReviewboardReplyDTO> replyList = foodreviewDAO.getReplies(seq1);
		
		List<ReviewboardReplyreplyDTO> replyreplyList = foodreviewDAO.getreplyreplyReplies(seq1);
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("memName");
		
		request.setAttribute("pg", pgInt);
		request.setAttribute("my_id", id);
		request.setAttribute("my_name", name);
		request.setAttribute("seq", seq1);
		request.setAttribute("replyList", replyList);
		request.setAttribute("replyreplyList", replyreplyList);
		request.setAttribute("foodreviewDTO", foodreviewDTO);
		request.setAttribute("foodreviewDAO", foodreviewDAO);
		
		return "/reviewboard/reviewboardView.jsp";
	}

}
