package foodreview.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

public class ReviewboardWriteFormService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("memName");
		
		request.setAttribute("id", id);
		request.setAttribute("name", name);
		
		return "/reviewboard/reviewboardWriteForm.jsp";
	}

}
