package foodreview.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

public class ReviewboardUpdateFormService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("memName");
		String seq1 = request.getParameter("seq");
		String pg = request.getParameter("pg");
		
		if (pg == null || pg.trim().isEmpty()) {
		    pg = "1"; // 기본값 설정
		}
		int pgInt = Integer.parseInt(pg);
		
		int seq = Integer.parseInt(seq1.trim());
		
		request.setAttribute("id", id);
		request.setAttribute("name", name);
		request.setAttribute("seq", seq);
		request.setAttribute("pg", pgInt);
		
		return "/reviewboard/reviewboardUpdateForm.jsp";
	}

}
