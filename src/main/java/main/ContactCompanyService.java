package main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

public class ContactCompanyService implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		HttpSession session = request.getSession();
		
		String userID=(String)session.getAttribute("id");
		
		request.setAttribute("userID", userID);
		
		return "/contact/contact_company.jsp";
	}
}
