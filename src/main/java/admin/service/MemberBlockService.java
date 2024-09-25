package admin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class MemberBlockService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String memberId = request.getParameter("id");
		 
		MemberDAO memberDAO = new MemberDAO();
		boolean success = memberDAO.blockMember(memberId);
			
		return "/main_admin/Block.jsp";
	}

}
